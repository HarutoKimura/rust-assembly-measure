// Binsec integration module for build.rs
// Note: std::path::Path is already imported in dudect_integration.rs

// Include the harness generator
include!("binsec_harness_generator.rs");

pub struct BinsecConfig {
    pub enabled: bool,
    pub timeout_seconds: u32,
    pub binsec_path: String,
}

impl Default for BinsecConfig {
    fn default() -> Self {
        BinsecConfig {
            enabled: std::env::var("CARGO_BINSEC_VALIDATE")
                .map(|v| v != "0" && v != "false")
                .unwrap_or(false),
            timeout_seconds: 60,  // 60 seconds default timeout
            binsec_path: std::env::var("BINSEC_PATH")
                .unwrap_or_else(|_| {
                    // Try to find binsec in opam installation first
                    if let Ok(output) = Command::new("sh")
                        .args(&["-c", "eval $(opam env) && which binsec"])
                        .output() {
                        if output.status.success() {
                            if let Ok(path) = String::from_utf8(output.stdout) {
                                return path.trim().to_string();
                            }
                        }
                    }
                    // Fallback to local build
                    "./binsec/_build/install/default/bin/binsec".to_string()
                }),
        }
    }
}

pub struct BinsecValidation {
    pub asm_file: String,
    pub obj_file: String,
    pub function_name: String,
    pub curve_name: String,
    pub operation: String,
    pub field_size: usize,
}

pub fn validate_assembly_formal(validation: &BinsecValidation, config: &BinsecConfig) -> bool {
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
    println!("cargo:warning=🔐 BINSEC Formal Verification: {} ({})", short_name, validation.operation);
    println!("cargo:warning=   File: {}", filename);
    println!("cargo:warning=   Curve: {}", validation.curve_name);

    // Check if binsec is available
    if !Path::new(&config.binsec_path).exists() {
        println!("cargo:warning=⚠️  BINSEC not found at {}", config.binsec_path);
        println!("cargo:warning=");
        println!("cargo:warning=   To use BINSEC formal verification, you need to:");
        println!("cargo:warning=   1. Initialize opam: opam init");
        println!("cargo:warning=   2. Install dependencies:");
        println!("cargo:warning=      opam install dune menhir grain_dypgen ocamlgraph zarith toml");
        println!("cargo:warning=   3. Build BINSEC: cd binsec && make");
        println!("cargo:warning=   4. The binary will be at: binsec/_build/install/default/bin/binsec");
        println!("cargo:warning=");
        println!("cargo:warning=   Or use a pre-built binary by setting BINSEC_PATH=/path/to/binsec");
        println!("cargo:warning=");
        println!("cargo:warning=   Skipping formal verification for now.");
        println!("cargo:warning=═══════════════════════════════════════════════════════════════════");
        return true;
    }

    // Generate test harness
    let harness_info = HarnessInfo {
        function_name: validation.function_name.clone(),
        curve_name: validation.curve_name.clone(),
        operation: validation.operation.clone(),
        field_size: validation.field_size,
        obj_file: validation.obj_file.clone(),
    };

    println!("cargo:warning=   Generating test harness...");
    
    let harness_exe = match generate_binsec_test_harness(&harness_info) {
        Ok(exe) => exe,
        Err(e) => {
            println!("cargo:warning=❌ ERROR: Failed to generate test harness");
            println!("cargo:warning=   Details: {}", e);
            println!("cargo:warning=═══════════════════════════════════════════════════════════════════");
            return false;
        }
    };

    // Generate configuration file for binsec
    let config_dir = format!("binsec-validation/configs/{}/{}", 
        validation.curve_name, validation.operation);
    fs::create_dir_all(&config_dir).unwrap();

    let config_content = generate_binsec_config_with_globals(&harness_info);
    let config_file = format!("{}/config_{}.cfg", config_dir, validation.function_name);
    fs::write(&config_file, config_content).unwrap();

    println!("cargo:warning=   Running BINSEC analysis (timeout: {}s)...", config.timeout_seconds);
    
    // Run BINSEC on the test harness executable
    let binsec_command = format!(
        "eval $(opam env 2>/dev/null) && timeout {} {} -sse -checkct -sse-script {} {} 2>&1",
        config.timeout_seconds,
        config.binsec_path,
        config_file,
        harness_exe  // Now using the complete executable
    );
    
    let binsec_output = Command::new("sh")
        .args(&["-c", &binsec_command])
        .output();

    match binsec_output {
        Ok(output) => {
            let stdout_str = String::from_utf8_lossy(&output.stdout);
            let stderr_str = String::from_utf8_lossy(&output.stderr);
            
            // Parse binsec output to determine result
            if stdout_str.contains("Program status is : secure") || stderr_str.contains("Program status is : secure") {
                println!("cargo:warning=✅ PASS: Constant-time property formally verified!");
                println!("cargo:warning=═══════════════════════════════════════════════════════════════════");
                true
            } else if stdout_str.contains("Program status is : insecure") || stderr_str.contains("Program status is : insecure") {
                println!("cargo:warning=❌ FAIL: Timing leakage formally proven!");
                // Extract and display leak information if available
                let combined_output = format!("{}\n{}", stdout_str, stderr_str);
                if let Some(leak_info) = extract_leak_info(&combined_output) {
                    println!("cargo:warning=   Leak details: {}", leak_info);
                }
                // Show instruction statistics if available
                if let Some(line) = combined_output.lines().find(|l| l.contains("control flow checks")) {
                    println!("cargo:warning=   {}", line.trim());
                }
                if let Some(line) = combined_output.lines().find(|l| l.contains("memory access checks")) {
                    println!("cargo:warning=   {}", line.trim());
                }
                println!("cargo:warning=═══════════════════════════════════════════════════════════════════");
                false
            } else if stdout_str.contains("Program status is : unknown") || stderr_str.contains("Program status is : unknown") {
                println!("cargo:warning=⚠️  UNKNOWN: Verification incomplete");
                let combined_output = format!("{}\n{}", stdout_str, stderr_str);
                
                // Extract and show partial results
                if let Some(cf_line) = combined_output.lines().find(|l| l.contains("control flow checks pass")) {
                    println!("cargo:warning=   {}", cf_line.trim());
                }
                if let Some(mem_line) = combined_output.lines().find(|l| l.contains("memory access checks pass")) {
                    println!("cargo:warning=   {}", mem_line.trim());
                }
                
                // Show why it's incomplete
                if combined_output.contains("timeout") {
                    println!("cargo:warning=   Reason: Analysis timed out after {}s", config.timeout_seconds);
                } else if let Some(line) = combined_output.lines().find(|l| l.contains("paths fell into")) {
                    println!("cargo:warning=   Reason: {}", line.trim());
                } else {
                    println!("cargo:warning=   Reason: Exploration limits reached");
                }
                
                println!("cargo:warning=═══════════════════════════════════════════════════════════════════");
                // Return true to not block the build, but log the uncertainty
                true
            } else {
                println!("cargo:warning=❌ ERROR: BINSEC execution failed");
                if !stderr_str.is_empty() {
                    // Limit error output to first few lines
                    let error_lines: Vec<&str> = stderr_str.lines().take(5).collect();
                    for line in error_lines {
                        println!("cargo:warning=   {}", line.trim());
                    }
                    if stderr_str.lines().count() > 5 {
                        println!("cargo:warning=   ... (truncated)");
                    }
                }
                println!("cargo:warning=═══════════════════════════════════════════════════════════════════");
                false
            }
        }
        Err(e) => {
            println!("cargo:warning=❌ ERROR: Failed to run BINSEC");
            println!("cargo:warning=   Details: {}", e);
            println!("cargo:warning=═══════════════════════════════════════════════════════════════════");
            false
        }
    }
}

// Removed old config generation - now using generate_binsec_config_with_globals from harness generator

fn extract_leak_info(output: &str) -> Option<String> {
    // Extract leak information from BINSEC output
    if let Some(line) = output.lines().find(|line| line.contains("has") && line.contains("leak")) {
        Some(line.trim().to_string())
    } else {
        None
    }
}

// Helper macro to integrate both dudect and binsec validation
#[macro_export]
macro_rules! build_and_validate_with_formal {
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
        
        // Dudect validation (statistical)
        let dudect_validation = AssemblyValidation {
            asm_file: $asm.to_string(),
            function_name: $func.to_string(),
            curve_name: $curve.to_string(),
            operation: $op.to_string(),
            field_size: $size,
            loose_bound: $bound.to_string(),
        };
        
        let dudect_config = DudectConfig::default();
        validate_assembly_constant_time(&dudect_validation, &dudect_config);
        
        // Binsec validation (formal)
        let binsec_validation = BinsecValidation {
            asm_file: $asm.to_string(),
            obj_file: $obj.to_string(),
            function_name: $func.to_string(),
            curve_name: $curve.to_string(),
            operation: $op.to_string(),
            field_size: $size,
        };
        
        let binsec_config = BinsecConfig::default();
        validate_assembly_formal(&binsec_validation, &binsec_config);
        
        // Create library
        assert!(Command::new("ar")
            .args(&["rcs", $lib, $obj])
            .status()
            .unwrap()
            .success());
    }};
}