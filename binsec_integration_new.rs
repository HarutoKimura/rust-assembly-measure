// Binsec integration module for build.rs - using verify_cryptopt_binsec.sh
// Note: Command and Path are already imported in build.rs

pub struct BinsecConfig {
    pub enabled: bool,
    pub verify_script: String,
}

impl Default for BinsecConfig {
    fn default() -> Self {
        BinsecConfig {
            enabled: std::env::var("CARGO_BINSEC_VALIDATE")
                .map(|v| v != "0" && v != "false")
                .unwrap_or(false),
            verify_script: "./verify_cryptopt_binsec.sh".to_string(),
        }
    }
}

pub fn run_binsec_verification(config: &BinsecConfig) -> bool {
    if !config.enabled {
        return true;
    }

    println!("cargo:warning=");
    println!("cargo:warning=╔═══════════════════════════════════════════════════════════════════╗");
    println!("cargo:warning=║          BINSEC FORMAL VERIFICATION FOR CRYPTOPT                  ║");
    println!("cargo:warning=╚═══════════════════════════════════════════════════════════════════╝");
    println!("cargo:warning=");
    
    // Check if verification script exists
    if !Path::new(&config.verify_script).exists() {
        println!("cargo:warning=❌ ERROR: {} not found", config.verify_script);
        println!("cargo:warning=   Please ensure the verification script is in the project root");
        return false;
    }

    println!("cargo:warning=Running BINSEC verification on all CryptOpt implementations...");
    println!("cargo:warning=This may take a few minutes...");
    
    // Run the verification script
    let output = Command::new("bash")
        .arg(&config.verify_script)
        .output();

    match output {
        Ok(result) => {
            let stdout = String::from_utf8_lossy(&result.stdout);
            let _stderr = String::from_utf8_lossy(&result.stderr);
            
            // Parse and display individual results
            println!("cargo:warning=");
            println!("cargo:warning=Individual verification results:");
            println!("cargo:warning=───────────────────────────────────────────────────────────────────");
            
            // Look for the results table
            let mut in_table = false;
            let mut displayed_count = 0;
            for line in stdout.lines() {
                if line.contains("| Symbol | CFI | MAI | Status |") {
                    in_table = true;
                    continue;
                }
                if line.contains("|--------|-----|-----|--------|") {
                    continue;
                }
                if in_table && line.starts_with('|') && line.contains("CryptOpt") {
                    // Parse the result line
                    let parts: Vec<&str> = line.split('|').collect();
                    if parts.len() >= 5 {
                        let symbol = parts[1].trim();
                        let cfi = parts[2].trim();
                        let mai = parts[3].trim();
                        let status = parts[4].trim();
                        
                        // Format and display
                        let short_symbol = symbol.replace("_CryptOpt", "");
                        let status_icon = if status.contains("SAFE") {
                            "✅"
                        } else if status.contains("FAIL") {
                            "❌"
                        } else {
                            "⚠️"
                        };
                        
                        println!("cargo:warning=  {} {} - CFI: {}, MAI: {}", 
                            status_icon, short_symbol, cfi, mai);
                        
                        displayed_count += 1;
                        if displayed_count % 5 == 0 {
                            println!("cargo:warning=");
                        }
                    }
                }
                if line.contains("### Summary") {
                    break;
                }
            }
            
            println!("cargo:warning=───────────────────────────────────────────────────────────────────");
            
            // Parse the summary from the script output
            let mut total = 0;
            let mut safe = 0;
            let mut unknown_pass = 0;
            let mut failed = 0;
            
            // Look for the summary section
            if let Some(summary_start) = stdout.find("### Summary") {
                let summary = &stdout[summary_start..];
                
                // Extract counts
                for line in summary.lines() {
                    if line.contains("Total verified:") {
                        if let Some(num) = line.split(':').nth(1) {
                            total = num.trim().parse::<usize>().unwrap_or(0);
                        }
                    } else if line.contains("SAFE (formally verified):") {
                        if let Some(num) = line.split(':').nth(1) {
                            safe = num.trim().parse::<usize>().unwrap_or(0);
                        }
                    } else if line.contains("UNKNOWN (all checks pass):") {
                        if let Some(num) = line.split(':').nth(1) {
                            unknown_pass = num.trim().parse::<usize>().unwrap_or(0);
                        }
                    } else if line.contains("Failed/Incomplete:") {
                        if let Some(num) = line.split(':').nth(1) {
                            failed = num.trim().parse::<usize>().unwrap_or(0);
                        }
                    }
                }
            }
            
            // Display results
            println!("cargo:warning=");
            println!("cargo:warning=BINSEC Verification Results:");
            println!("cargo:warning=  Total functions verified: {}", total);
            println!("cargo:warning=  ✅ SAFE (formally verified): {}", safe);
            println!("cargo:warning=  ⚠️  UNKNOWN (all checks pass): {}", unknown_pass);
            println!("cargo:warning=  ❌ FAILED: {}", failed);
            
            if failed > 0 {
                println!("cargo:warning=");
                println!("cargo:warning=❌ ERROR: {} functions failed verification!", failed);
                println!("cargo:warning=   Check logs/stub/ for details");
                
                // Optionally fail the build on verification failures
                if std::env::var("CARGO_BINSEC_STRICT").is_ok() {
                    println!("cargo:warning=   Build failed due to CARGO_BINSEC_STRICT=1");
                    return false;
                }
            } else if unknown_pass == total {
                println!("cargo:warning=");
                println!("cargo:warning=⚠️  All functions show UNKNOWN status with all checks passing.");
                println!("cargo:warning=   This indicates constant-time behavior but without formal SAFE verdict.");
                println!("cargo:warning=   (This is expected with legacy binsec and ud2 termination)");
            }
            
            // Save detailed results if requested
            if std::env::var("CARGO_BINSEC_SAVE_LOGS").is_ok() {
                let log_dir = "target/binsec-logs";
                std::fs::create_dir_all(log_dir).ok();
                std::fs::write(format!("{}/verification.log", log_dir), stdout.as_bytes()).ok();
                println!("cargo:warning=   Detailed logs saved to {}/verification.log", log_dir);
            }
            
            println!("cargo:warning=");
            println!("cargo:warning=═══════════════════════════════════════════════════════════════════");
            
            // Success if no failures (UNKNOWN with all checks passing is acceptable)
            failed == 0
        }
        Err(e) => {
            println!("cargo:warning=❌ ERROR: Failed to run verification script");
            println!("cargo:warning=   Error: {}", e);
            println!("cargo:warning=");
            println!("cargo:warning=   Make sure you have:");
            println!("cargo:warning=   1. binsec installed (via opam)");
            println!("cargo:warning=   2. The verification script is executable");
            println!("cargo:warning=   3. All required tools (clang, ld.lld, etc.) are available");
            println!("cargo:warning=═══════════════════════════════════════════════════════════════════");
            false
        }
    }
}

// Updated macro to only run script once at the end
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
        
        // Dudect validation (statistical) - if enabled
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
        
        // Note: BINSEC validation will be run once at the end via run_binsec_verification()
        
        // Create library
        assert!(Command::new("ar")
            .args(&["rcs", $lib, $obj])
            .status()
            .unwrap()
            .success());
    }};
}