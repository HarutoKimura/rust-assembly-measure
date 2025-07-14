// Test harness generator for BINSEC formal verification
// Note: fs and Path are already imported in build.rs

pub struct HarnessInfo {
    pub function_name: String,
    pub curve_name: String,
    pub operation: String,
    pub field_size: usize,
    pub obj_file: String,
}

pub fn generate_binsec_test_harness(info: &HarnessInfo) -> Result<String, String> {
    let harness_dir = format!("binsec-validation/harnesses/{}/{}", 
        info.curve_name, info.operation);
    fs::create_dir_all(&harness_dir)
        .map_err(|e| format!("Failed to create harness directory: {}", e))?;

    // Generate C source for test harness
    let harness_c = format!("{}/harness_{}.c", harness_dir, info.function_name);
    let harness_content = generate_harness_c_code(info);
    fs::write(&harness_c, harness_content)
        .map_err(|e| format!("Failed to write harness C file: {}", e))?;

    // Compile harness with the object file to create executable
    let harness_exe = format!("{}/test_{}", harness_dir, info.function_name);
    
    let compile_status = std::process::Command::new("gcc")
        .args(&[
            "-o", &harness_exe,
            &harness_c,
            &info.obj_file,
            "-static",  // Static linking for BINSEC
            "-O0",      // No optimization to preserve assembly behavior
            "-g",       // Debug symbols
        ])
        .status()
        .map_err(|e| format!("Failed to compile harness: {}", e))?;

    if !compile_status.success() {
        return Err("Failed to compile test harness".to_string());
    }

    Ok(harness_exe)
}

fn generate_harness_c_code(info: &HarnessInfo) -> String {
    match info.operation.as_str() {
        "mul" => generate_mul_harness(info),
        "square" => generate_square_harness(info),
        _ => generate_generic_harness(info),
    }
}

fn generate_mul_harness(info: &HarnessInfo) -> String {
    format!(r#"#include <stdint.h>
#include <string.h>
#include <stdlib.h>

// External assembly function
extern void {function_name}(uint64_t* out, const uint64_t* arg1, const uint64_t* arg2);

// Global variables for BINSEC to track
uint64_t secret_input1[{field_size}];
uint64_t secret_input2[{field_size}];
uint64_t public_output[{field_size}];

int main() {{
    // Initialize secret inputs with symbolic values
    // BINSEC will treat these as secret when marked in the config
    for (int i = 0; i < {field_size}; i++) {{
        secret_input1[i] = 0x1111111111111111ULL * (i + 1);
        secret_input2[i] = 0x2222222222222222ULL * (i + 1);
    }}
    
    // Call the assembly function
    {function_name}(public_output, secret_input1, secret_input2);
    
    // Return value based on output to prevent optimization
    return (int)(public_output[0] & 0xFF);
}}
"#,
        function_name = info.function_name,
        field_size = info.field_size,
    )
}

fn generate_square_harness(info: &HarnessInfo) -> String {
    format!(r#"#include <stdint.h>
#include <string.h>
#include <stdlib.h>

// External assembly function
extern void {function_name}(uint64_t* out, const uint64_t* arg1);

// Global variables for BINSEC to track
uint64_t secret_input[{field_size}];
uint64_t public_output[{field_size}];

int main() {{
    // Initialize secret input with symbolic values
    // BINSEC will treat this as secret when marked in the config
    for (int i = 0; i < {field_size}; i++) {{
        secret_input[i] = 0x3333333333333333ULL * (i + 1);
    }}
    
    // Call the assembly function
    {function_name}(public_output, secret_input);
    
    // Return value based on output to prevent optimization
    return (int)(public_output[0] & 0xFF);
}}
"#,
        function_name = info.function_name,
        field_size = info.field_size,
    )
}

fn generate_generic_harness(info: &HarnessInfo) -> String {
    // Generic harness for other operations
    format!(r#"#include <stdint.h>
#include <string.h>
#include <stdlib.h>

// External assembly function - generic signature
extern void {function_name}(uint64_t* out, const uint64_t* in);

// Global variables for BINSEC to track
uint64_t secret_input[{field_size}];
uint64_t public_output[{field_size}];

int main() {{
    // Initialize secret input
    for (int i = 0; i < {field_size}; i++) {{
        secret_input[i] = 0x4444444444444444ULL * (i + 1);
    }}
    
    // Call the assembly function
    {function_name}(public_output, secret_input);
    
    // Return value based on output
    return (int)(public_output[0] & 0xFF);
}}
"#,
        function_name = info.function_name,
        field_size = info.field_size,
    )
}

// Update BINSEC config to use global variable names
pub fn generate_binsec_config_with_globals(info: &HarnessInfo) -> String {
    match info.operation.as_str() {
        "mul" => {
            format!(r#"starting from <main>

with concrete stack pointer

secret global secret_input1, secret_input2
public global public_output

explore all
"#)
        }
        "square" => {
            format!(r#"starting from <main>

with concrete stack pointer

secret global secret_input
public global public_output

explore all
"#)
        }
        _ => {
            format!(r#"starting from <main>

with concrete stack pointer

secret global secret_input
public global public_output

explore all
"#)
        }
    }
}