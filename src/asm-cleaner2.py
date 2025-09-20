import re
import sys
import os # Import the os module for path manipulation

def clean_assembly_lines(lines, output_path=None):
    """
    Cleans assembly lines by removing comments, unnecessary keywords,
    and formatting whitespace. Converts AT&T syntax to NASM format.

    Args:
        lines: A list of strings, where each string is a line of assembly code.

    Returns:
        A string containing the cleaned and formatted assembly code.
    """
    cleaned_output_lines = []
    num_lines = len(lines)
    
    # Track input assembly dialect
    intel_syntax = False
    
    # Should we suffix the exported symbol with _nasm?
    suffix_symbol = False
    symbol_suffix = ""
    if output_path is not None:
        try:
            suffix_symbol = os.path.basename(output_path).endswith('_nasm.asm')
            symbol_suffix = "_nasm" if suffix_symbol else ""
        except Exception:
            suffix_symbol = False
            symbol_suffix = ""
    
    # Add NASM header (no blank lines to satisfy formatting request)
    cleaned_output_lines.append("section .text")
    
    # Track if we're in a function
    current_function = None
    
    for i, line in enumerate(lines):
        original_strip = line.strip()

        # Detect GAS Intel vs AT&T syntax toggles
        if original_strip.startswith('.intel_syntax'):
            intel_syntax = True
            continue
        if original_strip.startswith('.att_syntax'):
            intel_syntax = False
            continue

        # Handle specific directives
        if original_strip.startswith('.globl'):
            # Convert .globl to global
            parts = original_strip.split()
            if len(parts) >= 2:
                sym = parts[1]
                if symbol_suffix:
                    sym = f"{sym}{symbol_suffix}"
                cleaned_output_lines.append(f"GLOBAL {sym}")
            continue
            
        if original_strip.startswith('.type'):
            # Skip .type directives - not needed in NASM
            continue
            
        if original_strip.startswith('.align'):
            # Convert .align to ALIGN
            parts = original_strip.split()
            if len(parts) >= 2:
                cleaned_output_lines.append(f"ALIGN {parts[1]}")
            continue
            
        # Skip other directives, blank lines, and endbr64 instruction
        if original_strip.startswith('.') or not original_strip or "endbr64" in original_strip:
            continue

        # Remove comments starting with #
        line_no_comment = line.split('#')[0]
        if not line_no_comment.strip():
            continue # Skip if line is only a comment

        # --- Start Cleaning ---
        cleaned_line = line_no_comment
        
        # Handle function labels
        if original_strip.endswith(':') and not original_strip[0].isdigit():
            # This is a function label
            label_name = original_strip[:-1]
            # Check if it's a local label (starts with .)
            if label_name.startswith('.'):
                # In NASM, local labels need the function prefix
                if current_function:
                    label_name = f"{current_function}{label_name}"
            else:
                # This is a function label
                if symbol_suffix:
                    label_name = f"{label_name}{symbol_suffix}"
                current_function = label_name
            # Check if previous line was ALIGN - if so, insert label after ALIGN
            if cleaned_output_lines and cleaned_output_lines[-1].startswith('ALIGN'):
                align_line = cleaned_output_lines[-1]
                cleaned_output_lines[-1] = f"{label_name}:"
                cleaned_output_lines.append(align_line)
            else:
                cleaned_output_lines.append(f"{label_name}:")
            continue

        # ------------------------------------------------------------------
        # 1. Replace GAS specific tokens / prefixes
        # ------------------------------------------------------------------
        cleaned_line = cleaned_line.replace('ptr ', '')
        cleaned_line = cleaned_line.replace('PTR ', '')
        cleaned_line = cleaned_line.replace('movabs', 'mov')
        
        # Handle imulq with immediate value (special case)
        imul_match = re.search(r'imulq\s+\\?\$?(\d+),\s*%?(\w+),\s*%?(\w+)', cleaned_line)
        if imul_match:
            # Convert imulq $19,%rbp,%rdi to imul rdi,rbp,19
            num = imul_match.group(1)
            src = imul_match.group(2)
            dst = imul_match.group(3)
            cleaned_line = f"\timul {dst},{src},{num}"
            # Mark it as processed to skip further conversion
            imul_processed = True
        else:
            imul_processed = False
            cleaned_line = cleaned_line.replace('%', '')   # Remove register prefix
            cleaned_line = cleaned_line.replace('$', '')   # Remove immediate prefix (NASM uses no prefix)

            # Replace GAS instruction width suffixes (addq, movl, imulb …) -> add, mov, imul
            # Use a more precise regex that won't match 'mul' as 'mu' + 'l'
            cleaned_line = re.sub(r'\b(mov|add|sub|adc|sbb|cmp|and|or|xor|lea|push|pop|inc|dec|neg|not|imul|shl|shr|sal|sar|rol|ror|rcl|rcr|test|xchg)(?:q|l|w|b)\b', r'\1', cleaned_line)
            # Handle mulq separately since 'mul' without suffix is valid
            cleaned_line = re.sub(r'\bmulq\b', 'mul', cleaned_line)

        # Replace macro style numbers like \19 with plain 19
        cleaned_line = re.sub(r'\\(?P<num>\d+)', r'\g<num>', cleaned_line)

        # ------------------------------------------------------------------
        # 2. Convert AT&T style memory operands and reorder
        # ------------------------------------------------------------------
        def convert_and_reorder_instruction(instr: str) -> str:
            """Convert AT&T memory operands to NASM and reorder operands."""
            nonlocal current_function
            nonlocal intel_syntax
            
            # Split mnemonic and operands
            parts = instr.strip().split(None, 1)
            if len(parts) == 1:
                # No operands
                return f"\t{parts[0]}"
            
            mnemonic = parts[0]
            operands_str = parts[1]
            
            # Handle the case where we already processed imul
            if mnemonic == 'imul' and ',' in operands_str:
                # Already in correct format
                return instr
                
            # Split operands
            operands = []
            current_op = ""
            paren_depth = 0
            
            for char in operands_str:
                if char == '(':
                    paren_depth += 1
                elif char == ')':
                    paren_depth -= 1
                elif char == ',' and paren_depth == 0:
                    operands.append(current_op.strip())
                    current_op = ""
                    continue
                current_op += char
            
            if current_op:
                operands.append(current_op.strip())
            
            # Convert each operand
            converted_ops = []
            for op in operands:
                converted_ops.append(convert_operand(op))
            
            # Handle special instruction cases
            if mnemonic == 'lea':
                # lea uses plain brackets; ensure no size tokens
                for i, op in enumerate(converted_ops):
                    if op.startswith('QWORD['):
                        converted_ops[i] = op.replace('QWORD', '')
            
            # Handle jump instructions with local labels
            if mnemonic in ['jmp', 'je', 'jne', 'jz', 'jnz', 'jg', 'jge', 'jl', 'jle', 'ja', 'jae', 'jb', 'jbe', 'call']:
                if len(converted_ops) == 1 and converted_ops[0].startswith('.'):
                    # Convert local label reference
                    if current_function:
                        converted_ops[0] = f"{current_function}{converted_ops[0]}"
            
            # Reorder operands only for AT&T-style inputs
            # Intel-style inputs (from `.intel_syntax noprefix`) already use dest, src
            no_swap_instructions = ['mul', 'imul', 'div', 'idiv', 'cmp', 'test']

            if not intel_syntax:
                if len(converted_ops) == 2 and mnemonic not in no_swap_instructions:
                    # Swap for Intel syntax: dest, src
                    converted_ops = [converted_ops[1], converted_ops[0]]
            
            return f"\t{mnemonic} {','.join(converted_ops)}"
        
        def convert_operand(op: str) -> str:
            """Convert a single operand from AT&T to NASM format."""
            op = op.strip()
            
            # Quick exit if no parenthesis
            if '(' not in op:
                return op
            
            # Match patterns like (base), (base,index), (base,index,scale), disp(base), etc.
            # First try without displacement
            m = re.match(r'^\((?P<base>\w+)(?:,(?P<index>\w+)(?:,(?P<scale>\d+))?)?\)$', op)
            
            if not m:
                # Try with displacement
                m = re.match(r'^(?P<disp>[-+]?\d+(?:\*\d+)?)\((?P<base>\w+)(?:,(?P<index>\w+)(?:,(?P<scale>\d+))?)?\)$', op)
            
            if not m:
                return op  # Can't parse, return as-is
            
            base = m.group('base')
            index = m.group('index') if 'index' in m.groupdict() and m.group('index') else None
            scale = m.group('scale') if 'scale' in m.groupdict() and m.group('scale') else None
            disp = m.group('disp') if 'disp' in m.groupdict() and m.group('disp') else None
            
            # Handle displacement calculations
            if disp and '*' in disp:
                # Calculate 8*0, 8*1, etc.
                match = re.match(r'^(\d+)\*(\d+)$', disp)
                if match:
                    disp = str(int(match.group(1)) * int(match.group(2)))
            
            # Build NASM format
            parts = []
            if base:
                parts.append(base)
            
            if index:
                if scale:
                    parts.append(f"{index}*{scale}")
                else:
                    parts.append(index)
            
            if disp and disp != '0':
                parts.append(disp)
            
            if parts:
                return f"[{'+'.join(parts)}]"
            else:
                return "[0]"

        # Skip if already processed (like imul)
        if not (imul_processed or cleaned_line.endswith(':')):
            cleaned_line = convert_and_reorder_instruction(cleaned_line)

        # Remove local labels like 0:, 1:, etc.
        cleaned_line = re.sub(r'\b\d+:', '', cleaned_line)

        # Strip any residual size keywords (qword/dword/word/byte)
        cleaned_line = re.sub(r'\b(qword|dword|word|byte)\b\s*', '', cleaned_line, flags=re.IGNORECASE)

        # Remove extra whitespace
        cleaned_line = re.sub(r'\s+', ' ', cleaned_line.strip())

        cleaned_output_lines.append(cleaned_line)

        # Add a blank line after 'ret' for readability, but not if it's the last line
        # or the next line is already blank/comment/directive.
        if "ret" in cleaned_line and i < num_lines - 1:
             next_line_strip = lines[i+1].strip()
             if next_line_strip and not next_line_strip.startswith(('#', '.')):
                cleaned_output_lines.append('') # Add blank line

    return '\n'.join(cleaned_output_lines)

def main():
    """
    Main function to read an assembly file, clean it, and write the result
    to a new file.
    """
    if len(sys.argv) != 3:
        print("Usage: python3 clean_assembly.py <input_asm_file> <output_asm_file>")
        sys.exit(1)

    input_path = sys.argv[1]
    output_path = sys.argv[2]

    print(f"Input file: {input_path}")
    print(f"Output file: {output_path}")

    try:
        with open(input_path, 'r') as f:
            input_lines = f.readlines()
    except FileNotFoundError:
        print(f"Error: Input file not found: {input_path}", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Error reading file '{input_path}': {e}", file=sys.stderr)
        sys.exit(1)

    # Clean the assembly code
    cleaned_code = clean_assembly_lines(input_lines, output_path=output_path)

    # Write the cleaned code to the output file
    try:
        with open(output_path, 'w') as f_out:
            f_out.write(cleaned_code)
        print(f"Successfully cleaned assembly written to {output_path}")
    except Exception as e:
        print(f"Error writing to file '{output_path}': {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()