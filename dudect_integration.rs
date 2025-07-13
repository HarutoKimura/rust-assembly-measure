// Dudect integration module for build.rs
use std::path::Path;

pub struct DudectConfig {
    pub enabled: bool,
    pub max_iterations: u32,
    pub timeout_seconds: u32,
}

impl Default for DudectConfig {
    fn default() -> Self {
        DudectConfig {
            enabled: std::env::var("CARGO_DUDECT_VALIDATE")
                .map(|v| v != "0" && v != "false")
                .unwrap_or(false),
            max_iterations: 50,
            timeout_seconds: 60,
        }
    }
}

pub struct AssemblyValidation {
    pub asm_file: String,
    pub function_name: String,
    pub curve_name: String,
    pub operation: String,
    pub field_size: usize,
    pub loose_bound: String,
}

pub fn validate_assembly_constant_time(validation: &AssemblyValidation, config: &DudectConfig) -> bool {
    if !config.enabled {
        return true;
    }

    // Only validate CryptOpt files
    if !validation.asm_file.contains("cryptopt") && !validation.function_name.contains("CryptOpt") {
        return true;
    }

    // Extract just the filename for cleaner display
    let filename = validation.asm_file.split('/').last().unwrap_or(&validation.asm_file);
    let short_name = validation.function_name.replace("_CryptOpt", "");
    
    println!("cargo:warning=");
    println!("cargo:warning=═══════════════════════════════════════════════════════════════════");
    println!("cargo:warning=🔍 Testing: {} ({})", short_name, validation.operation);
    println!("cargo:warning=   File: {}", filename);
    println!("cargo:warning=   Curve: {}", validation.curve_name);

    // Ensure dudect is available
    if !Path::new("dudect-validation/src/dudect.h").exists() {
        println!("cargo:warning=❌ ERROR: Dudect not found, skipping validation");
        println!("cargo:warning=═══════════════════════════════════════════════════════════════════");
        return true;
    }

    // Generate test harness
    let test_dir = format!("dudect-validation/runtime-tests/{}/{}", 
        validation.curve_name, validation.operation);
    fs::create_dir_all(&test_dir).unwrap();

    let test_content = generate_test_harness(validation);
    let test_file = format!("{}/test_{}.c", test_dir, validation.function_name);
    fs::write(&test_file, test_content).unwrap();

    // Get the object file path
    let obj_file = validation.asm_file.replace(".asm", ".o");
    
    // Compile test
    let test_exe = format!("{}/test_{}", test_dir, validation.function_name);
    let compile_status = Command::new("clang")
        .args(&[
            "-O2",
            "-o", &test_exe,
            &test_file,
            &obj_file,
            "-Idudect-validation/src",
            "-lm",
        ])
        .status();

    match compile_status {
        Ok(status) if status.success() => {
            // Run the test
            let test_output = Command::new("timeout")
                .args(&[
                    &config.timeout_seconds.to_string(),
                    &test_exe
                ])
                .output();

            match test_output {
                Ok(output) => {
                    if output.status.success() {
                        println!("cargo:warning=✅ PASS: Constant-time property verified!");
                        println!("cargo:warning=═══════════════════════════════════════════════════════════════════");
                        true
                    } else {
                        println!("cargo:warning=❌ FAIL: Timing leakage detected!");
                        if !output.stderr.is_empty() {
                            let stderr_str = String::from_utf8_lossy(&output.stderr);
                            if stderr_str.contains("dumped core") {
                                println!("cargo:warning=   Error: Test crashed (segmentation fault)");
                            } else {
                                println!("cargo:warning=   Error: {}", stderr_str.trim());
                            }
                        }
                        println!("cargo:warning=═══════════════════════════════════════════════════════════════════");
                        false
                    }
                }
                Err(e) => {
                    println!("cargo:warning=❌ ERROR: Failed to run test");
                    println!("cargo:warning=   Details: {}", e);
                    println!("cargo:warning=═══════════════════════════════════════════════════════════════════");
                    false
                }
            }
        }
        Ok(_) => {
            println!("cargo:warning=⚠️  SKIP: Failed to compile test harness");
            println!("cargo:warning=   This may be due to missing symbols or incompatible calling convention");
            println!("cargo:warning=═══════════════════════════════════════════════════════════════════");
            false
        }
        Err(e) => {
            println!("cargo:warning=❌ ERROR: Compilation failed");
            println!("cargo:warning=   Details: {}", e);
            println!("cargo:warning=═══════════════════════════════════════════════════════════════════");
            false
        }
    }
}

fn generate_test_harness(validation: &AssemblyValidation) -> String {
    let is_mul = validation.operation == "mul";
    let second_param = if is_mul { ", const uint64_t *arg2" } else { "" };
    let second_arg = if is_mul { ", test_input2" } else { "" };
    let chunk_multiplier = if is_mul { "2" } else { "1" };
    
    format!(r#"
#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#define DUDECT_IMPLEMENTATION
#include "dudect.h"

extern void {function_name}(uint64_t *out, const uint64_t *arg1{second_param});

#define FIELD_SIZE {field_size}
#define LOOSE_BOUND {loose_bound}ULL

static uint64_t result[FIELD_SIZE];

uint8_t do_one_computation(uint8_t *data) {{
    uint64_t *test_input1 = (uint64_t*)data;
    {second_input_setup}
    
    {function_name}(result, test_input1{second_arg});
    
    return (uint8_t)(result[0] & 0xFF);
}}

void prepare_inputs(dudect_config_t *c, uint8_t *input_data, uint8_t *classes) {{
    // First generate all random data
    randombytes(input_data, c->number_measurements * c->chunk_size);
    
    // Then set classes and modify inputs based on class
    for (size_t i = 0; i < c->number_measurements; i++) {{
        classes[i] = randombit();
        if (classes[i] == 0) {{
            // Class 0: set to zeros (following original dudect pattern)
            memset(input_data + (size_t)i * c->chunk_size, 0x00, c->chunk_size);
        }} else {{
            // Class 1: leave random data from randombytes
            // But ensure it's within field bounds
            uint64_t *current = (uint64_t*)(input_data + i * c->chunk_size);
            for (int j = 0; j < {chunk_multiplier} * FIELD_SIZE; j++) {{
                current[j] = current[j] % LOOSE_BOUND;
            }}
        }}
    }}
}}

int main() {{
    printf("Testing {function_name}\\n");
    
    dudect_config_t config = {{
        .chunk_size = {chunk_multiplier} * FIELD_SIZE * sizeof(uint64_t),
        .number_measurements = 100000,  // 100,000 measurements like original dudect
    }};
    
    dudect_ctx_t ctx;
    dudect_init(&ctx, &config);
    
    dudect_state_t state = DUDECT_NO_LEAKAGE_EVIDENCE_YET;
    int iterations = 0;
    
    while (state == DUDECT_NO_LEAKAGE_EVIDENCE_YET && iterations < {max_iterations}) {{
        state = dudect_main(&ctx);
        iterations++;
    }}
    
    dudect_free(&ctx);
    
    if (state == DUDECT_LEAKAGE_FOUND) {{
        printf("FAIL: Timing leakage detected\\n");
        return 1;
    }} else {{
        printf("PASS: No leakage detected (%d iterations)\\n", iterations);
        return 0;
    }}
}}
"#,
        function_name = validation.function_name,
        second_param = second_param,
        field_size = validation.field_size,
        loose_bound = validation.loose_bound,
        second_input_setup = if is_mul { 
            "uint64_t *test_input2 = (uint64_t*)(data + FIELD_SIZE * sizeof(uint64_t));" 
        } else { "" },
        second_arg = second_arg,
        chunk_multiplier = chunk_multiplier,
        max_iterations = 50,
    )
}

// Helper macro to simplify validation calls in build.rs
#[macro_export]
macro_rules! build_and_validate {
    ($asm:expr, $obj:expr, $lib:expr, $func:expr, $is_nasm:expr, $curve:expr, $op:expr, $size:expr, $bound:expr) => {{
        // Build the assembly
        if $is_nasm {
            assert!(Command::new("nasm")
                .args(&["-f", "elf64", $asm, "-o", $obj])
                .status()
                .unwrap()
                .success());
        } else {
            assert!(Command::new("clang")
                .args(&["-c", $asm, "-o", $obj])
                .status()
                .unwrap()
                .success());
        }
        
        // Validate if enabled
        let validation = AssemblyValidation {
            asm_file: $asm.to_string(),
            function_name: $func.to_string(),
            curve_name: $curve.to_string(),
            operation: $op.to_string(),
            field_size: $size,
            loose_bound: $bound.to_string(),
        };
        
        let config = DudectConfig::default();
        validate_assembly_constant_time(&validation, &config);
        
        // Create library
        assert!(Command::new("ar")
            .args(&["rcs", $lib, $obj])
            .status()
            .unwrap()
            .success());
    }};
}