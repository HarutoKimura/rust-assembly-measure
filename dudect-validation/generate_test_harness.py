#!/usr/bin/env python3
import os
import sys
import re

# Test configurations for different curves
CURVE_CONFIGS = {
    "curve25519": {
        "field_size": 4,
        "loose_bound": "0x18000000000000",
        "mul_functions": [
            ("rust_fiat_curve25519_carry_mul", "rust_fiat_curve25519_carry_mul(result, test_input1, test_input2);"),
            ("rust_fiat_curve25519_carry_mul_nasm", "rust_fiat_curve25519_carry_mul_nasm(result, test_input1, test_input2);"),
            ("rust_fiat_curve25519_carry_mul_CryptOpt", "rust_fiat_curve25519_carry_mul_CryptOpt(result, test_input1, test_input2);"),
        ],
        "square_functions": [
            ("rust_fiat_curve25519_carry_square", "rust_fiat_curve25519_carry_square(result, test_input1);"),
            ("rust_fiat_curve25519_carry_square_nasm", "rust_fiat_curve25519_carry_square_nasm(result, test_input1);"),
            ("rust_fiat_curve25519_carry_square_CryptOpt", "rust_fiat_curve25519_carry_square_CryptOpt(result, test_input1);"),
        ]
    },
    "poly1305": {
        "field_size": 3,
        "loose_bound": "0x300000000",
        "mul_functions": [
            ("rust_fiat_poly1305_carry_mul", "rust_fiat_poly1305_carry_mul(result, test_input1, test_input2);"),
            ("rust_fiat_poly1305_carry_mul_nasm", "rust_fiat_poly1305_carry_mul_nasm(result, test_input1, test_input2);"),
            ("rust_fiat_poly1305_carry_mul_CryptOpt", "rust_fiat_poly1305_carry_mul_CryptOpt(result, test_input1, test_input2);"),
        ],
        "square_functions": [
            ("rust_fiat_poly1305_carry_square", "rust_fiat_poly1305_carry_square(result, test_input1);"),
            ("rust_fiat_poly1305_carry_square_nasm", "rust_fiat_poly1305_carry_square_nasm(result, test_input1);"),
            ("rust_fiat_poly1305_carry_square_CryptOpt", "rust_fiat_poly1305_carry_square_CryptOpt(result, test_input1);"),
        ]
    },
    # Add more curves as needed
}

def generate_test_harness(curve_name, function_name, function_call, field_size, loose_bound, operation_type):
    """Generate a test harness for a specific function"""
    
    # Read template
    with open('src/test_harness_template.c', 'r') as f:
        template = f.read()
    
    # Create function declaration
    if operation_type == "mul":
        declaration = f"extern void {function_name}(uint64_t *out, const uint64_t *arg1, const uint64_t *arg2);"
    else:  # square
        declaration = f"extern void {function_name}(uint64_t *out, const uint64_t *arg1);"
    
    # Replace placeholders
    harness = template.replace("// FUNCTION_DECLARATION", declaration)
    harness = harness.replace("FUNCTION_NAME", function_name)
    harness = harness.replace("FUNCTION_CALL", function_call)
    harness = harness.replace("FIELD_SIZE_VALUE", str(field_size))
    harness = harness.replace("LOOSE_BOUND_VALUE", loose_bound)
    
    # For square operations, adjust the prepare_inputs function
    if operation_type == "square":
        # Modify to only use one input
        harness = harness.replace(
            "uint64_t *test_input2 = (uint64_t*)(data + FIELD_SIZE * sizeof(uint64_t));",
            "// Square operation - only one input needed"
        )
        harness = harness.replace(
            ".chunk_size = 2 * FIELD_SIZE * sizeof(uint64_t),",
            ".chunk_size = FIELD_SIZE * sizeof(uint64_t),"
        )
        harness = harness.replace(
            "uint64_t *current_input2 = (uint64_t*)(input_data + i * c->chunk_size + FIELD_SIZE * sizeof(uint64_t));",
            "// Square operation - only one input needed"
        )
        harness = harness.replace(
            "current_input2[j] = j + 1;",
            "// Square operation - only one input needed"
        )
        harness = harness.replace(
            "random_field_element(current_input2);",
            "// Square operation - only one input needed"
        )
    
    # Write output file
    output_dir = f"generated/{curve_name}/{operation_type}"
    os.makedirs(output_dir, exist_ok=True)
    
    output_file = f"{output_dir}/test_{function_name}.c"
    with open(output_file, 'w') as f:
        f.write(harness)
    
    return output_file

def generate_makefile(curve_name, test_files):
    """Generate a Makefile for compiling and running tests"""
    makefile_content = f"""# Makefile for {curve_name} constant-time validation
CC = clang
CFLAGS = -O2 -Wall -I../../src
LDFLAGS = -L../../../src/rust/{curve_name}/llc/mul -L../../../src/rust/{curve_name}/llc/square \\
          -L../../../src/rust/{curve_name}/llc-nasm/mul -L../../../src/rust/{curve_name}/llc-nasm/square \\
          -L../../../src/rust/{curve_name}/cryptopt/mul -L../../../src/rust/{curve_name}/cryptopt/square

# Test executables
TESTS = {' '.join([os.path.basename(f).replace('.c', '') for f in test_files])}

all: $(TESTS)

"""
    
    # Add compilation rules for each test
    for test_file in test_files:
        test_name = os.path.basename(test_file).replace('.c', '')
        lib_name = test_name.replace('test_', '')
        
        # Determine which libraries to link
        if 'mul' in test_file:
            if 'CryptOpt' in lib_name:
                lib_suffix = '_CryptOpt'
            elif 'nasm' in lib_name:
                lib_suffix = '_nasm'
            else:
                lib_suffix = ''
        else:  # square
            if 'CryptOpt' in lib_name:
                lib_suffix = '_CryptOpt'
            elif 'nasm' in lib_name:
                lib_suffix = '_nasm'
            else:
                lib_suffix = ''
        
        # Construct library name
        if 'mul' in test_file:
            base_lib = lib_name.replace('_nasm', '').replace('_CryptOpt', '')
            libs = f"-l{base_lib}{lib_suffix}"
        else:
            base_lib = lib_name.replace('_nasm', '').replace('_CryptOpt', '')
            libs = f"-l{base_lib}{lib_suffix}"
        
        makefile_content += f"""
{test_name}: {test_file}
\t$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS) {libs}
"""
    
    makefile_content += """
test: all
\t@echo "Running constant-time validation tests for """ + curve_name + """"
\t@failed=0; \\
\tfor test in $(TESTS); do \\
\t\techo "Running $$test..."; \\
\t\ttimeout 30 ./$$test || failed=$$((failed + 1)); \\
\tdone; \\
\tif [ $$failed -gt 0 ]; then \\
\t\techo "$$failed tests failed!"; \\
\t\texit 1; \\
\telse \\
\t\techo "All tests passed!"; \\
\tfi

clean:
\trm -f $(TESTS)

.PHONY: all test clean
"""
    
    output_dir = f"generated/{curve_name}"
    with open(f"{output_dir}/Makefile", 'w') as f:
        f.write(makefile_content)

def main():
    """Generate test harnesses for all configured curves"""
    
    for curve_name, config in CURVE_CONFIGS.items():
        print(f"Generating test harnesses for {curve_name}...")
        
        test_files = []
        
        # Generate multiplication tests
        for func_name, func_call in config.get("mul_functions", []):
            test_file = generate_test_harness(
                curve_name, func_name, func_call,
                config["field_size"], config["loose_bound"], "mul"
            )
            test_files.append(test_file)
            print(f"  Generated: {test_file}")
        
        # Generate square tests
        for func_name, func_call in config.get("square_functions", []):
            test_file = generate_test_harness(
                curve_name, func_name, func_call,
                config["field_size"], config["loose_bound"], "square"
            )
            test_files.append(test_file)
            print(f"  Generated: {test_file}")
        
        # Generate Makefile
        generate_makefile(curve_name, test_files)
        print(f"  Generated Makefile for {curve_name}")

if __name__ == "__main__":
    main()