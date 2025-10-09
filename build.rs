use std::ffi::OsStr;
use std::fs::{self, File};
use std::io::Write;
use std::path::PathBuf;
use std::process::Command;

// -----------------------------------------------------------------------------
// Dudect constant-time validation integration
include!("dudect_integration.rs");

// -----------------------------------------------------------------------------
// Binsec formal verification integration
include!("binsec_integration_new.rs");

// -----------------------------------------------------------------------------
// Build functions for each curve

fn dynamic_target_specs() -> Vec<String> {
    std::env::var("CARGO_DYNAMIC_TARGETS")
        .ok()
        .map(|raw| {
            raw.split(',')
                .map(|s| s.trim())
                .filter(|s| !s.is_empty())
                .map(|s| s.to_string())
                .collect::<Vec<_>>()
        })
        .unwrap_or_default()
}

struct DynamicTarget {
    asm_path: PathBuf,
    symbol: String,
    signature: FunctionSignature,
}

#[derive(Clone, Copy)]
enum FunctionSignature {
    U64Mul,
    U64Square,
}

struct WrapperSpec {
    public_symbol: String,
    internal_symbol: String,
    signature: FunctionSignature,
}

fn compile_dynamic_targets(specs: &[String]) -> Result<Vec<WrapperSpec>, String> {
    println!("cargo:rerun-if-env-changed=CARGO_DYNAMIC_TARGETS");

    let mut targets = Vec::new();
    for spec in specs {
        targets.push(parse_dynamic_target(spec)?);
    }

    let mut wrappers = Vec::new();
    for target in &targets {
        println!(
            "cargo:warning=Building dynamic target from {} (symbol {})",
            target.asm_path.display(),
            target.symbol
        );
        let obj_path = compile_asm_file(&target.asm_path)?;
        let internal_symbol = format!("{}__asm_impl", target.symbol);
        rename_symbol_in_object(&obj_path, &target.symbol, &internal_symbol)?;
        register_link_object(&obj_path)?;
        println!(
            "cargo:rustc-link-arg=-Wl,--export-dynamic-symbol={}",
            target.symbol
        );
        wrappers.push(WrapperSpec {
            public_symbol: target.symbol.clone(),
            internal_symbol,
            signature: target.signature,
        });
    }

    Ok(wrappers)
}

struct BaselineTarget {
    source: PathBuf,
    symbol: String,
    signature: FunctionSignature,
}

fn resolve_baseline_target() -> Result<Option<BaselineTarget>, String> {
    println!("cargo:rerun-if-env-changed=CARGO_BASELINE_C");
    println!("cargo:rerun-if-env-changed=CARGO_BASELINE_SYMBOL");
    println!("cargo:rerun-if-env-changed=CARGO_BASELINE_SIGNATURE");

    let Some(raw_path) = std::env::var_os("CARGO_BASELINE_C") else {
        return Ok(None);
    };

    let mut c_path = PathBuf::from(raw_path);
    if !c_path.is_absolute() {
        let manifest_dir = std::env::var("CARGO_MANIFEST_DIR")
            .map_err(|e| format!("Unable to read CARGO_MANIFEST_DIR: {e}"))?;
        c_path = std::path::Path::new(&manifest_dir).join(c_path);
    }

    if !c_path.exists() {
        return Err(format!(
            "Baseline C source '{}' does not exist",
            c_path.display()
        ));
    }

    let symbol = std::env::var("CARGO_BASELINE_SYMBOL")
        .map(|s| s.trim().to_string())
        .unwrap_or_else(|_| {
            c_path
                .file_stem()
                .and_then(|stem| stem.to_str())
                .map(|s| s.to_string())
                .unwrap_or_default()
        });

    if symbol.is_empty() {
        return Err(format!(
            "Could not infer baseline symbol name from '{}'; set CARGO_BASELINE_SYMBOL",
            c_path.display()
        ));
    }

    let signature_override = std::env::var("CARGO_BASELINE_SIGNATURE").ok();
    let signature = parse_signature(signature_override.as_deref(), &c_path)?;

    Ok(Some(BaselineTarget {
        source: c_path,
        symbol,
        signature,
    }))
}

fn compile_baseline_target(
    target: &BaselineTarget,
    wrappers: &mut Vec<WrapperSpec>,
) -> Result<(), String> {
    println!(
        "cargo:warning=Building baseline from {} (symbol {})",
        target.source.display(),
        target.symbol
    );

    let obj_path = compile_c_file(&target.source)?;
    let internal_symbol = format!("{}__baseline_impl", target.symbol);
    rename_symbol_in_object(&obj_path, &target.symbol, &internal_symbol)?;
    register_link_object(&obj_path)?;
    println!(
        "cargo:rustc-link-arg=-Wl,--export-dynamic-symbol={}",
        target.symbol
    );

    wrappers.push(WrapperSpec {
        public_symbol: target.symbol.clone(),
        internal_symbol,
        signature: target.signature,
    });

    Ok(())
}

fn parse_dynamic_target(spec: &str) -> Result<DynamicTarget, String> {
    let mut parts = spec.splitn(3, "::");
    let path_part = parts
        .next()
        .filter(|s| !s.is_empty())
        .ok_or_else(|| "Empty target specification".to_string())?;
    let symbol_override = parts
        .next()
        .filter(|s| !s.is_empty())
        .map(|s| s.to_string());
    let signature = parts
        .next()
        .filter(|s| !s.is_empty())
        .map(|s| s.to_string());

    let asm_path = resolve_asm_path(path_part)?;
    let symbol = if let Some(name) = symbol_override {
        name
    } else {
        infer_symbol_from_asm(&asm_path).ok_or_else(|| {
            format!(
                "Failed to infer export symbol from {}. Add '::symbol_name' to the spec.",
                asm_path.display()
            )
        })?
    };

    let signature = parse_signature(signature.as_deref(), &asm_path)?;

    Ok(DynamicTarget {
        asm_path,
        symbol,
        signature,
    })
}

fn parse_signature(
    input: Option<&str>,
    asm_path: &std::path::Path,
) -> Result<FunctionSignature, String> {
    if let Some(explicit) = input {
        match explicit.trim().to_ascii_lowercase().as_str() {
            "mul_u64" | "u64_mul" | "mul64" => return Ok(FunctionSignature::U64Mul),
            "square_u64" | "u64_square" | "square64" => return Ok(FunctionSignature::U64Square),
            other => {
                return Err(format!(
                    "Unknown signature '{other}'. Supported values: mul_u64, square_u64"
                ))
            }
        }
    }

    let lowered = asm_path.display().to_string().to_ascii_lowercase();
    if lowered.contains("/mul/") || lowered.contains("\\mul\\") {
        return Ok(FunctionSignature::U64Mul);
    }
    if lowered.contains("/square/") || lowered.contains("\\square\\") {
        return Ok(FunctionSignature::U64Square);
    }

    if let Some(name) = asm_path.file_name().and_then(|n| n.to_str()) {
        let lowered_name = name.to_ascii_lowercase();
        if lowered_name.contains("square") {
            return Ok(FunctionSignature::U64Square);
        }
        if lowered_name.contains("mul") {
            return Ok(FunctionSignature::U64Mul);
        }
    }

    Err(format!(
        "Unable to infer function signature for {}. Append '::mul_u64' or '::square_u64' to the spec.",
        asm_path.display()
    ))
}

fn infer_symbol_from_asm(path: &std::path::Path) -> Option<String> {
    let contents = fs::read_to_string(path).ok()?;
    for raw_line in contents.lines() {
        let line = raw_line.trim();
        if line.is_empty() {
            continue;
        }

        let line = line
            .split(|c| c == '#' || c == ';')
            .next()
            .unwrap_or(line)
            .trim();

        if line.is_empty() {
            continue;
        }

        if line.starts_with(".globl") || line.starts_with(".global") {
            let mut parts = line.split_whitespace();
            parts.next(); // skip directive
            if let Some(symbol) = parts.next() {
                return Some(symbol.trim().to_string());
            }
        } else if line.starts_with("global ") || line.starts_with("GLOBAL ") {
            let mut remainder = line[6..].trim();
            if let Some(pos) =
                remainder.find(|c: char| c == ' ' || c == '\t' || c == ',' || c == ':')
            {
                remainder = remainder[..pos].trim();
            }
            if !remainder.is_empty() {
                return Some(remainder.to_string());
            }
        }
    }

    None
}

fn rename_symbol_in_object(
    obj_path: &std::path::Path,
    original: &str,
    replacement: &str,
) -> Result<(), String> {
    if original == replacement {
        return Ok(());
    }

    let obj_owned = obj_path
        .to_str()
        .ok_or_else(|| format!("Non-UTF-8 path encountered: {}", obj_path.display()))?
        .to_string();
    let mapping = format!("{}={}", original, replacement);
    let status = Command::new("objcopy")
        .args(&["--redefine-sym", mapping.as_str(), obj_owned.as_str()])
        .status()
        .map_err(|e| format!("Failed to spawn objcopy: {e}"))?;

    if status.success() {
        Ok(())
    } else {
        Err(format!(
            "objcopy failed while renaming {original} -> {replacement} (status {:?})",
            status.code()
        ))
    }
}

fn emit_wrapper_file(wrappers: &[WrapperSpec]) -> Result<(), String> {
    let out_dir = std::env::var("OUT_DIR")
        .map_err(|e| format!("Unable to read OUT_DIR for wrapper generation: {e}"))?;
    let destination = std::path::Path::new(&out_dir).join("dynamic_wrappers.rs");
    let mut file = File::create(&destination)
        .map_err(|e| format!("Failed to create {}: {e}", destination.display()))?;

    writeln!(
        file,
        "// Auto-generated wrappers to keep assembly symbols exported in dynamic mode"
    )
    .map_err(|e| format!("Failed to write to {}: {e}", destination.display()))?;

    for wrapper in wrappers {
        match wrapper.signature {
            FunctionSignature::U64Mul => {
                writeln!(
                    file,
                    "#[no_mangle]\npub unsafe extern \"C\" fn {public}(out: *mut u64, arg1: *const u64, arg2: *const u64) {{\n    extern \"C\" {{\n        fn {internal}(out: *mut u64, arg1: *const u64, arg2: *const u64);\n    }}\n    {internal}(out, arg1, arg2);\n}}\n",
                    public = wrapper.public_symbol,
                    internal = wrapper.internal_symbol
                )
                .map_err(|e| format!("Failed to write wrapper for {}: {e}", wrapper.public_symbol))?;
            }
            FunctionSignature::U64Square => {
                writeln!(
                    file,
                    "#[no_mangle]\npub unsafe extern \"C\" fn {public}(out: *mut u64, arg1: *const u64) {{\n    extern \"C\" {{\n        fn {internal}(out: *mut u64, arg1: *const u64);\n    }}\n    {internal}(out, arg1);\n}}\n",
                    public = wrapper.public_symbol,
                    internal = wrapper.internal_symbol
                )
                .map_err(|e| format!("Failed to write wrapper for {}: {e}", wrapper.public_symbol))?;
            }
        }
    }

    Ok(())
}

fn resolve_asm_path(spec: &str) -> Result<PathBuf, String> {
    let manifest_dir = std::env::var("CARGO_MANIFEST_DIR")
        .map_err(|e| format!("Unable to read CARGO_MANIFEST_DIR: {e}"))?;
    let manifest_path = std::path::Path::new(&manifest_dir);

    let mut candidate = PathBuf::from(spec);
    if !candidate.is_absolute() {
        candidate = manifest_path.join(&candidate);
    }
    if candidate.exists() {
        return Ok(candidate);
    }

    if !spec.ends_with(".asm") {
        let mut alt = PathBuf::from(spec);
        alt.set_extension("asm");
        let alt_path = if alt.is_absolute() {
            alt
        } else {
            manifest_path.join(&alt)
        };
        if alt_path.exists() {
            return Ok(alt_path);
        }
    }

    let filename = std::path::Path::new(spec)
        .file_name()
        .ok_or_else(|| format!("Unable to derive filename from spec '{spec}'"))?;
    find_asm_in_src(filename)
        .ok_or_else(|| format!("Could not locate assembly file matching '{spec}'"))
}

fn find_asm_in_src(name: &OsStr) -> Option<PathBuf> {
    let manifest_dir = std::env::var("CARGO_MANIFEST_DIR").ok()?;
    let search_root = std::path::Path::new(&manifest_dir).join("src");
    let mut stack = vec![search_root];

    while let Some(dir) = stack.pop() {
        if let Ok(entries) = fs::read_dir(&dir) {
            for entry in entries.flatten() {
                let path = entry.path();
                if path.is_dir() {
                    stack.push(path);
                } else if path.extension().and_then(|ext| ext.to_str()) == Some("asm") {
                    if path.file_name().map(|n| n == name).unwrap_or(false) {
                        return Some(path);
                    }
                }
            }
        }
    }

    None
}

fn dynamic_object_output_path(input: &std::path::Path, ext: &str) -> Result<PathBuf, String> {
    let out_dir = std::env::var("OUT_DIR").map_err(|e| format!("Unable to read OUT_DIR: {e}"))?;
    let base_out = std::path::Path::new(&out_dir).join("dynamic-objects");

    let manifest_dir = std::env::var("CARGO_MANIFEST_DIR")
        .map_err(|e| format!("Unable to read CARGO_MANIFEST_DIR: {e}"))?;
    let manifest_path = std::path::Path::new(&manifest_dir);

    let relative = input.strip_prefix(manifest_path).unwrap_or(input);

    let mut destination = base_out.join(relative);
    destination.set_extension(ext);
    Ok(destination)
}

fn compile_asm_file(asm_path: &std::path::Path) -> Result<PathBuf, String> {
    println!("cargo:rerun-if-changed={}", asm_path.display());

    let obj_path = dynamic_object_output_path(asm_path, "o")?;

    if let Some(parent) = obj_path.parent() {
        fs::create_dir_all(parent)
            .map_err(|e| format!("Failed to create directory {}: {e}", parent.display()))?;
    }

    let asm_owned = asm_path
        .to_str()
        .ok_or_else(|| format!("Non-UTF-8 path encountered: {}", asm_path.display()))?
        .to_string();
    let obj_owned = obj_path
        .to_str()
        .ok_or_else(|| format!("Non-UTF-8 path encountered: {}", obj_path.display()))?
        .to_string();

    let status = if is_nasm_source(asm_path) {
        Command::new("nasm")
            .args(&[
                "-f",
                "elf64",
                "-DPIC",
                asm_owned.as_str(),
                "-o",
                obj_owned.as_str(),
            ])
            .status()
            .map_err(|e| format!("Failed to spawn nasm: {e}"))?
    } else {
        Command::new("clang")
            .args(&["-c", "-fPIC", asm_owned.as_str(), "-o", obj_owned.as_str()])
            .status()
            .map_err(|e| format!("Failed to spawn clang: {e}"))?
    };

    if !status.success() {
        return Err(format!(
            "Compilation failed for {} with status {:?}",
            asm_path.display(),
            status.code()
        ));
    }

    Ok(obj_path)
}

fn compile_c_file(c_path: &std::path::Path) -> Result<PathBuf, String> {
    println!("cargo:rerun-if-changed={}", c_path.display());

    let obj_path = dynamic_object_output_path(c_path, "o")?;

    if let Some(parent) = obj_path.parent() {
        fs::create_dir_all(parent)
            .map_err(|e| format!("Failed to create directory {}: {e}", parent.display()))?;
    }

    let c_owned = c_path
        .to_str()
        .ok_or_else(|| format!("Non-UTF-8 path encountered: {}", c_path.display()))?
        .to_string();
    let obj_owned = obj_path
        .to_str()
        .ok_or_else(|| format!("Non-UTF-8 path encountered: {}", obj_path.display()))?
        .to_string();

    let status = Command::new("clang")
        .args(&[
            "-c",
            "-fPIC",
            "-O3",
            "-march=native",
            "-fno-semantic-interposition",
            "-std=c11",
            c_owned.as_str(),
            "-o",
            obj_owned.as_str(),
        ])
        .status()
        .map_err(|e| format!("Failed to spawn clang: {e}"))?;

    if !status.success() {
        return Err(format!(
            "Compilation failed for baseline C source {} with status {:?}",
            c_path.display(),
            status.code()
        ));
    }

    Ok(obj_path)
}

fn register_link_object(obj_path: &std::path::Path) -> Result<(), String> {
    let canonical = fs::canonicalize(obj_path).unwrap_or_else(|_| obj_path.to_path_buf());
    println!("cargo:rustc-link-arg={}", canonical.display());
    Ok(())
}

fn is_nasm_source(path: &std::path::Path) -> bool {
    let lower = path.to_string_lossy().to_lowercase();
    lower.contains("nasm") || lower.contains("cryptopt") || lower.contains("hand_opt")
}

fn run_dynamic_mode(specs: &[String]) -> Result<(), String> {
    println!("cargo:rustc-check-cfg=cfg(dynamic_build)");
    println!("cargo:rustc-cfg=dynamic_build");

    let mut wrappers = compile_dynamic_targets(specs)?;
    let baseline = resolve_baseline_target()?;

    if specs.is_empty() && baseline.is_none() {
        // Nothing to build for this invocation; still generate an empty wrapper module so that
        // the include! in src/lib.rs succeeds.
        emit_wrapper_file(&[])?;
        return Ok(());
    }

    if let Some(ref baseline_target) = baseline {
        compile_baseline_target(baseline_target, &mut wrappers)?;
    }

    println!("cargo:rustc-link-arg=-Wl,--export-dynamic");
    println!("cargo:rustc-link-arg=-Wl,--no-gc-sections");
    println!("cargo:rustc-link-arg=-Wl,-Bsymbolic");
    println!("cargo:rustc-link-arg=-Wl,-z,now");
    println!("cargo:rustc-link-arg=-Wl,-z,noexecstack");

    emit_wrapper_file(&wrappers)?;

    Ok(())
}

fn print_validation_header() {
    let dudect_enabled = std::env::var("CARGO_DUDECT_VALIDATE")
        .map(|v| v != "0" && v != "false")
        .unwrap_or(false);
    let binsec_enabled = std::env::var("CARGO_BINSEC_VALIDATE")
        .map(|v| v != "0" && v != "false")
        .unwrap_or(false);

    if dudect_enabled || binsec_enabled {
        println!("cargo:warning=");
        println!(
            "cargo:warning=╔═══════════════════════════════════════════════════════════════════╗"
        );
        println!(
            "cargo:warning=║          CONSTANT-TIME VALIDATION FOR CRYPTOPT                    ║"
        );
        println!(
            "cargo:warning=╚═══════════════════════════════════════════════════════════════════╝"
        );
        println!("cargo:warning=");

        if dudect_enabled {
            println!("cargo:warning=DUDECT: Statistical constant-time validation enabled");
            println!("cargo:warning=  This will validate using statistical tests.");
        }

        if binsec_enabled {
            println!("cargo:warning=BINSEC: Formal constant-time verification enabled");
            println!("cargo:warning=  This will formally verify constant-time properties.");
        }

        println!("cargo:warning=");
    }
}

fn build_curve25519() {
    // ---------- MUL ----------
    // LLC version (mul)
    build_and_validate!(
        "src/rust/curve25519/llc/mul/rust_fiat_curve25519_carry_mul_vec.asm",
        "src/rust/curve25519/llc/mul/rust_fiat_curve25519_carry_mul_vec.o",
        "src/rust/curve25519/llc/mul/librust_fiat_curve25519_carry_mul_vec.a",
        "rust_fiat_curve25519_carry_mul_vec",
        false, // not NASM
        "curve25519",
        "mul",
        4,                  // field size
        "0x18000000000000"  // loose bound
    );

    // NASM version (mul)
    build_and_validate!(
        "src/rust/curve25519/llc-nasm/mul/rust_fiat_curve25519_carry_mul_vec_nasm.asm",
        "src/rust/curve25519/llc-nasm/mul/rust_fiat_curve25519_carry_mul_vec_nasm.o",
        "src/rust/curve25519/llc-nasm/mul/librust_fiat_curve25519_carry_mul_vec_nasm.a",
        "rust_fiat_curve25519_carry_mul_vec_nasm",
        true, // NASM
        "curve25519",
        "mul",
        4,                  // field size
        "0x18000000000000"  // loose bound
    );

    // CryptOpt version (mul) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/curve25519/cryptopt/mul/seed0001746533729338_ratio12461.asm",
        "src/rust/curve25519/cryptopt/mul/seed0001746533729338_ratio12461.o",
        "src/rust/curve25519/cryptopt/mul/librust_fiat_curve25519_carry_mul_CryptOpt.a",
        "rust_fiat_curve25519_carry_mul_CryptOpt",
        true, // NASM
        "curve25519",
        "mul",
        4,                  // field size
        "0x18000000000000"  // loose bound
    );

    // ---------- SQUARE ----------
    // LLC version (square)
    build_and_validate!(
        "src/rust/curve25519/llc/square/rust_fiat_curve25519_carry_square_vec.asm",
        "src/rust/curve25519/llc/square/rust_fiat_curve25519_carry_square_vec.o",
        "src/rust/curve25519/llc/square/librust_fiat_curve25519_carry_square_vec.a",
        "rust_fiat_curve25519_carry_square_vec",
        false, // not NASM
        "curve25519",
        "square",
        4,                  // field size
        "0x18000000000000"  // loose bound
    );

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/rust/curve25519/llc-nasm/square/rust_fiat_curve25519_carry_square_vec_nasm.asm",
            "-o",
            "src/rust/curve25519/llc-nasm/square/rust_fiat_curve25519_carry_square_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/curve25519/llc-nasm/square/librust_fiat_curve25519_carry_square_vec_nasm.a",
            "src/rust/curve25519/llc-nasm/square/rust_fiat_curve25519_carry_square_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/curve25519/cryptopt/square/seed0001746532817891_ratio10523.asm",
        "src/rust/curve25519/cryptopt/square/seed0001746532817891_ratio10523.o",
        "src/rust/curve25519/cryptopt/square/librust_fiat_curve25519_carry_square_CryptOpt.a",
        "rust_fiat_curve25519_carry_square_CryptOpt",
        true, // NASM
        "curve25519",
        "square",
        4,                  // field size
        "0x18000000000000"  // loose bound
    );
}

fn build_curve25519_dalek() {
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/curve25519-dalek/llc/mul/curve25519_dalek_mul_vec.asm",
            "-o",
            "src/rust/curve25519-dalek/llc/mul/curve25519_dalek_mul_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/curve25519-dalek/llc/mul/libcurve25519_dalek_mul_vec.a",
            "src/rust/curve25519-dalek/llc/mul/curve25519_dalek_mul_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/rust/curve25519-dalek/llc-nasm/mul/curve25519_dalek_mul_vec_nasm.asm",
            "-o",
            "src/rust/curve25519-dalek/llc-nasm/mul/curve25519_dalek_mul_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/curve25519-dalek/llc-nasm/mul/libcurve25519_dalek_mul_vec_nasm.a",
            "src/rust/curve25519-dalek/llc-nasm/mul/curve25519_dalek_mul_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/curve25519-dalek/cryptopt/mul/seed0001746569406075_ratio12273.asm",
        "src/rust/curve25519-dalek/cryptopt/mul/seed0001746569406075_ratio12273.o",
        "src/rust/curve25519-dalek/cryptopt/mul/libcurve25519_dalek_mul_CryptOpt.a",
        "curve25519_dalek_mul_CryptOpt",
        true, // NASM
        "curve25519",
        "mul",
        4,                  // field size
        "0x18000000000000"  // loose bound
    );

    // ---------- SQUARE ----------
    // LLC version (square) - Assuming file exists
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/curve25519-dalek/llc/square/curve25519_dalek_square_vec.asm", // Assumed path
            "-o",
            "src/rust/curve25519-dalek/llc/square/curve25519_dalek_square_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/curve25519-dalek/llc/square/libcurve25519_dalek_square_vec.a",
            "src/rust/curve25519-dalek/llc/square/curve25519_dalek_square_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/rust/curve25519-dalek/llc-nasm/square/curve25519_dalek_square_vec_nasm.asm",
            "-o",
            "src/rust/curve25519-dalek/llc-nasm/square/curve25519_dalek_square_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/curve25519-dalek/llc-nasm/square/libcurve25519_dalek_square_vec_nasm.a",
            "src/rust/curve25519-dalek/llc-nasm/square/curve25519_dalek_square_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/curve25519-dalek/cryptopt/square/seed0001746572411863_ratio09431.asm",
        "src/rust/curve25519-dalek/cryptopt/square/seed0001746572411863_ratio09431.o",
        "src/rust/curve25519-dalek/cryptopt/square/libcurve25519_dalek_square_CryptOpt.a",
        "curve25519_dalek_square_CryptOpt",
        true, // NASM
        "curve25519",
        "square",
        4,                  // field size
        "0x18000000000000"  // loose bound
    );
}

fn build_p448() {
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/p448/llc/mul/rust_fiat_p448_solinas_carry_mul_vec.asm",
            "-o",
            "src/rust/p448/llc/mul/rust_fiat_p448_solinas_carry_mul_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/p448/llc/mul/librust_fiat_p448_solinas_carry_mul_vec.a",
            "src/rust/p448/llc/mul/rust_fiat_p448_solinas_carry_mul_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/rust/p448/llc-nasm/mul/rust_fiat_p448_solinas_carry_mul_vec_nasm.asm",
            "-o",
            "src/rust/p448/llc-nasm/mul/rust_fiat_p448_solinas_carry_mul_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/p448/llc-nasm/mul/librust_fiat_p448_solinas_carry_mul_vec_nasm.a",
            "src/rust/p448/llc-nasm/mul/rust_fiat_p448_solinas_carry_mul_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/p448/cryptopt/mul/seed0001746580882393_ratio14028.asm",
        "src/rust/p448/cryptopt/mul/seed0001746580882393_ratio14028.o",
        "src/rust/p448/cryptopt/mul/librust_fiat_p448_solinas_carry_mul_CryptOpt.a",
        "rust_fiat_p448_solinas_carry_mul_CryptOpt",
        true, // NASM
        "p448",
        "mul",
        8,                   // field size
        "0x300000000000000"  // loose bound
    );

    // ---------- SQUARE ----------
    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/p448/llc/square/rust_fiat_p448_solinas_carry_square_vec.asm",
            "-o",
            "src/rust/p448/llc/square/rust_fiat_p448_solinas_carry_square_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/p448/llc/square/librust_fiat_p448_solinas_carry_square_vec.a",
            "src/rust/p448/llc/square/rust_fiat_p448_solinas_carry_square_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/rust/p448/llc-nasm/square/rust_fiat_p448_solinas_carry_square_vec_nasm.asm",
            "-o",
            "src/rust/p448/llc-nasm/square/rust_fiat_p448_solinas_carry_square_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/p448/llc-nasm/square/librust_fiat_p448_solinas_carry_square_vec_nasm.a",
            "src/rust/p448/llc-nasm/square/rust_fiat_p448_solinas_carry_square_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square)
    build_and_validate_with_formal!(
        "src/rust/p448/cryptopt/square/seed0001754278122744_ratio10040.asm",
        "src/rust/p448/cryptopt/square/seed0001754278122744_ratio10040.o",
        "src/rust/p448/cryptopt/square/librust_fiat_p448_solinas_carry_square_CryptOpt.a",
        "rust_fiat_p448_solinas_carry_square_CryptOpt",
        true, // NASM
        "p448",
        "square",
        8,                   // field size
        "0x300000000000000"  // loose bound
    );
}

fn build_poly1305() {
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/poly1305/llc/mul/rust_fiat_poly1305_carry_mul_vec.asm",
            "-o",
            "src/rust/poly1305/llc/mul/rust_fiat_poly1305_carry_mul_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/poly1305/llc/mul/librust_fiat_poly1305_carry_mul_vec.a",
            "src/rust/poly1305/llc/mul/rust_fiat_poly1305_carry_mul_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/rust/poly1305/llc-nasm/mul/rust_fiat_poly1305_carry_mul_vec_nasm.asm",
            "-o",
            "src/rust/poly1305/llc-nasm/mul/rust_fiat_poly1305_carry_mul_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/poly1305/llc-nasm/mul/librust_fiat_poly1305_carry_mul_vec_nasm.a",
            "src/rust/poly1305/llc-nasm/mul/rust_fiat_poly1305_carry_mul_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/poly1305/cryptopt/mul/seed0001746568049762_ratio10480.asm",
        "src/rust/poly1305/cryptopt/mul/seed0001746568049762_ratio10480.o",
        "src/rust/poly1305/cryptopt/mul/librust_fiat_poly1305_carry_mul_CryptOpt.a",
        "rust_fiat_poly1305_carry_mul_CryptOpt",
        true, // NASM
        "poly1305",
        "mul",
        3,             // field size
        "0x300000000"  // loose bound
    );

    // ---------- SQUARE ----------
    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/poly1305/llc/square/rust_fiat_poly1305_carry_square_vec.asm",
            "-o",
            "src/rust/poly1305/llc/square/rust_fiat_poly1305_carry_square_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/poly1305/llc/square/librust_fiat_poly1305_carry_square_vec.a",
            "src/rust/poly1305/llc/square/rust_fiat_poly1305_carry_square_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/rust/poly1305/llc-nasm/square/rust_fiat_poly1305_carry_square_vec_nasm.asm",
            "-o",
            "src/rust/poly1305/llc-nasm/square/rust_fiat_poly1305_carry_square_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/poly1305/llc-nasm/square/librust_fiat_poly1305_carry_square_vec_nasm.a",
            "src/rust/poly1305/llc-nasm/square/rust_fiat_poly1305_carry_square_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/poly1305/cryptopt/square/seed0001746568793896_ratio10366.asm",
        "src/rust/poly1305/cryptopt/square/seed0001746568793896_ratio10366.o",
        "src/rust/poly1305/cryptopt/square/librust_fiat_poly1305_carry_square_CryptOpt.a",
        "rust_fiat_poly1305_carry_square_CryptOpt",
        true, // NASM
        "poly1305",
        "square",
        3,             // field size
        "0x300000000"  // loose bound
    );
}

fn build_bls12() {
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/bls12/llc/mul/bls12_mul_vec.asm",
            "-o",
            "src/rust/bls12/llc/mul/bls12_mul_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/bls12/llc/mul/libbls12_mul_vec.a",
            "src/rust/bls12/llc/mul/bls12_mul_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/rust/bls12/llc-nasm/mul/bls12_mul_vec_nasm.asm",
            "-o",
            "src/rust/bls12/llc-nasm/mul/bls12_mul_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/bls12/llc-nasm/mul/libbls12_mul_vec_nasm.a",
            "src/rust/bls12/llc-nasm/mul/bls12_mul_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/bls12/cryptopt/mul/seed0001746613146277_ratio06057.asm",
        "src/rust/bls12/cryptopt/mul/seed0001746613146277_ratio06057.o",
        "src/rust/bls12/cryptopt/mul/libbls12_mul_CryptOpt.a",
        "bls12_mul_CryptOpt",
        true, // NASM
        "bls12",
        "mul",
        6,                    // field size
        "0xffffffffffffffff"  // loose bound
    );
}

fn build_secp256k1_dettman() {
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/secp256k1_dettman/llc/mul/rust_fiat_secp256k1_dettman_mul_vec.asm",
            "-o",
            "src/rust/secp256k1_dettman/llc/mul/rust_fiat_secp256k1_dettman_mul_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/secp256k1_dettman/llc/mul/librust_fiat_secp256k1_dettman_mul_vec.a",
            "src/rust/secp256k1_dettman/llc/mul/rust_fiat_secp256k1_dettman_mul_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/rust/secp256k1_dettman/llc-nasm/mul/rust_fiat_secp256k1_dettman_mul_vec_nasm.asm",
            "-o",
            "src/rust/secp256k1_dettman/llc-nasm/mul/rust_fiat_secp256k1_dettman_mul_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/secp256k1_dettman/llc-nasm/mul/librust_fiat_secp256k1_dettman_mul_vec_nasm.a",
            "src/rust/secp256k1_dettman/llc-nasm/mul/rust_fiat_secp256k1_dettman_mul_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/secp256k1_dettman/cryptopt/mul/seed0001746535350242_ratio10550.asm",
        "src/rust/secp256k1_dettman/cryptopt/mul/seed0001746535350242_ratio10550.o",
        "src/rust/secp256k1_dettman/cryptopt/mul/librust_fiat_secp256k1_dettman_mul_CryptOpt.a",
        "rust_fiat_secp256k1_dettman_mul_CryptOpt",
        true, // NASM
        "secp256k1_dettman",
        "mul",
        5,              // field size
        "0x1000003d10"  // loose bound
    );

    // ---------- SQUARE ----------
    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/secp256k1_dettman/llc/square/rust_fiat_secp256k1_dettman_square_vec.asm",
            "-o",
            "src/rust/secp256k1_dettman/llc/square/rust_fiat_secp256k1_dettman_square_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/secp256k1_dettman/llc/square/librust_fiat_secp256k1_dettman_square_vec.a",
            "src/rust/secp256k1_dettman/llc/square/rust_fiat_secp256k1_dettman_square_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/rust/secp256k1_dettman/llc-nasm/square/rust_fiat_secp256k1_dettman_square_vec_nasm.asm",
            "-o",
            "src/rust/secp256k1_dettman/llc-nasm/square/rust_fiat_secp256k1_dettman_square_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/secp256k1_dettman/llc-nasm/square/librust_fiat_secp256k1_dettman_square_vec_nasm.a",
            "src/rust/secp256k1_dettman/llc-nasm/square/rust_fiat_secp256k1_dettman_square_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/secp256k1_dettman/cryptopt/square/seed0001746537458781_ratio09812.asm",
        "src/rust/secp256k1_dettman/cryptopt/square/seed0001746537458781_ratio09812.o",
        "src/rust/secp256k1_dettman/cryptopt/square/librust_fiat_secp256k1_dettman_square_CryptOpt.a",
        "rust_fiat_secp256k1_dettman_square_CryptOpt",
        true,   // NASM
        "secp256k1_dettman",
        "square",
        5,      // field size
        "0x1000003d10"  // loose bound
    );
}

fn build_rust_ec_secp256k1() {
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/rust_ec_secp256k1/llc/mul/rust_ec_secp256k1_mul_inner_vec.asm",
            "-o",
            "src/rust/rust_ec_secp256k1/llc/mul/rust_ec_secp256k1_mul_inner_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/rust_ec_secp256k1/llc/mul/librust_ec_secp256k1_mul_inner_vec.a",
            "src/rust/rust_ec_secp256k1/llc/mul/rust_ec_secp256k1_mul_inner_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/rust/rust_ec_secp256k1/llc-nasm/mul/rust_ec_secp256k1_mul_inner_vec_nasm.asm",
            "-o",
            "src/rust/rust_ec_secp256k1/llc-nasm/mul/rust_ec_secp256k1_mul_inner_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/rust_ec_secp256k1/llc-nasm/mul/librust_ec_secp256k1_mul_inner_vec_nasm.a",
            "src/rust/rust_ec_secp256k1/llc-nasm/mul/rust_ec_secp256k1_mul_inner_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/rust_ec_secp256k1/cryptopt/mul/seed0001746573386443_ratio09947.asm",
        "src/rust/rust_ec_secp256k1/cryptopt/mul/seed0001746573386443_ratio09947.o",
        "src/rust/rust_ec_secp256k1/cryptopt/mul/librust_ec_secp256k1_mul_inner_CryptOpt.a",
        "rust_ec_secp256k1_mul_inner_CryptOpt",
        true, // NASM
        "rust_ec_secp256k1",
        "mul",
        4,                    // field size
        "0xfffffffefffffc30"  // loose bound
    );

    // ---------- SQUARE ----------
    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/rust_ec_secp256k1/llc/square/rust_ec_secp256k1_square_vec.asm",
            "-o",
            "src/rust/rust_ec_secp256k1/llc/square/rust_ec_secp256k1_square_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/rust_ec_secp256k1/llc/square/librust_ec_secp256k1_square_vec.a",
            "src/rust/rust_ec_secp256k1/llc/square/rust_ec_secp256k1_square_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/rust/rust_ec_secp256k1/llc-nasm/square/rust_ec_secp256k1_square_vec_nasm.asm",
            "-o",
            "src/rust/rust_ec_secp256k1/llc-nasm/square/rust_ec_secp256k1_square_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/rust_ec_secp256k1/llc-nasm/square/librust_ec_secp256k1_square_vec_nasm.a",
            "src/rust/rust_ec_secp256k1/llc-nasm/square/rust_ec_secp256k1_square_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/rust_ec_secp256k1/cryptopt/square/seed0001746575048113_ratio08485.asm",
        "src/rust/rust_ec_secp256k1/cryptopt/square/seed0001746575048113_ratio08485.o",
        "src/rust/rust_ec_secp256k1/cryptopt/square/librust_ec_secp256k1_square_CryptOpt.a",
        "rust_ec_secp256k1_square_CryptOpt",
        true, // NASM
        "rust_ec_secp256k1",
        "square",
        4,                    // field size
        "0xfffffffefffffc30"  // loose bound
    );
}
// -------------------------------------------------------------------------
fn build_fiat_c_curve25519() {
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/fiat-curve25519/llc/mul/fiat_c_curve25519_carry_mul_vec.asm",
            "-o",
            "src/c/fiat-curve25519/llc/mul/fiat_c_curve25519_carry_mul_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-curve25519/llc/mul/libfiat_c_curve25519_carry_mul_vec.a",
            "src/c/fiat-curve25519/llc/mul/fiat_c_curve25519_carry_mul_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/c/fiat-curve25519/llc-nasm/mul/fiat_c_curve25519_carry_mul_vec_nasm.asm",
            "-o",
            "src/c/fiat-curve25519/llc-nasm/mul/fiat_c_curve25519_carry_mul_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-curve25519/llc-nasm/mul/libfiat_c_curve25519_carry_mul_vec_nasm.a",
            "src/c/fiat-curve25519/llc-nasm/mul/fiat_c_curve25519_carry_mul_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/c/fiat-curve25519/cryptopt/mul/seed0001746577739851_ratio10864.asm",
        "src/c/fiat-curve25519/cryptopt/mul/seed0001746577739851_ratio10864.o",
        "src/c/fiat-curve25519/cryptopt/mul/libfiat_c_curve25519_carry_mul_CryptOpt.a",
        "fiat_c_curve25519_carry_mul_CryptOpt",
        true, // NASM
        "curve25519",
        "mul",
        4,                  // field size
        "0x18000000000000"  // loose bound
    );

    // ---------- SQUARE ----------
    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/fiat-curve25519/llc/square/fiat_c_curve25519_carry_square_vec.asm",
            "-o",
            "src/c/fiat-curve25519/llc/square/fiat_c_curve25519_carry_square_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-curve25519/llc/square/libfiat_c_curve25519_carry_square_vec.a",
            "src/c/fiat-curve25519/llc/square/fiat_c_curve25519_carry_square_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/c/fiat-curve25519/llc-nasm/square/fiat_c_curve25519_carry_square_vec_nasm.asm",
            "-o",
            "src/c/fiat-curve25519/llc-nasm/square/fiat_c_curve25519_carry_square_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-curve25519/llc-nasm/square/libfiat_c_curve25519_carry_square_vec_nasm.a",
            "src/c/fiat-curve25519/llc-nasm/square/fiat_c_curve25519_carry_square_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/c/fiat-curve25519/cryptopt/square/seed0001746579192069_ratio11076.asm",
        "src/c/fiat-curve25519/cryptopt/square/seed0001746579192069_ratio11076.o",
        "src/c/fiat-curve25519/cryptopt/square/libfiat_c_curve25519_carry_square_CryptOpt.a",
        "fiat_c_curve25519_carry_square_CryptOpt",
        true, // NASM
        "curve25519",
        "square",
        4,                  // field size
        "0x18000000000000"  // loose bound
    );
}

fn build_cryptopt_fiat_curve25519_generated() {
    // Ensure output directories exist for the compiler-generated baselines
    let gcc_dir = "src/cryptopt-fiat/fiat-c/gcc/curve25519/mul";
    let clang_dir = "src/cryptopt-fiat/fiat-c/clang/curve25519/mul";
    let gcc_square_dir = "src/cryptopt-fiat/fiat-c/gcc/curve25519/square";
    let clang_square_dir = "src/cryptopt-fiat/fiat-c/clang/curve25519/square";
    let enhanced_mul_dir = "src/cryptopt-fiat/enhanced/fiat_curve25519_carry_mul";
    fs::create_dir_all(gcc_dir).unwrap();
    fs::create_dir_all(clang_dir).unwrap();
    fs::create_dir_all(gcc_square_dir).unwrap();
    fs::create_dir_all(clang_square_dir).unwrap();
    fs::create_dir_all(enhanced_mul_dir).unwrap();

    let wrapper = "src/cryptopt-fiat/fiat-c/wrappers/curve25519_64_mul_wrapper.c";
    let square_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/curve25519_64_square_wrapper.c";

    // Paths for GCC baseline
    let gcc_asm = "src/cryptopt-fiat/fiat-c/gcc/curve25519/mul/fiat_curve25519_carry_mul_gcc.asm";
    let gcc_obj = "src/cryptopt-fiat/fiat-c/gcc/curve25519/mul/fiat_curve25519_carry_mul_gcc.o";
    let gcc_lib = "src/cryptopt-fiat/fiat-c/gcc/curve25519/mul/libfiat_curve25519_carry_mul_gcc.a";

    // Generate Intel-syntax assembly using GCC, then assemble and archive
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_CURVE25519_BASELINE_NAME=fiat_curve25519_carry_mul_gcc",
            wrapper,
            "-o",
            gcc_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&["-c", "-x", "assembler-with-cpp", gcc_asm, "-o", gcc_obj])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_lib, gcc_obj])
        .status()
        .unwrap()
        .success());

    // Paths for Clang baseline
    let clang_asm =
        "src/cryptopt-fiat/fiat-c/clang/curve25519/mul/fiat_curve25519_carry_mul_clang.asm";
    let clang_obj =
        "src/cryptopt-fiat/fiat-c/clang/curve25519/mul/fiat_curve25519_carry_mul_clang.o";
    let clang_lib =
        "src/cryptopt-fiat/fiat-c/clang/curve25519/mul/libfiat_curve25519_carry_mul_clang.a";

    // Generate Intel-syntax assembly using Clang, then assemble and archive
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_CURVE25519_BASELINE_NAME=fiat_curve25519_carry_mul_clang",
            wrapper,
            "-o",
            clang_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&["-c", "-x", "assembler-with-cpp", clang_asm, "-o", clang_obj])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_lib, clang_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly (seed0000000879783339_ratio12750)
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_curve25519_carry_mul/seed0000000879783339_ratio12750.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_curve25519_carry_mul/seed0000000879783339_ratio12750.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_curve25519_carry_mul/libfiat_curve25519_carry_mul_ratio12750.a",
        "fiat_curve25519_carry_mul",
        true,
        "curve25519",
        "mul",
        5,
        "0x18000000000000"
    );

    // Enhanced CryptOpt assembly variant (manual tweaks)
    let enhanced_mul_asm = "src/cryptopt-fiat/enhanced/fiat_curve25519_carry_mul/x1.asm";
    let enhanced_mul_obj = "src/cryptopt-fiat/enhanced/fiat_curve25519_carry_mul/x1.o";
    let enhanced_mul_lib =
        "src/cryptopt-fiat/enhanced/fiat_curve25519_carry_mul/libfiat_curve25519_carry_mul_enhanced.a";
    assert!(Command::new("nasm")
        .args(&["-f", "elf64", enhanced_mul_asm, "-o", enhanced_mul_obj])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", enhanced_mul_lib, enhanced_mul_obj])
        .status()
        .unwrap()
        .success());

    // ---------- SQUARE ----------
    // GCC baseline for carry_square
    let gcc_square_asm =
        "src/cryptopt-fiat/fiat-c/gcc/curve25519/square/fiat_curve25519_carry_square_gcc.asm";
    let gcc_square_obj =
        "src/cryptopt-fiat/fiat-c/gcc/curve25519/square/fiat_curve25519_carry_square_gcc.o";
    let gcc_square_lib =
        "src/cryptopt-fiat/fiat-c/gcc/curve25519/square/libfiat_curve25519_carry_square_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_CURVE25519_SQUARE_BASELINE_NAME=fiat_curve25519_carry_square_gcc",
            square_wrapper,
            "-o",
            gcc_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_square_asm,
            "-o",
            gcc_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_square_lib, gcc_square_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for carry_square
    let clang_square_asm =
        "src/cryptopt-fiat/fiat-c/clang/curve25519/square/fiat_curve25519_carry_square_clang.asm";
    let clang_square_obj =
        "src/cryptopt-fiat/fiat-c/clang/curve25519/square/fiat_curve25519_carry_square_clang.o";
    let clang_square_lib =
        "src/cryptopt-fiat/fiat-c/clang/curve25519/square/libfiat_curve25519_carry_square_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_CURVE25519_SQUARE_BASELINE_NAME=fiat_curve25519_carry_square_clang",
            square_wrapper,
            "-o",
            clang_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_square_asm,
            "-o",
            clang_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_square_lib, clang_square_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for carry_square (seed0000000995093600_ratio12993)
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_curve25519_carry_square/seed0000000995093600_ratio12993.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_curve25519_carry_square/seed0000000995093600_ratio12993.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_curve25519_carry_square/libfiat_curve25519_carry_square_ratio12993.a",
        "fiat_curve25519_carry_square",
        true,
        "curve25519",
        "square",
        5,
        "0x18000000000000"
    );
}

fn build_cryptopt_fiat_curve25519_solinas() {
    // Ensure output directories exist for compiler-generated baselines
    let gcc_mul_dir = "src/cryptopt-fiat/fiat-c/gcc/curve25519_solinas/mul";
    let clang_mul_dir = "src/cryptopt-fiat/fiat-c/clang/curve25519_solinas/mul";
    let gcc_square_dir = "src/cryptopt-fiat/fiat-c/gcc/curve25519_solinas/square";
    let clang_square_dir = "src/cryptopt-fiat/fiat-c/clang/curve25519_solinas/square";
    fs::create_dir_all(gcc_mul_dir).unwrap();
    fs::create_dir_all(clang_mul_dir).unwrap();
    fs::create_dir_all(gcc_square_dir).unwrap();
    fs::create_dir_all(clang_square_dir).unwrap();

    let mul_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/curve25519_solinas_mul_wrapper.c";
    let square_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/curve25519_solinas_square_wrapper.c";

    // GCC baseline for mul
    let gcc_mul_asm =
        "src/cryptopt-fiat/fiat-c/gcc/curve25519_solinas/mul/fiat_curve25519_solinas_mul_gcc.asm";
    let gcc_mul_obj =
        "src/cryptopt-fiat/fiat-c/gcc/curve25519_solinas/mul/fiat_curve25519_solinas_mul_gcc.o";
    let gcc_mul_lib =
        "src/cryptopt-fiat/fiat-c/gcc/curve25519_solinas/mul/libfiat_curve25519_solinas_mul_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_CURVE25519_SOLINAS_BASELINE_NAME=fiat_curve25519_solinas_mul_gcc",
            mul_wrapper,
            "-o",
            gcc_mul_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_mul_asm,
            "-o",
            gcc_mul_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_mul_lib, gcc_mul_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for mul
    let clang_mul_asm =
        "src/cryptopt-fiat/fiat-c/clang/curve25519_solinas/mul/fiat_curve25519_solinas_mul_clang.asm";
    let clang_mul_obj =
        "src/cryptopt-fiat/fiat-c/clang/curve25519_solinas/mul/fiat_curve25519_solinas_mul_clang.o";
    let clang_mul_lib =
        "src/cryptopt-fiat/fiat-c/clang/curve25519_solinas/mul/libfiat_curve25519_solinas_mul_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_CURVE25519_SOLINAS_BASELINE_NAME=fiat_curve25519_solinas_mul_clang",
            mul_wrapper,
            "-o",
            clang_mul_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_mul_asm,
            "-o",
            clang_mul_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_mul_lib, clang_mul_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for mul
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_curve25519_solinas_mul/seed0000000356490115_ratio18494.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_curve25519_solinas_mul/seed0000000356490115_ratio18494.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_curve25519_solinas_mul/libfiat_curve25519_solinas_mul_ratio18494.a",
        "fiat_curve25519_solinas_mul",
        true,
        "curve25519_solinas",
        "mul",
        4,
        "0xffffffffffffffff"
    );

    // GCC baseline for square
    let gcc_square_asm =
        "src/cryptopt-fiat/fiat-c/gcc/curve25519_solinas/square/fiat_curve25519_solinas_square_gcc.asm";
    let gcc_square_obj =
        "src/cryptopt-fiat/fiat-c/gcc/curve25519_solinas/square/fiat_curve25519_solinas_square_gcc.o";
    let gcc_square_lib =
        "src/cryptopt-fiat/fiat-c/gcc/curve25519_solinas/square/libfiat_curve25519_solinas_square_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_CURVE25519_SOLINAS_SQUARE_BASELINE_NAME=fiat_curve25519_solinas_square_gcc",
            square_wrapper,
            "-o",
            gcc_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_square_asm,
            "-o",
            gcc_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_square_lib, gcc_square_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for square
    let clang_square_asm =
        "src/cryptopt-fiat/fiat-c/clang/curve25519_solinas/square/fiat_curve25519_solinas_square_clang.asm";
    let clang_square_obj =
        "src/cryptopt-fiat/fiat-c/clang/curve25519_solinas/square/fiat_curve25519_solinas_square_clang.o";
    let clang_square_lib =
        "src/cryptopt-fiat/fiat-c/clang/curve25519_solinas/square/libfiat_curve25519_solinas_square_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_CURVE25519_SOLINAS_SQUARE_BASELINE_NAME=fiat_curve25519_solinas_square_clang",
            square_wrapper,
            "-o",
            clang_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_square_asm,
            "-o",
            clang_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_square_lib, clang_square_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for square
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_curve25519_solinas_square/seed0000000194085448_ratio15409.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_curve25519_solinas_square/seed0000000194085448_ratio15409.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_curve25519_solinas_square/libfiat_curve25519_solinas_square_ratio15409.a",
        "fiat_curve25519_solinas_square",
        true,
        "curve25519_solinas",
        "square",
        4,
        "0xffffffffffffffff"
    );
}

fn build_cryptopt_fiat_p224() {
    let gcc_mul_dir = "src/cryptopt-fiat/fiat-c/gcc/p224/mul";
    let clang_mul_dir = "src/cryptopt-fiat/fiat-c/clang/p224/mul";
    let gcc_square_dir = "src/cryptopt-fiat/fiat-c/gcc/p224/square";
    let clang_square_dir = "src/cryptopt-fiat/fiat-c/clang/p224/square";
    fs::create_dir_all(gcc_mul_dir).unwrap();
    fs::create_dir_all(clang_mul_dir).unwrap();
    fs::create_dir_all(gcc_square_dir).unwrap();
    fs::create_dir_all(clang_square_dir).unwrap();

    let mul_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/p224_mul_wrapper.c";
    let square_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/p224_square_wrapper.c";

    // GCC baseline for mul
    let gcc_mul_asm = "src/cryptopt-fiat/fiat-c/gcc/p224/mul/fiat_p224_mul_gcc.asm";
    let gcc_mul_obj = "src/cryptopt-fiat/fiat-c/gcc/p224/mul/fiat_p224_mul_gcc.o";
    let gcc_mul_lib = "src/cryptopt-fiat/fiat-c/gcc/p224/mul/libfiat_p224_mul_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P224_BASELINE_NAME=fiat_p224_mul_gcc",
            mul_wrapper,
            "-o",
            gcc_mul_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_mul_asm,
            "-o",
            gcc_mul_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_mul_lib, gcc_mul_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for mul
    let clang_mul_asm = "src/cryptopt-fiat/fiat-c/clang/p224/mul/fiat_p224_mul_clang.asm";
    let clang_mul_obj = "src/cryptopt-fiat/fiat-c/clang/p224/mul/fiat_p224_mul_clang.o";
    let clang_mul_lib = "src/cryptopt-fiat/fiat-c/clang/p224/mul/libfiat_p224_mul_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P224_BASELINE_NAME=fiat_p224_mul_clang",
            mul_wrapper,
            "-o",
            clang_mul_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_mul_asm,
            "-o",
            clang_mul_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_mul_lib, clang_mul_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for mul
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p224_mul/seed0000000230781590_ratio16447.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p224_mul/seed0000000230781590_ratio16447.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p224_mul/libfiat_p224_mul_ratio16447.a",
        "fiat_p224_mul",
        true,
        "p224",
        "mul",
        4,
        "0xffffffffffffffff"
    );

    // GCC baseline for square
    let gcc_square_asm = "src/cryptopt-fiat/fiat-c/gcc/p224/square/fiat_p224_square_gcc.asm";
    let gcc_square_obj = "src/cryptopt-fiat/fiat-c/gcc/p224/square/fiat_p224_square_gcc.o";
    let gcc_square_lib = "src/cryptopt-fiat/fiat-c/gcc/p224/square/libfiat_p224_square_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P224_SQUARE_BASELINE_NAME=fiat_p224_square_gcc",
            square_wrapper,
            "-o",
            gcc_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_square_asm,
            "-o",
            gcc_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_square_lib, gcc_square_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for square
    let clang_square_asm = "src/cryptopt-fiat/fiat-c/clang/p224/square/fiat_p224_square_clang.asm";
    let clang_square_obj = "src/cryptopt-fiat/fiat-c/clang/p224/square/fiat_p224_square_clang.o";
    let clang_square_lib = "src/cryptopt-fiat/fiat-c/clang/p224/square/libfiat_p224_square_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P224_SQUARE_BASELINE_NAME=fiat_p224_square_clang",
            square_wrapper,
            "-o",
            clang_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_square_asm,
            "-o",
            clang_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_square_lib, clang_square_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for square
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p224_square/seed0000000638333753_ratio14731.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p224_square/seed0000000638333753_ratio14731.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p224_square/libfiat_p224_square_ratio14731.a",
        "fiat_p224_square",
        true,
        "p224",
        "square",
        4,
        "0xffffffffffffffff"
    );
}

fn build_cryptopt_fiat_p256() {
    let gcc_mul_dir = "src/cryptopt-fiat/fiat-c/gcc/p256/mul";
    let clang_mul_dir = "src/cryptopt-fiat/fiat-c/clang/p256/mul";
    let gcc_square_dir = "src/cryptopt-fiat/fiat-c/gcc/p256/square";
    let clang_square_dir = "src/cryptopt-fiat/fiat-c/clang/p256/square";
    let openssl_hand_dir = "src/c/openssl-p256/hand-optimised";
    fs::create_dir_all(gcc_mul_dir).unwrap();
    fs::create_dir_all(clang_mul_dir).unwrap();
    fs::create_dir_all(gcc_square_dir).unwrap();
    fs::create_dir_all(clang_square_dir).unwrap();
    fs::create_dir_all(openssl_hand_dir).unwrap();

    let mul_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/p256_mul_wrapper.c";
    let square_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/p256_square_wrapper.c";

    // GCC baseline for mul
    let gcc_mul_asm = "src/cryptopt-fiat/fiat-c/gcc/p256/mul/fiat_p256_mul_gcc.asm";
    let gcc_mul_obj = "src/cryptopt-fiat/fiat-c/gcc/p256/mul/fiat_p256_mul_gcc.o";
    let gcc_mul_lib = "src/cryptopt-fiat/fiat-c/gcc/p256/mul/libfiat_p256_mul_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P256_BASELINE_NAME=fiat_p256_mul_gcc",
            mul_wrapper,
            "-o",
            gcc_mul_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_mul_asm,
            "-o",
            gcc_mul_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_mul_lib, gcc_mul_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for mul
    let clang_mul_asm = "src/cryptopt-fiat/fiat-c/clang/p256/mul/fiat_p256_mul_clang.asm";
    let clang_mul_obj = "src/cryptopt-fiat/fiat-c/clang/p256/mul/fiat_p256_mul_clang.o";
    let clang_mul_lib = "src/cryptopt-fiat/fiat-c/clang/p256/mul/libfiat_p256_mul_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P256_BASELINE_NAME=fiat_p256_mul_clang",
            mul_wrapper,
            "-o",
            clang_mul_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_mul_asm,
            "-o",
            clang_mul_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_mul_lib, clang_mul_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for mul
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p256_mul/seed0000000176686913_ratio17527.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p256_mul/seed0000000176686913_ratio17527.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p256_mul/libfiat_p256_mul_ratio17527.a",
        "fiat_p256_mul",
        true,
        "p256",
        "mul",
        4,
        "0xffffffffffffffff"
    );

    // GCC baseline for square
    let gcc_square_asm = "src/cryptopt-fiat/fiat-c/gcc/p256/square/fiat_p256_square_gcc.asm";
    let gcc_square_obj = "src/cryptopt-fiat/fiat-c/gcc/p256/square/fiat_p256_square_gcc.o";
    let gcc_square_lib = "src/cryptopt-fiat/fiat-c/gcc/p256/square/libfiat_p256_square_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P256_SQUARE_BASELINE_NAME=fiat_p256_square_gcc",
            square_wrapper,
            "-o",
            gcc_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_square_asm,
            "-o",
            gcc_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_square_lib, gcc_square_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for square
    let clang_square_asm = "src/cryptopt-fiat/fiat-c/clang/p256/square/fiat_p256_square_clang.asm";
    let clang_square_obj = "src/cryptopt-fiat/fiat-c/clang/p256/square/fiat_p256_square_clang.o";
    let clang_square_lib = "src/cryptopt-fiat/fiat-c/clang/p256/square/libfiat_p256_square_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P256_SQUARE_BASELINE_NAME=fiat_p256_square_clang",
            square_wrapper,
            "-o",
            clang_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_square_asm,
            "-o",
            clang_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_square_lib, clang_square_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for square
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p256_square/seed0000000809815865_ratio17019.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p256_square/seed0000000809815865_ratio17019.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p256_square/libfiat_p256_square_ratio17019.a",
        "fiat_p256_square",
        true,
        "p256",
        "square",
        4,
        "0xffffffffffffffff"
    );

    // OpenSSL hand-optimised P256 assembly (mul and square)
    let openssl_hand_mul_lib = format!("{}/libopenssl_p256_hand_optimised.a", openssl_hand_dir);
    let openssl_asm_output = "target/openssl_p256_hand.s";
    let perl_script = "ecp_nistz256-x86_64.pl";
    let perl_output_arg = format!("../../{}", openssl_asm_output);
    let mut perl_cmd = Command::new("perl");
    perl_cmd
        .env(
            "CC",
            std::env::var("CC").unwrap_or_else(|_| "cc".to_string()),
        )
        .current_dir("src/openssl-asm")
        .args(&[perl_script, "linux64", &perl_output_arg]);
    assert!(perl_cmd.status().unwrap().success());

    let openssl_asm_obj = "target/openssl_p256_hand.o";
    assert!(Command::new("clang")
        .args(&["-c", openssl_asm_output, "-o", openssl_asm_obj])
        .status()
        .unwrap()
        .success());

    let wrapper_c = "target/openssl_p256_wrappers.c";
    {
        let mut file = File::create(wrapper_c).unwrap();
        file.write_all(
            b"#include <stdint.h>\n\nvoid ecp_nistz256_mul_mont(uint64_t res[4], const uint64_t a[4], const uint64_t b[4]);\nvoid ecp_nistz256_sqr_mont(uint64_t res[4], const uint64_t a[4]);\n\nvoid open_ssl_p256_mul_mont(uint64_t res[4], const uint64_t a[4], const uint64_t b[4]) {\n    ecp_nistz256_mul_mont(res, a, b);\n}\n\nvoid open_ssl_p256_sqr_mont(uint64_t res[4], const uint64_t a[4]) {\n    ecp_nistz256_sqr_mont(res, a);\n}\n"
        )
        .unwrap();
    }

    let wrapper_obj = "target/openssl_p256_wrappers.o";
    assert!(Command::new("clang")
        .args(&["-O2", "-c", wrapper_c, "-o", wrapper_obj])
        .status()
        .unwrap()
        .success());

    let cap_stub = "target/openssl_p256_cap.c";
    {
        let mut file = File::create(cap_stub).unwrap();
        file.write_all(b"#include <stdint.h>\nunsigned int OPENSSL_ia32cap_P[4] = {0, 0, 0, 0};\n")
            .unwrap();
    }

    let cap_obj = "target/openssl_p256_cap.o";
    assert!(Command::new("clang")
        .args(&["-c", cap_stub, "-o", cap_obj])
        .status()
        .unwrap()
        .success());

    assert!(Command::new("ar")
        .args(&[
            "rcs",
            &openssl_hand_mul_lib,
            openssl_asm_obj,
            wrapper_obj,
            cap_obj
        ])
        .status()
        .unwrap()
        .success());
}

fn build_cryptopt_fiat_p384() {
    let gcc_mul_dir = "src/cryptopt-fiat/fiat-c/gcc/p384/mul";
    let clang_mul_dir = "src/cryptopt-fiat/fiat-c/clang/p384/mul";
    let gcc_square_dir = "src/cryptopt-fiat/fiat-c/gcc/p384/square";
    let clang_square_dir = "src/cryptopt-fiat/fiat-c/clang/p384/square";
    fs::create_dir_all(gcc_mul_dir).unwrap();
    fs::create_dir_all(clang_mul_dir).unwrap();
    fs::create_dir_all(gcc_square_dir).unwrap();
    fs::create_dir_all(clang_square_dir).unwrap();

    let mul_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/p384_mul_wrapper.c";
    let square_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/p384_square_wrapper.c";

    // GCC baseline for mul
    let gcc_mul_asm = "src/cryptopt-fiat/fiat-c/gcc/p384/mul/fiat_p384_mul_gcc.asm";
    let gcc_mul_obj = "src/cryptopt-fiat/fiat-c/gcc/p384/mul/fiat_p384_mul_gcc.o";
    let gcc_mul_lib = "src/cryptopt-fiat/fiat-c/gcc/p384/mul/libfiat_p384_mul_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P384_BASELINE_NAME=fiat_p384_mul_gcc",
            mul_wrapper,
            "-o",
            gcc_mul_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_mul_asm,
            "-o",
            gcc_mul_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_mul_lib, gcc_mul_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for mul
    let clang_mul_asm = "src/cryptopt-fiat/fiat-c/clang/p384/mul/fiat_p384_mul_clang.asm";
    let clang_mul_obj = "src/cryptopt-fiat/fiat-c/clang/p384/mul/fiat_p384_mul_clang.o";
    let clang_mul_lib = "src/cryptopt-fiat/fiat-c/clang/p384/mul/libfiat_p384_mul_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P384_BASELINE_NAME=fiat_p384_mul_clang",
            mul_wrapper,
            "-o",
            clang_mul_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_mul_asm,
            "-o",
            clang_mul_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_mul_lib, clang_mul_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for mul
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p384_mul/seed0000000671992404_ratio17232.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p384_mul/seed0000000671992404_ratio17232.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p384_mul/libfiat_p384_mul_ratio17232.a",
        "fiat_p384_mul",
        true,
        "p384",
        "mul",
        6,
        "0xffffffffffffffff"
    );

    // GCC baseline for square
    let gcc_square_asm = "src/cryptopt-fiat/fiat-c/gcc/p384/square/fiat_p384_square_gcc.asm";
    let gcc_square_obj = "src/cryptopt-fiat/fiat-c/gcc/p384/square/fiat_p384_square_gcc.o";
    let gcc_square_lib = "src/cryptopt-fiat/fiat-c/gcc/p384/square/libfiat_p384_square_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P384_SQUARE_BASELINE_NAME=fiat_p384_square_gcc",
            square_wrapper,
            "-o",
            gcc_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_square_asm,
            "-o",
            gcc_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_square_lib, gcc_square_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for square
    let clang_square_asm = "src/cryptopt-fiat/fiat-c/clang/p384/square/fiat_p384_square_clang.asm";
    let clang_square_obj = "src/cryptopt-fiat/fiat-c/clang/p384/square/fiat_p384_square_clang.o";
    let clang_square_lib = "src/cryptopt-fiat/fiat-c/clang/p384/square/libfiat_p384_square_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P384_SQUARE_BASELINE_NAME=fiat_p384_square_clang",
            square_wrapper,
            "-o",
            clang_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_square_asm,
            "-o",
            clang_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_square_lib, clang_square_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for square
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p384_square/seed0000000274547940_ratio16784.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p384_square/seed0000000274547940_ratio16784.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p384_square/libfiat_p384_square_ratio16784.a",
        "fiat_p384_square",
        true,
        "p384",
        "square",
        6,
        "0xffffffffffffffff"
    );
}

fn build_cryptopt_fiat_p434() {
    let gcc_mul_dir = "src/cryptopt-fiat/fiat-c/gcc/p434/mul";
    let clang_mul_dir = "src/cryptopt-fiat/fiat-c/clang/p434/mul";
    let gcc_square_dir = "src/cryptopt-fiat/fiat-c/gcc/p434/square";
    let clang_square_dir = "src/cryptopt-fiat/fiat-c/clang/p434/square";
    fs::create_dir_all(gcc_mul_dir).unwrap();
    fs::create_dir_all(clang_mul_dir).unwrap();
    fs::create_dir_all(gcc_square_dir).unwrap();
    fs::create_dir_all(clang_square_dir).unwrap();

    let mul_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/p434_mul_wrapper.c";
    let square_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/p434_square_wrapper.c";

    // GCC baseline for mul
    let gcc_mul_asm = "src/cryptopt-fiat/fiat-c/gcc/p434/mul/fiat_p434_mul_gcc.asm";
    let gcc_mul_obj = "src/cryptopt-fiat/fiat-c/gcc/p434/mul/fiat_p434_mul_gcc.o";
    let gcc_mul_lib = "src/cryptopt-fiat/fiat-c/gcc/p434/mul/libfiat_p434_mul_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P434_BASELINE_NAME=fiat_p434_mul_gcc",
            mul_wrapper,
            "-o",
            gcc_mul_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_mul_asm,
            "-o",
            gcc_mul_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_mul_lib, gcc_mul_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for mul
    let clang_mul_asm = "src/cryptopt-fiat/fiat-c/clang/p434/mul/fiat_p434_mul_clang.asm";
    let clang_mul_obj = "src/cryptopt-fiat/fiat-c/clang/p434/mul/fiat_p434_mul_clang.o";
    let clang_mul_lib = "src/cryptopt-fiat/fiat-c/clang/p434/mul/libfiat_p434_mul_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P434_BASELINE_NAME=fiat_p434_mul_clang",
            mul_wrapper,
            "-o",
            clang_mul_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_mul_asm,
            "-o",
            clang_mul_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_mul_lib, clang_mul_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for mul
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p434_mul/seed0000000492212526_ratio19146.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p434_mul/seed0000000492212526_ratio19146.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p434_mul/libfiat_p434_mul_ratio19146.a",
        "fiat_p434_mul",
        true,
        "p434",
        "mul",
        7,
        "0xffffffffffffffff"
    );

    // GCC baseline for square
    let gcc_square_asm = "src/cryptopt-fiat/fiat-c/gcc/p434/square/fiat_p434_square_gcc.asm";
    let gcc_square_obj = "src/cryptopt-fiat/fiat-c/gcc/p434/square/fiat_p434_square_gcc.o";
    let gcc_square_lib = "src/cryptopt-fiat/fiat-c/gcc/p434/square/libfiat_p434_square_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P434_SQUARE_BASELINE_NAME=fiat_p434_square_gcc",
            square_wrapper,
            "-o",
            gcc_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_square_asm,
            "-o",
            gcc_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_square_lib, gcc_square_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for square
    let clang_square_asm = "src/cryptopt-fiat/fiat-c/clang/p434/square/fiat_p434_square_clang.asm";
    let clang_square_obj = "src/cryptopt-fiat/fiat-c/clang/p434/square/fiat_p434_square_clang.o";
    let clang_square_lib = "src/cryptopt-fiat/fiat-c/clang/p434/square/libfiat_p434_square_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P434_SQUARE_BASELINE_NAME=fiat_p434_square_clang",
            square_wrapper,
            "-o",
            clang_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_square_asm,
            "-o",
            clang_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_square_lib, clang_square_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for square
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p434_square/seed0000000208775533_ratio18549.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p434_square/seed0000000208775533_ratio18549.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p434_square/libfiat_p434_square_ratio18549.a",
        "fiat_p434_square",
        true,
        "p434",
        "square",
        7,
        "0xffffffffffffffff"
    );
}

fn build_cryptopt_fiat_p448_solinas() {
    let gcc_mul_dir = "src/cryptopt-fiat/fiat-c/gcc/p448_solinas/mul";
    let clang_mul_dir = "src/cryptopt-fiat/fiat-c/clang/p448_solinas/mul";
    let gcc_square_dir = "src/cryptopt-fiat/fiat-c/gcc/p448_solinas/square";
    let clang_square_dir = "src/cryptopt-fiat/fiat-c/clang/p448_solinas/square";
    fs::create_dir_all(gcc_mul_dir).unwrap();
    fs::create_dir_all(clang_mul_dir).unwrap();
    fs::create_dir_all(gcc_square_dir).unwrap();
    fs::create_dir_all(clang_square_dir).unwrap();

    let mul_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/p448_solinas_mul_wrapper.c";
    let square_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/p448_solinas_square_wrapper.c";

    // GCC baseline for mul
    let gcc_mul_asm =
        "src/cryptopt-fiat/fiat-c/gcc/p448_solinas/mul/fiat_p448_solinas_carry_mul_gcc.asm";
    let gcc_mul_obj =
        "src/cryptopt-fiat/fiat-c/gcc/p448_solinas/mul/fiat_p448_solinas_carry_mul_gcc.o";
    let gcc_mul_lib =
        "src/cryptopt-fiat/fiat-c/gcc/p448_solinas/mul/libfiat_p448_solinas_carry_mul_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P448_SOLINAS_BASELINE_NAME=fiat_p448_solinas_carry_mul_gcc",
            mul_wrapper,
            "-o",
            gcc_mul_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_mul_asm,
            "-o",
            gcc_mul_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_mul_lib, gcc_mul_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for mul
    let clang_mul_asm =
        "src/cryptopt-fiat/fiat-c/clang/p448_solinas/mul/fiat_p448_solinas_carry_mul_clang.asm";
    let clang_mul_obj =
        "src/cryptopt-fiat/fiat-c/clang/p448_solinas/mul/fiat_p448_solinas_carry_mul_clang.o";
    let clang_mul_lib =
        "src/cryptopt-fiat/fiat-c/clang/p448_solinas/mul/libfiat_p448_solinas_carry_mul_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P448_SOLINAS_BASELINE_NAME=fiat_p448_solinas_carry_mul_clang",
            mul_wrapper,
            "-o",
            clang_mul_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_mul_asm,
            "-o",
            clang_mul_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_mul_lib, clang_mul_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for mul
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p448_solinas_carry_mul/seed0000000840933824_ratio13296.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p448_solinas_carry_mul/seed0000000840933824_ratio13296.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p448_solinas_carry_mul/libfiat_p448_solinas_carry_mul_ratio13296.a",
        "fiat_p448_solinas_carry_mul",
        true,
        "p448_solinas",
        "mul",
        8,
        "0x300000000000000"
    );

    // GCC baseline for square
    let gcc_square_asm =
        "src/cryptopt-fiat/fiat-c/gcc/p448_solinas/square/fiat_p448_solinas_carry_square_gcc.asm";
    let gcc_square_obj =
        "src/cryptopt-fiat/fiat-c/gcc/p448_solinas/square/fiat_p448_solinas_carry_square_gcc.o";
    let gcc_square_lib =
        "src/cryptopt-fiat/fiat-c/gcc/p448_solinas/square/libfiat_p448_solinas_carry_square_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P448_SOLINAS_SQUARE_BASELINE_NAME=fiat_p448_solinas_carry_square_gcc",
            square_wrapper,
            "-o",
            gcc_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_square_asm,
            "-o",
            gcc_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_square_lib, gcc_square_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for square
    let clang_square_asm =
        "src/cryptopt-fiat/fiat-c/clang/p448_solinas/square/fiat_p448_solinas_carry_square_clang.asm";
    let clang_square_obj =
        "src/cryptopt-fiat/fiat-c/clang/p448_solinas/square/fiat_p448_solinas_carry_square_clang.o";
    let clang_square_lib =
        "src/cryptopt-fiat/fiat-c/clang/p448_solinas/square/libfiat_p448_solinas_carry_square_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P448_SOLINAS_SQUARE_BASELINE_NAME=fiat_p448_solinas_carry_square_clang",
            square_wrapper,
            "-o",
            clang_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_square_asm,
            "-o",
            clang_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_square_lib, clang_square_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for square
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p448_solinas_carry_square/seed0000000774799711_ratio11436.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p448_solinas_carry_square/seed0000000774799711_ratio11436.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p448_solinas_carry_square/libfiat_p448_solinas_carry_square_ratio11436.a",
        "fiat_p448_solinas_carry_square",
        true,
        "p448_solinas",
        "square",
        8,
        "0x300000000000000"
    );
}

fn build_cryptopt_fiat_poly1305() {
    let gcc_mul_dir = "src/cryptopt-fiat/fiat-c/gcc/poly1305/mul";
    let clang_mul_dir = "src/cryptopt-fiat/fiat-c/clang/poly1305/mul";
    let gcc_square_dir = "src/cryptopt-fiat/fiat-c/gcc/poly1305/square";
    let clang_square_dir = "src/cryptopt-fiat/fiat-c/clang/poly1305/square";
    fs::create_dir_all(gcc_mul_dir).unwrap();
    fs::create_dir_all(clang_mul_dir).unwrap();
    fs::create_dir_all(gcc_square_dir).unwrap();
    fs::create_dir_all(clang_square_dir).unwrap();

    let mul_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/poly1305_mul_wrapper.c";
    let square_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/poly1305_square_wrapper.c";

    // GCC baseline for mul
    let gcc_mul_asm = "src/cryptopt-fiat/fiat-c/gcc/poly1305/mul/fiat_poly1305_carry_mul_gcc.asm";
    let gcc_mul_obj = "src/cryptopt-fiat/fiat-c/gcc/poly1305/mul/fiat_poly1305_carry_mul_gcc.o";
    let gcc_mul_lib = "src/cryptopt-fiat/fiat-c/gcc/poly1305/mul/libfiat_poly1305_carry_mul_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_POLY1305_BASELINE_NAME=fiat_poly1305_carry_mul_gcc",
            mul_wrapper,
            "-o",
            gcc_mul_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_mul_asm,
            "-o",
            gcc_mul_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_mul_lib, gcc_mul_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for mul
    let clang_mul_asm =
        "src/cryptopt-fiat/fiat-c/clang/poly1305/mul/fiat_poly1305_carry_mul_clang.asm";
    let clang_mul_obj =
        "src/cryptopt-fiat/fiat-c/clang/poly1305/mul/fiat_poly1305_carry_mul_clang.o";
    let clang_mul_lib =
        "src/cryptopt-fiat/fiat-c/clang/poly1305/mul/libfiat_poly1305_carry_mul_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_POLY1305_BASELINE_NAME=fiat_poly1305_carry_mul_clang",
            mul_wrapper,
            "-o",
            clang_mul_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_mul_asm,
            "-o",
            clang_mul_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_mul_lib, clang_mul_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for mul
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_poly1305_carry_mul/seed2092515808618690_ratio12222.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_poly1305_carry_mul/seed2092515808618690_ratio12222.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_poly1305_carry_mul/libfiat_poly1305_carry_mul_ratio12222.a",
        "fiat_poly1305_carry_mul",
        true,
        "poly1305",
        "mul",
        3,
        "0x300000000000"
    );

    // GCC baseline for square
    let gcc_square_asm =
        "src/cryptopt-fiat/fiat-c/gcc/poly1305/square/fiat_poly1305_carry_square_gcc.asm";
    let gcc_square_obj =
        "src/cryptopt-fiat/fiat-c/gcc/poly1305/square/fiat_poly1305_carry_square_gcc.o";
    let gcc_square_lib =
        "src/cryptopt-fiat/fiat-c/gcc/poly1305/square/libfiat_poly1305_carry_square_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_POLY1305_SQUARE_BASELINE_NAME=fiat_poly1305_carry_square_gcc",
            square_wrapper,
            "-o",
            gcc_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_square_asm,
            "-o",
            gcc_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_square_lib, gcc_square_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for square
    let clang_square_asm =
        "src/cryptopt-fiat/fiat-c/clang/poly1305/square/fiat_poly1305_carry_square_clang.asm";
    let clang_square_obj =
        "src/cryptopt-fiat/fiat-c/clang/poly1305/square/fiat_poly1305_carry_square_clang.o";
    let clang_square_lib =
        "src/cryptopt-fiat/fiat-c/clang/poly1305/square/libfiat_poly1305_carry_square_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_POLY1305_SQUARE_BASELINE_NAME=fiat_poly1305_carry_square_clang",
            square_wrapper,
            "-o",
            clang_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_square_asm,
            "-o",
            clang_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_square_lib, clang_square_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for square
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_poly1305_carry_square/seed0000000053624325_ratio12095.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_poly1305_carry_square/seed0000000053624325_ratio12095.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_poly1305_carry_square/libfiat_poly1305_carry_square_ratio12095.a",
        "fiat_poly1305_carry_square",
        true,
        "poly1305",
        "square",
        3,
        "0x300000000000"
    );
}

fn build_cryptopt_fiat_secp256k1_dettman() {
    let gcc_mul_dir = "src/cryptopt-fiat/fiat-c/gcc/secp256k1_dettman/mul";
    let clang_mul_dir = "src/cryptopt-fiat/fiat-c/clang/secp256k1_dettman/mul";
    let gcc_square_dir = "src/cryptopt-fiat/fiat-c/gcc/secp256k1_dettman/square";
    let clang_square_dir = "src/cryptopt-fiat/fiat-c/clang/secp256k1_dettman/square";
    fs::create_dir_all(gcc_mul_dir).unwrap();
    fs::create_dir_all(clang_mul_dir).unwrap();
    fs::create_dir_all(gcc_square_dir).unwrap();
    fs::create_dir_all(clang_square_dir).unwrap();

    let mul_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/secp256k1_dettman_mul_wrapper.c";
    let square_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/secp256k1_dettman_square_wrapper.c";

    // GCC baseline for mul
    let gcc_mul_asm =
        "src/cryptopt-fiat/fiat-c/gcc/secp256k1_dettman/mul/fiat_secp256k1_dettman_mul_gcc.asm";
    let gcc_mul_obj =
        "src/cryptopt-fiat/fiat-c/gcc/secp256k1_dettman/mul/fiat_secp256k1_dettman_mul_gcc.o";
    let gcc_mul_lib =
        "src/cryptopt-fiat/fiat-c/gcc/secp256k1_dettman/mul/libfiat_secp256k1_dettman_mul_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_SECP256K1_DETTMAN_BASELINE_NAME=fiat_secp256k1_dettman_mul_gcc",
            mul_wrapper,
            "-o",
            gcc_mul_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_mul_asm,
            "-o",
            gcc_mul_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_mul_lib, gcc_mul_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for mul
    let clang_mul_asm =
        "src/cryptopt-fiat/fiat-c/clang/secp256k1_dettman/mul/fiat_secp256k1_dettman_mul_clang.asm";
    let clang_mul_obj =
        "src/cryptopt-fiat/fiat-c/clang/secp256k1_dettman/mul/fiat_secp256k1_dettman_mul_clang.o";
    let clang_mul_lib =
        "src/cryptopt-fiat/fiat-c/clang/secp256k1_dettman/mul/libfiat_secp256k1_dettman_mul_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_SECP256K1_DETTMAN_BASELINE_NAME=fiat_secp256k1_dettman_mul_clang",
            mul_wrapper,
            "-o",
            clang_mul_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_mul_asm,
            "-o",
            clang_mul_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_mul_lib, clang_mul_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for mul
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_secp256k1_dettman_mul/seed0000000754074063_ratio11508.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_secp256k1_dettman_mul/seed0000000754074063_ratio11508.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_secp256k1_dettman_mul/libfiat_secp256k1_dettman_mul_ratio11508.a",
        "fiat_secp256k1_dettman_mul",
        true,
        "secp256k1_dettman",
        "mul",
        5,
        "0x1ffffffffffffe"
    );

    // GCC baseline for square
    let gcc_square_asm =
        "src/cryptopt-fiat/fiat-c/gcc/secp256k1_dettman/square/fiat_secp256k1_dettman_square_gcc.asm";
    let gcc_square_obj =
        "src/cryptopt-fiat/fiat-c/gcc/secp256k1_dettman/square/fiat_secp256k1_dettman_square_gcc.o";
    let gcc_square_lib =
        "src/cryptopt-fiat/fiat-c/gcc/secp256k1_dettman/square/libfiat_secp256k1_dettman_square_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_SECP256K1_DETTMAN_SQUARE_BASELINE_NAME=fiat_secp256k1_dettman_square_gcc",
            square_wrapper,
            "-o",
            gcc_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_square_asm,
            "-o",
            gcc_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_square_lib, gcc_square_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for square
    let clang_square_asm =
        "src/cryptopt-fiat/fiat-c/clang/secp256k1_dettman/square/fiat_secp256k1_dettman_square_clang.asm";
    let clang_square_obj =
        "src/cryptopt-fiat/fiat-c/clang/secp256k1_dettman/square/fiat_secp256k1_dettman_square_clang.o";
    let clang_square_lib =
        "src/cryptopt-fiat/fiat-c/clang/secp256k1_dettman/square/libfiat_secp256k1_dettman_square_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_SECP256K1_DETTMAN_SQUARE_BASELINE_NAME=fiat_secp256k1_dettman_square_clang",
            square_wrapper,
            "-o",
            clang_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_square_asm,
            "-o",
            clang_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_square_lib, clang_square_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for square
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_secp256k1_dettman_square/seed0000000393571661_ratio11258.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_secp256k1_dettman_square/seed0000000393571661_ratio11258.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_secp256k1_dettman_square/libfiat_secp256k1_dettman_square_ratio11258.a",
        "fiat_secp256k1_dettman_square",
        true,
        "secp256k1_dettman",
        "square",
        5,
        "0x1ffffffffffffe"
    );
}

fn build_cryptopt_fiat_secp256k1_montgomery() {
    let gcc_mul_dir = "src/cryptopt-fiat/fiat-c/gcc/secp256k1_montgomery/mul";
    let clang_mul_dir = "src/cryptopt-fiat/fiat-c/clang/secp256k1_montgomery/mul";
    let gcc_square_dir = "src/cryptopt-fiat/fiat-c/gcc/secp256k1_montgomery/square";
    let clang_square_dir = "src/cryptopt-fiat/fiat-c/clang/secp256k1_montgomery/square";
    fs::create_dir_all(gcc_mul_dir).unwrap();
    fs::create_dir_all(clang_mul_dir).unwrap();
    fs::create_dir_all(gcc_square_dir).unwrap();
    fs::create_dir_all(clang_square_dir).unwrap();

    let mul_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/secp256k1_montgomery_mul_wrapper.c";
    let square_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/secp256k1_montgomery_square_wrapper.c";

    // GCC baseline for mul
    let gcc_mul_asm =
        "src/cryptopt-fiat/fiat-c/gcc/secp256k1_montgomery/mul/fiat_secp256k1_montgomery_mul_gcc.asm";
    let gcc_mul_obj =
        "src/cryptopt-fiat/fiat-c/gcc/secp256k1_montgomery/mul/fiat_secp256k1_montgomery_mul_gcc.o";
    let gcc_mul_lib =
        "src/cryptopt-fiat/fiat-c/gcc/secp256k1_montgomery/mul/libfiat_secp256k1_montgomery_mul_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_SECP256K1_MONTGOMERY_BASELINE_NAME=fiat_secp256k1_montgomery_mul_gcc",
            mul_wrapper,
            "-o",
            gcc_mul_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_mul_asm,
            "-o",
            gcc_mul_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_mul_lib, gcc_mul_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for mul
    let clang_mul_asm =
        "src/cryptopt-fiat/fiat-c/clang/secp256k1_montgomery/mul/fiat_secp256k1_montgomery_mul_clang.asm";
    let clang_mul_obj =
        "src/cryptopt-fiat/fiat-c/clang/secp256k1_montgomery/mul/fiat_secp256k1_montgomery_mul_clang.o";
    let clang_mul_lib =
        "src/cryptopt-fiat/fiat-c/clang/secp256k1_montgomery/mul/libfiat_secp256k1_montgomery_mul_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_SECP256K1_MONTGOMERY_BASELINE_NAME=fiat_secp256k1_montgomery_mul_clang",
            mul_wrapper,
            "-o",
            clang_mul_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_mul_asm,
            "-o",
            clang_mul_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_mul_lib, clang_mul_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for mul
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_secp256k1_montgomery_mul/seed0000000763169037_ratio18998.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_secp256k1_montgomery_mul/seed0000000763169037_ratio18998.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_secp256k1_montgomery_mul/libfiat_secp256k1_montgomery_mul_ratio18998.a",
        "fiat_secp256k1_montgomery_mul",
        true,
        "secp256k1_montgomery",
        "mul",
        4,
        "0xffffffffffffffff"
    );

    // GCC baseline for square
    let gcc_square_asm =
        "src/cryptopt-fiat/fiat-c/gcc/secp256k1_montgomery/square/fiat_secp256k1_montgomery_square_gcc.asm";
    let gcc_square_obj =
        "src/cryptopt-fiat/fiat-c/gcc/secp256k1_montgomery/square/fiat_secp256k1_montgomery_square_gcc.o";
    let gcc_square_lib =
        "src/cryptopt-fiat/fiat-c/gcc/secp256k1_montgomery/square/libfiat_secp256k1_montgomery_square_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_SECP256K1_MONTGOMERY_SQUARE_BASELINE_NAME=fiat_secp256k1_montgomery_square_gcc",
            square_wrapper,
            "-o",
            gcc_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_square_asm,
            "-o",
            gcc_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_square_lib, gcc_square_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for square
    let clang_square_asm =
        "src/cryptopt-fiat/fiat-c/clang/secp256k1_montgomery/square/fiat_secp256k1_montgomery_square_clang.asm";
    let clang_square_obj =
        "src/cryptopt-fiat/fiat-c/clang/secp256k1_montgomery/square/fiat_secp256k1_montgomery_square_clang.o";
    let clang_square_lib =
        "src/cryptopt-fiat/fiat-c/clang/secp256k1_montgomery/square/libfiat_secp256k1_montgomery_square_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_SECP256K1_MONTGOMERY_SQUARE_BASELINE_NAME=fiat_secp256k1_montgomery_square_clang",
            square_wrapper,
            "-o",
            clang_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_square_asm,
            "-o",
            clang_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_square_lib, clang_square_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for square
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_secp256k1_montgomery_square/seed0000000517225990_ratio17679.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_secp256k1_montgomery_square/seed0000000517225990_ratio17679.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_secp256k1_montgomery_square/libfiat_secp256k1_montgomery_square_ratio17679.a",
        "fiat_secp256k1_montgomery_square",
        true,
        "secp256k1_montgomery",
        "square",
        4,
        "0xffffffffffffffff"
    );
}

fn build_cryptopt_fiat_p521() {
    let gcc_mul_dir = "src/cryptopt-fiat/fiat-c/gcc/p521/mul";
    let clang_mul_dir = "src/cryptopt-fiat/fiat-c/clang/p521/mul";
    let gcc_square_dir = "src/cryptopt-fiat/fiat-c/gcc/p521/square";
    let clang_square_dir = "src/cryptopt-fiat/fiat-c/clang/p521/square";
    fs::create_dir_all(gcc_mul_dir).unwrap();
    fs::create_dir_all(clang_mul_dir).unwrap();
    fs::create_dir_all(gcc_square_dir).unwrap();
    fs::create_dir_all(clang_square_dir).unwrap();

    let mul_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/p521_mul_wrapper.c";
    let square_wrapper = "src/cryptopt-fiat/fiat-c/wrappers/p521_square_wrapper.c";

    // GCC baseline for mul
    let gcc_mul_asm = "src/cryptopt-fiat/fiat-c/gcc/p521/mul/fiat_p521_carry_mul_gcc.asm";
    let gcc_mul_obj = "src/cryptopt-fiat/fiat-c/gcc/p521/mul/fiat_p521_carry_mul_gcc.o";
    let gcc_mul_lib = "src/cryptopt-fiat/fiat-c/gcc/p521/mul/libfiat_p521_carry_mul_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P521_BASELINE_NAME=fiat_p521_carry_mul_gcc",
            mul_wrapper,
            "-o",
            gcc_mul_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_mul_asm,
            "-o",
            gcc_mul_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_mul_lib, gcc_mul_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for mul
    let clang_mul_asm = "src/cryptopt-fiat/fiat-c/clang/p521/mul/fiat_p521_carry_mul_clang.asm";
    let clang_mul_obj = "src/cryptopt-fiat/fiat-c/clang/p521/mul/fiat_p521_carry_mul_clang.o";
    let clang_mul_lib = "src/cryptopt-fiat/fiat-c/clang/p521/mul/libfiat_p521_carry_mul_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P521_BASELINE_NAME=fiat_p521_carry_mul_clang",
            mul_wrapper,
            "-o",
            clang_mul_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_mul_asm,
            "-o",
            clang_mul_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_mul_lib, clang_mul_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for mul
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p521_carry_mul/seed0000000618562372_ratio13969.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p521_carry_mul/seed0000000618562372_ratio13969.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p521_carry_mul/libfiat_p521_carry_mul_ratio13969.a",
        "fiat_p521_carry_mul",
        true,
        "p521",
        "mul",
        9,
        "0xffffffffffffffff"
    );

    // GCC baseline for square
    let gcc_square_asm = "src/cryptopt-fiat/fiat-c/gcc/p521/square/fiat_p521_carry_square_gcc.asm";
    let gcc_square_obj = "src/cryptopt-fiat/fiat-c/gcc/p521/square/fiat_p521_carry_square_gcc.o";
    let gcc_square_lib = "src/cryptopt-fiat/fiat-c/gcc/p521/square/libfiat_p521_carry_square_gcc.a";
    assert!(Command::new("gcc")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P521_SQUARE_BASELINE_NAME=fiat_p521_carry_square_gcc",
            square_wrapper,
            "-o",
            gcc_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("gcc")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            gcc_square_asm,
            "-o",
            gcc_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", gcc_square_lib, gcc_square_obj])
        .status()
        .unwrap()
        .success());

    // Clang baseline for square
    let clang_square_asm =
        "src/cryptopt-fiat/fiat-c/clang/p521/square/fiat_p521_carry_square_clang.asm";
    let clang_square_obj =
        "src/cryptopt-fiat/fiat-c/clang/p521/square/fiat_p521_carry_square_clang.o";
    let clang_square_lib =
        "src/cryptopt-fiat/fiat-c/clang/p521/square/libfiat_p521_carry_square_clang.a";
    assert!(Command::new("clang")
        .args(&[
            "-O3",
            "-march=native",
            "-mtune=native",
            "-S",
            "-masm=intel",
            "-DFIAT_P521_SQUARE_BASELINE_NAME=fiat_p521_carry_square_clang",
            square_wrapper,
            "-o",
            clang_square_asm,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "-x",
            "assembler-with-cpp",
            clang_square_asm,
            "-o",
            clang_square_obj,
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&["rcs", clang_square_lib, clang_square_obj])
        .status()
        .unwrap()
        .success());

    // Highest-ratio CryptOpt-generated assembly for square
    build_and_validate_with_formal!(
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p521_carry_square/seed0000000882458724_ratio15398.asm",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p521_carry_square/seed0000000882458724_ratio15398.o",
        "src/cryptopt-fiat/generated/fiat-amd64/fiat_p521_carry_square/libfiat_p521_carry_square_ratio15398.a",
        "fiat_p521_carry_square",
        true,
        "p521",
        "square",
        9,
        "0xffffffffffffffff"
    );
}

fn build_fiat_c_secp256k1_dettman() {
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/fiat-secp256k1_dettman/llc/mul/fiat_c_secp256k1_dettman_mul_vec.asm",
            "-o",
            "src/c/fiat-secp256k1_dettman/llc/mul/fiat_c_secp256k1_dettman_mul_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-secp256k1_dettman/llc/mul/libfiat_c_secp256k1_dettman_mul_vec.a",
            "src/c/fiat-secp256k1_dettman/llc/mul/fiat_c_secp256k1_dettman_mul_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/c/fiat-secp256k1_dettman/llc-nasm/mul/fiat_c_secp256k1_dettman_mul_vec_nasm.asm",
            "-o",
            "src/c/fiat-secp256k1_dettman/llc-nasm/mul/fiat_c_secp256k1_dettman_mul_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-secp256k1_dettman/llc-nasm/mul/libfiat_c_secp256k1_dettman_mul_vec_nasm.a",
            "src/c/fiat-secp256k1_dettman/llc-nasm/mul/fiat_c_secp256k1_dettman_mul_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/c/fiat-secp256k1_dettman/cryptopt/mul/seed0001746590060287_ratio10115.asm",
        "src/c/fiat-secp256k1_dettman/cryptopt/mul/seed0001746590060287_ratio10115.o",
        "src/c/fiat-secp256k1_dettman/cryptopt/mul/libfiat_c_secp256k1_dettman_mul_CryptOpt.a",
        "fiat_c_secp256k1_dettman_mul_CryptOpt",
        true, // NASM
        "secp256k1_dettman",
        "mul",
        5,              // field size
        "0x1000003d10"  // loose bound
    );

    // ---------- SQUARE ----------
    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/fiat-secp256k1_dettman/llc/square/fiat_c_secp256k1_dettman_square_vec.asm",
            "-o",
            "src/c/fiat-secp256k1_dettman/llc/square/fiat_c_secp256k1_dettman_square_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-secp256k1_dettman/llc/square/libfiat_c_secp256k1_dettman_square_vec.a",
            "src/c/fiat-secp256k1_dettman/llc/square/fiat_c_secp256k1_dettman_square_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/fiat-secp256k1_dettman/llc-nasm/square/fiat_c_secp256k1_dettman_square_vec_nasm.asm",
            "-o",
            "src/c/fiat-secp256k1_dettman/llc-nasm/square/fiat_c_secp256k1_dettman_square_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-secp256k1_dettman/llc-nasm/square/libfiat_c_secp256k1_dettman_square_vec_nasm.a",
            "src/c/fiat-secp256k1_dettman/llc-nasm/square/fiat_c_secp256k1_dettman_square_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/c/fiat-secp256k1_dettman/cryptopt/square/seed0001746606684641_ratio09956.asm",
        "src/c/fiat-secp256k1_dettman/cryptopt/square/seed0001746606684641_ratio09956.o",
        "src/c/fiat-secp256k1_dettman/cryptopt/square/libfiat_c_secp256k1_dettman_square_CryptOpt.a",
        "fiat_c_secp256k1_dettman_square_CryptOpt",
        true,   // NASM
        "secp256k1_dettman",
        "square",
        5,      // field size
        "0x1000003d10"  // loose bound
    );
}

fn build_fiat_c_poly1305() {
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/fiat-poly1305/llc/mul/fiat_c_poly1305_carry_mul_vec.asm",
            "-o",
            "src/c/fiat-poly1305/llc/mul/fiat_c_poly1305_carry_mul_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-poly1305/llc/mul/libfiat_c_poly1305_carry_mul_vec.a",
            "src/c/fiat-poly1305/llc/mul/fiat_c_poly1305_carry_mul_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/c/fiat-poly1305/llc-nasm/mul/fiat_c_poly1305_carry_mul_vec_nasm.asm",
            "-o",
            "src/c/fiat-poly1305/llc-nasm/mul/fiat_c_poly1305_carry_mul_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-poly1305/llc-nasm/mul/libfiat_c_poly1305_carry_mul_vec_nasm.a",
            "src/c/fiat-poly1305/llc-nasm/mul/fiat_c_poly1305_carry_mul_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/c/fiat-poly1305/cryptopt/mul/seed0001746580132789_ratio11021.asm",
        "src/c/fiat-poly1305/cryptopt/mul/seed0001746580132789_ratio11021.o",
        "src/c/fiat-poly1305/cryptopt/mul/libfiat_c_poly1305_carry_mul_CryptOpt.a",
        "fiat_c_poly1305_carry_mul_CryptOpt",
        true, // NASM
        "poly1305",
        "mul",
        3,             // field size
        "0x300000000"  // loose bound
    );

    // ---------- SQUARE ----------
    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/fiat-poly1305/llc/square/fiat_c_poly1305_carry_square_vec.asm",
            "-o",
            "src/c/fiat-poly1305/llc/square/fiat_c_poly1305_carry_square_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-poly1305/llc/square/libfiat_c_poly1305_carry_square_vec.a",
            "src/c/fiat-poly1305/llc/square/fiat_c_poly1305_carry_square_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/c/fiat-poly1305/llc-nasm/square/fiat_c_poly1305_carry_square_vec_nasm.asm",
            "-o",
            "src/c/fiat-poly1305/llc-nasm/square/fiat_c_poly1305_carry_square_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-poly1305/llc-nasm/square/libfiat_c_poly1305_carry_square_vec_nasm.a",
            "src/c/fiat-poly1305/llc-nasm/square/fiat_c_poly1305_carry_square_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/c/fiat-poly1305/cryptopt/square/seed0001746589560845_ratio11265.asm",
        "src/c/fiat-poly1305/cryptopt/square/seed0001746589560845_ratio11265.o",
        "src/c/fiat-poly1305/cryptopt/square/libfiat_c_poly1305_carry_square_CryptOpt.a",
        "fiat_c_poly1305_carry_square_CryptOpt",
        true, // NASM
        "poly1305",
        "square",
        3,             // field size
        "0x300000000"  // loose bound
    );
}

fn build_fiat_c_p448() {
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/fiat-p448/llc/mul/fiat_c_p448_solinas_carry_mul_vec.asm",
            "-o",
            "src/c/fiat-p448/llc/mul/fiat_c_p448_solinas_carry_mul_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-p448/llc/mul/libfiat_c_p448_solinas_carry_mul_vec.a",
            "src/c/fiat-p448/llc/mul/fiat_c_p448_solinas_carry_mul_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/c/fiat-p448/llc-nasm/mul/fiat_c_p448_solinas_carry_mul_vec_nasm.asm",
            "-o",
            "src/c/fiat-p448/llc-nasm/mul/fiat_c_p448_solinas_carry_mul_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-p448/llc-nasm/mul/libfiat_c_p448_solinas_carry_mul_vec_nasm.a",
            "src/c/fiat-p448/llc-nasm/mul/fiat_c_p448_solinas_carry_mul_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul)
    build_and_validate_with_formal!(
        "src/c/fiat-p448/cryptopt/mul/seed0001746593034063_ratio09458.asm",
        "src/c/fiat-p448/cryptopt/mul/seed0001746593034063_ratio09458.o",
        "src/c/fiat-p448/cryptopt/mul/libfiat_c_p448_carry_mul_CryptOpt.a",
        "fiat_c_p448_carry_mul_CryptOpt",
        true, // NASM
        "p448",
        "mul",
        8,                   // field size
        "0x300000000000000"  // loose bound
    );

    // Square
    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/fiat-p448/llc/square/fiat_c_p448_solinas_carry_square_vec.asm",
            "-o",
            "src/c/fiat-p448/llc/square/fiat_c_p448_solinas_carry_square_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-p448/llc/square/libfiat_c_p448_solinas_carry_square_vec.a",
            "src/c/fiat-p448/llc/square/fiat_c_p448_solinas_carry_square_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/c/fiat-p448/llc-nasm/square/fiat_c_p448_solinas_carry_square_vec_nasm.asm",
            "-o",
            "src/c/fiat-p448/llc-nasm/square/fiat_c_p448_solinas_carry_square_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-p448/llc-nasm/square/libfiat_c_p448_solinas_carry_square_vec_nasm.a",
            "src/c/fiat-p448/llc-nasm/square/fiat_c_p448_solinas_carry_square_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // // CryptOpt version (square)
    build_and_validate_with_formal!(
        "src/c/fiat-p448/cryptopt/square/seed0001745398667315_ratio10358.asm",
        "src/c/fiat-p448/cryptopt/square/seed0001745398667315_ratio10358.o",
        "src/c/fiat-p448/cryptopt/square/libfiat_c_p448_solinas_carry_square_CryptOpt.a",
        "fiat_c_p448_solinas_carry_square_CryptOpt",
        true, // NASM
        "p448",
        "square",
        8,                   // field size
        "0x300000000000000"  // loose bound
    );

    // CryptOpt version (square) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/c/fiat-p448/cryptopt/square/seed0001746659360708_ratio10853.asm",
        "src/c/fiat-p448/cryptopt/square/seed0001746659360708_ratio10853.o",
        "src/c/fiat-p448/cryptopt/square/libfiat_c_p448_carry_square_CryptOpt.a",
        "fiat_c_p448_carry_square_CryptOpt",
        true, // NASM
        "p448",
        "square",
        8,                   // field size
        "0x300000000000000"  // loose bound
    );
}

fn build_openssl_p448() {
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/openssl-p448/llc/mul/openssl_p448_mul_ssa_vec.asm",
            "-o",
            "src/c/openssl-p448/llc/mul/openssl_p448_mul_ssa_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-p448/llc/mul/libopenssl_p448_mul_vec.a",
            "src/c/openssl-p448/llc/mul/openssl_p448_mul_ssa_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/c/openssl-p448/llc-nasm/mul/openssl_p448_mul_ssa_vec_nasm.asm",
            "-o",
            "src/c/openssl-p448/llc-nasm/mul/openssl_p448_mul_ssa_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-p448/llc-nasm/mul/libopenssl_p448_mul_vec_nasm.a",
            "src/c/openssl-p448/llc-nasm/mul/openssl_p448_mul_ssa_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/c/openssl-p448/cryptopt/mul/seed0001754016023536_ratio11739.asm",
            "-o",
            "src/c/openssl-p448/cryptopt/mul/seed0001754016023536_ratio11739.o"
        ])
        .status()
        .unwrap()
        .success());

    // Dudect validation for CryptOpt mul
    let dudect_validation_mul = AssemblyValidation {
        asm_file: "src/c/openssl-p448/cryptopt/mul/seed0001754016023536_ratio11739.asm".to_string(),
        function_name: "openssl_p448_mul".to_string(), // Use the actual function name from the assembly
        curve_name: "openssl_p448".to_string(),
        operation: "mul".to_string(),
        field_size: 8,
        loose_bound: "0x300000000000000".to_string(),
    };
    let dudect_config = DudectConfig::default();
    validate_assembly_constant_time(&dudect_validation_mul, &dudect_config);

    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-p448/cryptopt/mul/libopenssl_p448_mul_CryptOpt.a",
            "src/c/openssl-p448/cryptopt/mul/seed0001754016023536_ratio11739.o"
        ])
        .status()
        .unwrap()
        .success());

    // ---------- SQUARE ----------
    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/openssl-p448/llc/square/openssl_p448_square_ssa_vec.asm",
            "-o",
            "src/c/openssl-p448/llc/square/openssl_p448_square_ssa_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-p448/llc/square/libopenssl_p448_square_vec.a",
            "src/c/openssl-p448/llc/square/openssl_p448_square_ssa_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/c/openssl-p448/llc-nasm/square/openssl_p448_square_ssa_vec_nasm.asm",
            "-o",
            "src/c/openssl-p448/llc-nasm/square/openssl_p448_square_ssa_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-p448/llc-nasm/square/libopenssl_p448_square_vec_nasm.a",
            "src/c/openssl-p448/llc-nasm/square/openssl_p448_square_ssa_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/c/openssl-p448/cryptopt/square/seed0001754025746283_ratio11326.asm",
            "-o",
            "src/c/openssl-p448/cryptopt/square/seed0001754025746283_ratio11326.o"
        ])
        .status()
        .unwrap()
        .success());

    // Dudect validation for CryptOpt square
    let dudect_validation_square = AssemblyValidation {
        asm_file: "src/c/openssl-p448/cryptopt/square/seed0001754025746283_ratio11326.asm"
            .to_string(),
        function_name: "openssl_p448_square".to_string(), // Use the actual function name from the assembly
        curve_name: "openssl_p448".to_string(),
        operation: "square".to_string(),
        field_size: 8,
        loose_bound: "0x300000000000000".to_string(),
    };
    let dudect_config = DudectConfig::default();
    validate_assembly_constant_time(&dudect_validation_square, &dudect_config);

    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-p448/cryptopt/square/libopenssl_p448_square_CryptOpt.a",
            "src/c/openssl-p448/cryptopt/square/seed0001754025746283_ratio11326.o"
        ])
        .status()
        .unwrap()
        .success());
}

fn build_openssl_curve25519() {
    // ---------- MUL ----------
    // Hand-optimised mul & square generated from upstream OpenSSL perl
    {
        let perl_script = "src/c/openssl-curve25519/hand-optimised/original_x86_64.pl";
        let xlate_script = "src/c/openssl-curve25519/hand-optimised/x86_64-xlate.pl";
        assert!(
            std::path::Path::new(xlate_script).exists(),
            "Missing {}, fetch it from OpenSSL's crypto/perlasm/",
            xlate_script
        );

        fs::create_dir_all("target").unwrap();
        let generated = "target/openssl_x25519_fe51.asm";
        assert!(Command::new("perl")
            .args(&[perl_script, "gas"])
            .stdout(File::create(generated).unwrap())
            .status()
            .unwrap()
            .success());

        let final_asm = "target/openssl_x25519_with_alias.asm";
        {
            let mut out = File::create(final_asm).unwrap();
            writeln!(out,
                ".globl open_ssl_curve25519_hand_optmised_fe51_mul\n.set open_ssl_curve25519_hand_optmised_fe51_mul,x25519_fe51_mul").unwrap();
            writeln!(out,
                ".globl open_ssl_curve25519_hand_optmised_fe51_square\n.set open_ssl_curve25519_hand_optmised_fe51_square,x25519_fe51_sqr").unwrap();
            out.write_all(&fs::read(generated).unwrap()).unwrap();
        }

        let obj = "target/openssl_x25519_hand_opt.o";
        assert!(Command::new("clang")
            .args(&["-c", final_asm, "-o", obj])
            .status()
            .unwrap()
            .success());

        fs::create_dir_all("src/c/openssl-curve25519/hand-optimised/mul").unwrap();
        fs::create_dir_all("src/c/openssl-curve25519/hand-optimised/square").unwrap();
        assert!(Command::new("ar")
            .args(&["rcs", "src/c/openssl-curve25519/hand-optimised/mul/libopenssl_curve25519_fe51_mul_hand_optimised.a", obj])
            .status().unwrap().success());
        assert!(Command::new("ar")
            .args(&["rcs", "src/c/openssl-curve25519/hand-optimised/square/libopenssl_curve25519_fe51_square_hand_optimised.a", obj])
            .status().unwrap().success());
    }

    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/openssl-curve25519/llc/mul/open_ssl_curve25519_fe51_mul_ssa_vec.asm",
            "-o",
            "src/c/openssl-curve25519/llc/mul/open_ssl_curve25519_fe51_mul_ssa_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-curve25519/llc/mul/libopenssl_curve25519_fe51_mul_vec.a",
            "src/c/openssl-curve25519/llc/mul/open_ssl_curve25519_fe51_mul_ssa_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/c/openssl-curve25519/llc-nasm/mul/open_ssl_curve25519_fe51_mul_ssa_vec_nasm.asm",
            "-o",
            "src/c/openssl-curve25519/llc-nasm/mul/open_ssl_curve25519_fe51_mul_ssa_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-curve25519/llc-nasm/mul/libopenssl_curve25519_fe51_mul_vec_nasm.a",
            "src/c/openssl-curve25519/llc-nasm/mul/open_ssl_curve25519_fe51_mul_ssa_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // Hand-optimised NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f",
            "elf64",
            "src/c/openssl-curve25519/hand-optimised-nasm/mul/hand_optimised_x86_64_mul_nasm.asm",
            "-o",
            "src/c/openssl-curve25519/hand-optimised-nasm/mul/hand_optimised_x86_64_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-curve25519/hand-optimised-nasm/mul/libopenssl_curve25519_fe51_mul_hand_optimised_nasm.a",
            "src/c/openssl-curve25519/hand-optimised-nasm/mul/hand_optimised_x86_64_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul)
    build_and_validate_with_formal!(
        "src/c/openssl-curve25519/cryptopt/mul/seed0001751441780944_ratio11932.asm",
        "src/c/openssl-curve25519/cryptopt/mul/seed0001751441780944_ratio11932.o",
        "src/c/openssl-curve25519/cryptopt/mul/libopenssl_curve25519_fe51_mul_CryptOpt.a",
        "open_ssl_curve25519_fe51_mul_CryptOpt",
        true, // NASM
        "curve25519",
        "mul",
        4,                  // field size
        "0x18000000000000"  // loose bound
    );

    // ---------- SQUARE ----------
    // Hand-optimised square handled in the generated block above.

    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/openssl-curve25519/llc/square/open_ssl_curve25519_fe51_square_ssa_vec.asm",
            "-o",
            "src/c/openssl-curve25519/llc/square/open_ssl_curve25519_fe51_square_ssa_vec.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-curve25519/llc/square/libopenssl_curve25519_fe51_square_vec.a",
            "src/c/openssl-curve25519/llc/square/open_ssl_curve25519_fe51_square_ssa_vec.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/openssl-curve25519/llc-nasm/square/open_ssl_curve25519_fe51_square_ssa_vec_nasm.asm",
            "-o",
            "src/c/openssl-curve25519/llc-nasm/square/open_ssl_curve25519_fe51_square_ssa_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-curve25519/llc-nasm/square/libopenssl_curve25519_fe51_square_vec_nasm.a",
            "src/c/openssl-curve25519/llc-nasm/square/open_ssl_curve25519_fe51_square_ssa_vec_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // Hand-optimised NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/openssl-curve25519/hand-optimised-nasm/square/hand_optimised_x86_64_square_nasm.asm",
            "-o",
            "src/c/openssl-curve25519/hand-optimised-nasm/square/hand_optimised_x86_64_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-curve25519/hand-optimised-nasm/square/libopenssl_curve25519_fe51_square_hand_optimised_nasm.a",
            "src/c/openssl-curve25519/hand-optimised-nasm/square/hand_optimised_x86_64_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/c/openssl-curve25519/cryptopt/square/seed0001751442665031_ratio11816.asm",
        "src/c/openssl-curve25519/cryptopt/square/seed0001751442665031_ratio11816.o",
        "src/c/openssl-curve25519/cryptopt/square/libopenssl_curve25519_fe51_square_CryptOpt.a",
        "open_ssl_curve25519_fe51_square_CryptOpt",
        true, // NASM
        "curve25519",
        "square",
        4,                  // field size
        "0x18000000000000"  // loose bound
    );
}

fn main() {
    // Tell Cargo about our custom cfg flag to suppress warnings
    println!("cargo:rustc-check-cfg=cfg(dynamic_only)");
    
    // Print validation header if enabled
    print_validation_header();

    let dynamic_specs = dynamic_target_specs();
    let baseline_requested = std::env::var_os("CARGO_BASELINE_C").is_some();

    let dynamic_feature = std::env::var_os("CARGO_FEATURE_DYNAMIC_API").is_some();
    
    // Check if user wants to skip legacy .a builds (for faster dynamic-only builds)
    // Set SKIP_LEGACY_BUILD=1 to skip all legacy .a compilation
    let skip_legacy = std::env::var("SKIP_LEGACY_BUILD")
        .ok()
        .as_deref() == Some("1");
    
    println!("cargo:rerun-if-env-changed=SKIP_LEGACY_BUILD");

    // Mode 1: Build-time dynamic compilation (with specific targets via CARGO_DYNAMIC_TARGETS)
    if dynamic_feature && (!dynamic_specs.is_empty() || baseline_requested) {
        if let Err(err) = run_dynamic_mode(&dynamic_specs) {
            panic!("Dynamic build failed: {err}");
        }
        return;
    }

    // Mode 2: Runtime dynamic-only (skip all legacy .a builds for fast iteration)
    if dynamic_feature && skip_legacy {
        println!("cargo:warning=╔════════════════════════════════════════════════════════════════╗");
        println!("cargo:warning=║ SKIP_LEGACY_BUILD=1: Fast dynamic-only build mode             ║");
        println!("cargo:warning=║ - Skipping all legacy .a static library builds                ║");
        println!("cargo:warning=║ - Only runtime dynamic compilation available                   ║");
        println!("cargo:warning=║ - Build time: ~30 seconds (vs ~5 minutes for full build)      ║");
        println!("cargo:warning=╚════════════════════════════════════════════════════════════════╝");
        println!("cargo:warning=");
        println!("cargo:warning=Usage: cargo run --features dynamic-api -- --dynamic <candidate> <baseline>");
        println!("cargo:warning=");
        
        // Set a cfg flag to disable legacy code paths in main.rs
        println!("cargo:rustc-cfg=dynamic_only");
        
        // Ensure the dynamic wrapper file exists
        if let Err(err) = emit_wrapper_file(&[]) {
            panic!("Failed to generate empty dynamic wrapper file: {err}");
        }
        
        return;  // Skip all legacy builds
    }

    // Mode 3: Legacy or Hybrid build (build all .a files)
    if dynamic_feature {
        println!("cargo:warning=Building HYBRID mode: legacy (.a) + dynamic-api support");
        println!("cargo:warning=Tip: Set SKIP_LEGACY_BUILD=1 to skip .a builds (faster)");
        
        // Ensure the dynamic wrapper file exists
        if let Err(err) = emit_wrapper_file(&[]) {
            panic!("Failed to generate empty dynamic wrapper file: {err}");
        }
    }

    // Build all curves (both mul and square, if available)
    build_curve25519();
    build_p448();
    build_poly1305();
    build_bls12();
    build_secp256k1_dettman();
    build_curve25519_dalek();
    build_rust_ec_secp256k1();
    build_fiat_c_curve25519();
    build_cryptopt_fiat_curve25519_generated();
    build_cryptopt_fiat_curve25519_solinas();
    build_cryptopt_fiat_p224();
    build_cryptopt_fiat_p256();
    build_cryptopt_fiat_p384();
    build_cryptopt_fiat_p434();
    build_cryptopt_fiat_p448_solinas();
    build_cryptopt_fiat_poly1305();
    build_cryptopt_fiat_secp256k1_dettman();
    build_cryptopt_fiat_secp256k1_montgomery();
    build_cryptopt_fiat_p521();
    build_fiat_c_secp256k1_dettman();
    build_fiat_c_poly1305();
    build_fiat_c_p448();
    build_openssl_curve25519();
    build_openssl_p448();
    // -------------------------------------------------------------------------
    // Add link-search paths for all curves and both operations

    // Curve25519
    println!("cargo:rustc-link-search=native=src/rust/curve25519/llc/mul");
    println!("cargo:rustc-link-search=native=src/rust/curve25519/llc/square");
    println!("cargo:rustc-link-search=native=src/rust/curve25519/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/rust/curve25519/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/rust/curve25519/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/rust/curve25519/cryptopt/square");

    // Curve25519-dalek
    println!("cargo:rustc-link-search=native=src/rust/curve25519-dalek/llc/mul");
    println!("cargo:rustc-link-search=native=src/rust/curve25519-dalek/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/rust/curve25519-dalek/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/rust/curve25519-dalek/llc/square");
    println!("cargo:rustc-link-search=native=src/rust/curve25519-dalek/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/rust/curve25519-dalek/cryptopt/square");

    // P448
    println!("cargo:rustc-link-search=native=src/rust/p448/llc/mul");
    println!("cargo:rustc-link-search=native=src/rust/p448/llc/square");
    println!("cargo:rustc-link-search=native=src/rust/p448/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/rust/p448/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/rust/p448/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/rust/p448/cryptopt/square");

    // Poly1305
    println!("cargo:rustc-link-search=native=src/rust/poly1305/llc/mul");
    println!("cargo:rustc-link-search=native=src/rust/poly1305/llc/square");
    println!("cargo:rustc-link-search=native=src/rust/poly1305/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/rust/poly1305/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/rust/poly1305/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/rust/poly1305/cryptopt/square");

    // BLS12
    println!("cargo:rustc-link-search=native=src/rust/bls12/llc/mul");
    println!("cargo:rustc-link-search=native=src/rust/bls12/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/rust/bls12/cryptopt/mul");

    // Secp256k1 Dettman
    println!("cargo:rustc-link-search=native=src/rust/secp256k1_dettman/llc/mul");
    println!("cargo:rustc-link-search=native=src/rust/secp256k1_dettman/llc/square");
    println!("cargo:rustc-link-search=native=src/rust/secp256k1_dettman/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/rust/secp256k1_dettman/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/rust/secp256k1_dettman/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/rust/secp256k1_dettman/cryptopt/square");

    // Rust EC Secp256k1
    println!("cargo:rustc-link-search=native=src/rust/rust_ec_secp256k1/llc/mul");
    println!("cargo:rustc-link-search=native=src/rust/rust_ec_secp256k1/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/rust/rust_ec_secp256k1/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/rust/rust_ec_secp256k1/llc/square");
    println!("cargo:rustc-link-search=native=src/rust/rust_ec_secp256k1/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/rust/rust_ec_secp256k1/cryptopt/square");

    // Fiat C Curve25519
    println!("cargo:rustc-link-search=native=src/c/fiat-curve25519/llc/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-curve25519/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-curve25519/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-curve25519/llc/square");
    println!("cargo:rustc-link-search=native=src/c/fiat-curve25519/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/c/fiat-curve25519/cryptopt/square");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/curve25519/mul");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/curve25519/mul");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_curve25519_carry_mul");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/curve25519/square");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/curve25519/square");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_curve25519_carry_square");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/enhanced/fiat_curve25519_carry_mul");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/curve25519_solinas/mul");
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/curve25519_solinas/mul"
    );
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_curve25519_solinas_mul");
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/curve25519_solinas/square"
    );
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/curve25519_solinas/square"
    );
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_curve25519_solinas_square");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/p224/mul");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/p224/mul");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_p224_mul");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/p224/square");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/p224/square");
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_p224_square"
    );
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/p256/mul");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/p256/mul");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_p256_mul");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/p256/square");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/p256/square");
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_p256_square"
    );
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/p384/mul");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/p384/mul");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_p384_mul");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/p384/square");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/p384/square");
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_p384_square"
    );
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/p434/mul");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/p434/mul");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_p434_mul");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/p434/square");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/p434/square");
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_p434_square"
    );
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/p448_solinas/mul");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/p448_solinas/mul");
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_p448_solinas_carry_mul"
    );
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/p448_solinas/square");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/p448_solinas/square");
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_p448_solinas_carry_square"
    );
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/poly1305/mul");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/poly1305/mul");
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_poly1305_carry_mul"
    );
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/poly1305/square");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/poly1305/square");
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_poly1305_carry_square"
    );
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/secp256k1_dettman/mul");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/secp256k1_dettman/mul");
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_secp256k1_dettman_mul"
    );
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/secp256k1_dettman/square"
    );
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/secp256k1_dettman/square"
    );
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_secp256k1_dettman_square"
    );
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/secp256k1_montgomery/mul"
    );
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/secp256k1_montgomery/mul"
    );
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_secp256k1_montgomery_mul"
    );
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/secp256k1_montgomery/square"
    );
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/secp256k1_montgomery/square"
    );
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_secp256k1_montgomery_square"
    );
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/p521/mul");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/p521/mul");
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_p521_carry_mul"
    );
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/gcc/p521/square");
    println!("cargo:rustc-link-search=native=src/cryptopt-fiat/fiat-c/clang/p521/square");
    println!(
        "cargo:rustc-link-search=native=src/cryptopt-fiat/generated/fiat-amd64/fiat_p521_carry_square"
    );

    // Fiat C Secp256k1 Dettman
    println!("cargo:rustc-link-search=native=src/c/fiat-secp256k1_dettman/llc/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-secp256k1_dettman/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-secp256k1_dettman/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-secp256k1_dettman/llc/square");
    println!("cargo:rustc-link-search=native=src/c/fiat-secp256k1_dettman/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/c/fiat-secp256k1_dettman/cryptopt/square");

    // Fiat C Poly1305
    println!("cargo:rustc-link-search=native=src/c/fiat-poly1305/llc/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-poly1305/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-poly1305/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-poly1305/llc/square");
    println!("cargo:rustc-link-search=native=src/c/fiat-poly1305/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/c/fiat-poly1305/cryptopt/square");

    // Fiat C P448
    println!("cargo:rustc-link-search=native=src/c/fiat-p448/llc/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-p448/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-p448/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-p448/llc/square");
    println!("cargo:rustc-link-search=native=src/c/fiat-p448/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/c/fiat-p448/cryptopt/square");

    // OpenSSL Curve25519
    println!("cargo:rustc-link-search=native=src/c/openssl-curve25519/llc/mul");
    println!("cargo:rustc-link-search=native=src/c/openssl-curve25519/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/c/openssl-curve25519/hand-optimised/mul");
    println!("cargo:rustc-link-search=native=src/c/openssl-curve25519/hand-optimised-nasm/mul");
    println!("cargo:rustc-link-search=native=src/c/openssl-curve25519/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/c/openssl-curve25519/llc/square");
    println!("cargo:rustc-link-search=native=src/c/openssl-curve25519/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/c/openssl-curve25519/hand-optimised/square");
    println!("cargo:rustc-link-search=native=src/c/openssl-curve25519/hand-optimised-nasm/square");
    println!("cargo:rustc-link-search=native=src/c/openssl-curve25519/cryptopt/square");

    // OpenSSL P256 hand-optimised
    println!("cargo:rustc-link-search=native=src/c/openssl-p256/hand-optimised");

    // OpenSSL P448
    println!("cargo:rustc-link-search=native=src/c/openssl-p448/llc/mul");
    println!("cargo:rustc-link-search=native=src/c/openssl-p448/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/c/openssl-p448/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/c/openssl-p448/llc/square");
    println!("cargo:rustc-link-search=native=src/c/openssl-p448/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/c/openssl-p448/cryptopt/square");

    // -------------------------------------------------------------------------
    // Link libraries for mul and square versions

    // Curve25519 (mul)
    println!("cargo:rustc-link-lib=static=rust_fiat_curve25519_carry_mul_vec");
    println!("cargo:rustc-link-lib=static=rust_fiat_curve25519_carry_mul_vec_nasm");
    println!("cargo:rustc-link-lib=static=rust_fiat_curve25519_carry_mul_CryptOpt"); // Curve25519 (square)
    println!("cargo:rustc-link-lib=static=rust_fiat_curve25519_carry_square_vec");
    println!("cargo:rustc-link-lib=static=rust_fiat_curve25519_carry_square_vec_nasm");
    println!("cargo:rustc-link-lib=static=rust_fiat_curve25519_carry_square_CryptOpt");
    // Curve25519-dalek (mul)
    println!("cargo:rustc-link-lib=static=curve25519_dalek_mul_vec");
    println!("cargo:rustc-link-lib=static=curve25519_dalek_mul_vec_nasm");
    println!("cargo:rustc-link-lib=static=curve25519_dalek_mul_CryptOpt"); // Curve25519-dalek (square)
    println!("cargo:rustc-link-lib=static=curve25519_dalek_square_vec");
    println!("cargo:rustc-link-lib=static=curve25519_dalek_square_vec_nasm");
    println!("cargo:rustc-link-lib=static=curve25519_dalek_square_CryptOpt");
    // P448 (mul)
    println!("cargo:rustc-link-lib=static=rust_fiat_p448_solinas_carry_mul_vec");
    println!("cargo:rustc-link-lib=static=rust_fiat_p448_solinas_carry_mul_vec_nasm");
    println!("cargo:rustc-link-lib=static=rust_fiat_p448_solinas_carry_mul_CryptOpt"); // P448 (square)
    println!("cargo:rustc-link-lib=static=rust_fiat_p448_solinas_carry_square_vec");
    println!("cargo:rustc-link-lib=static=rust_fiat_p448_solinas_carry_square_vec_nasm");
    println!("cargo:rustc-link-lib=static=rust_fiat_p448_solinas_carry_square_CryptOpt");
    // Poly1305 (mul)
    println!("cargo:rustc-link-lib=static=rust_fiat_poly1305_carry_mul_vec");
    println!("cargo:rustc-link-lib=static=rust_fiat_poly1305_carry_mul_vec_nasm");
    println!("cargo:rustc-link-lib=static=rust_fiat_poly1305_carry_mul_CryptOpt"); // Poly1305 (square)
    println!("cargo:rustc-link-lib=static=rust_fiat_poly1305_carry_square_vec");
    println!("cargo:rustc-link-lib=static=rust_fiat_poly1305_carry_square_vec_nasm");
    println!("cargo:rustc-link-lib=static=rust_fiat_poly1305_carry_square_CryptOpt");
    // BLS12 (mul)
    println!("cargo:rustc-link-lib=static=bls12_mul_vec");
    println!("cargo:rustc-link-lib=static=bls12_mul_vec_nasm");
    println!("cargo:rustc-link-lib=static=bls12_mul_CryptOpt");
    // Secp256k1 Dettman (mul)
    println!("cargo:rustc-link-lib=static=rust_fiat_secp256k1_dettman_mul_vec");
    println!("cargo:rustc-link-lib=static=rust_fiat_secp256k1_dettman_mul_vec_nasm");
    println!("cargo:rustc-link-lib=static=rust_fiat_secp256k1_dettman_mul_CryptOpt");
    // Secp256k1 Dettman (square)
    println!("cargo:rustc-link-lib=static=rust_fiat_secp256k1_dettman_square_vec");
    println!("cargo:rustc-link-lib=static=rust_fiat_secp256k1_dettman_square_vec_nasm");
    println!("cargo:rustc-link-lib=static=rust_fiat_secp256k1_dettman_square_CryptOpt");
    // Rust EC Secp256k1 (mul)
    println!("cargo:rustc-link-lib=static=rust_ec_secp256k1_mul_inner_vec");
    println!("cargo:rustc-link-lib=static=rust_ec_secp256k1_mul_inner_vec_nasm");
    println!("cargo:rustc-link-lib=static=rust_ec_secp256k1_mul_inner_CryptOpt");
    // Rust EC Secp256k1 (square)
    println!("cargo:rustc-link-lib=static=rust_ec_secp256k1_square_vec");
    println!("cargo:rustc-link-lib=static=rust_ec_secp256k1_square_vec_nasm");
    println!("cargo:rustc-link-lib=static=rust_ec_secp256k1_square_CryptOpt");
    // Fiat C Curve25519 (mul)
    println!("cargo:rustc-link-lib=static=fiat_c_curve25519_carry_mul_vec");
    println!("cargo:rustc-link-lib=static=fiat_c_curve25519_carry_mul_vec_nasm");
    println!("cargo:rustc-link-lib=static=fiat_c_curve25519_carry_mul_CryptOpt");
    println!("cargo:rustc-link-lib=static=fiat_curve25519_carry_mul_gcc");
    println!("cargo:rustc-link-lib=static=fiat_curve25519_carry_mul_clang");
    println!("cargo:rustc-link-lib=static=fiat_curve25519_carry_mul_enhanced");
    println!("cargo:rustc-link-lib=static=fiat_curve25519_carry_mul_ratio12750");
    // Fiat C Curve25519 (square)
    println!("cargo:rustc-link-lib=static=fiat_curve25519_carry_square_gcc");
    println!("cargo:rustc-link-lib=static=fiat_curve25519_carry_square_clang");
    println!("cargo:rustc-link-lib=static=fiat_curve25519_carry_square_ratio12993");
    // CryptOpt Fiat Curve25519 Solinas
    println!("cargo:rustc-link-lib=static=fiat_curve25519_solinas_mul_gcc");
    println!("cargo:rustc-link-lib=static=fiat_curve25519_solinas_mul_clang");
    println!("cargo:rustc-link-lib=static=fiat_curve25519_solinas_mul_ratio18494");
    println!("cargo:rustc-link-lib=static=fiat_curve25519_solinas_square_gcc");
    println!("cargo:rustc-link-lib=static=fiat_curve25519_solinas_square_clang");
    println!("cargo:rustc-link-lib=static=fiat_curve25519_solinas_square_ratio15409");
    // CryptOpt Fiat P224
    println!("cargo:rustc-link-lib=static=fiat_p224_mul_gcc");
    println!("cargo:rustc-link-lib=static=fiat_p224_mul_clang");
    println!("cargo:rustc-link-lib=static=fiat_p224_mul_ratio16447");
    println!("cargo:rustc-link-lib=static=fiat_p224_square_gcc");
    println!("cargo:rustc-link-lib=static=fiat_p224_square_clang");
    println!("cargo:rustc-link-lib=static=fiat_p224_square_ratio14731");
    // CryptOpt Fiat P256
    println!("cargo:rustc-link-lib=static=fiat_p256_mul_gcc");
    println!("cargo:rustc-link-lib=static=fiat_p256_mul_clang");
    println!("cargo:rustc-link-lib=static=fiat_p256_mul_ratio17527");
    println!("cargo:rustc-link-lib=static=fiat_p256_square_gcc");
    println!("cargo:rustc-link-lib=static=fiat_p256_square_clang");
    println!("cargo:rustc-link-lib=static=fiat_p256_square_ratio17019");
    // CryptOpt Fiat P384
    println!("cargo:rustc-link-lib=static=fiat_p384_mul_gcc");
    println!("cargo:rustc-link-lib=static=fiat_p384_mul_clang");
    println!("cargo:rustc-link-lib=static=fiat_p384_mul_ratio17232");
    println!("cargo:rustc-link-lib=static=fiat_p384_square_gcc");
    println!("cargo:rustc-link-lib=static=fiat_p384_square_clang");
    println!("cargo:rustc-link-lib=static=fiat_p384_square_ratio16784");
    // CryptOpt Fiat P434
    println!("cargo:rustc-link-lib=static=fiat_p434_mul_gcc");
    println!("cargo:rustc-link-lib=static=fiat_p434_mul_clang");
    println!("cargo:rustc-link-lib=static=fiat_p434_mul_ratio19146");
    println!("cargo:rustc-link-lib=static=fiat_p434_square_gcc");
    println!("cargo:rustc-link-lib=static=fiat_p434_square_clang");
    println!("cargo:rustc-link-lib=static=fiat_p434_square_ratio18549");
    // CryptOpt Fiat P448 Solinas
    println!("cargo:rustc-link-lib=static=fiat_p448_solinas_carry_mul_gcc");
    println!("cargo:rustc-link-lib=static=fiat_p448_solinas_carry_mul_clang");
    println!("cargo:rustc-link-lib=static=fiat_p448_solinas_carry_mul_ratio13296");
    println!("cargo:rustc-link-lib=static=fiat_p448_solinas_carry_square_gcc");
    println!("cargo:rustc-link-lib=static=fiat_p448_solinas_carry_square_clang");
    println!("cargo:rustc-link-lib=static=fiat_p448_solinas_carry_square_ratio11436");
    // CryptOpt Fiat Poly1305
    println!("cargo:rustc-link-lib=static=fiat_poly1305_carry_mul_gcc");
    println!("cargo:rustc-link-lib=static=fiat_poly1305_carry_mul_clang");
    println!("cargo:rustc-link-lib=static=fiat_poly1305_carry_mul_ratio12222");
    println!("cargo:rustc-link-lib=static=fiat_poly1305_carry_square_gcc");
    println!("cargo:rustc-link-lib=static=fiat_poly1305_carry_square_clang");
    println!("cargo:rustc-link-lib=static=fiat_poly1305_carry_square_ratio12095");
    // CryptOpt Fiat Secp256k1 Dettman
    println!("cargo:rustc-link-lib=static=fiat_secp256k1_dettman_mul_gcc");
    println!("cargo:rustc-link-lib=static=fiat_secp256k1_dettman_mul_clang");
    println!("cargo:rustc-link-lib=static=fiat_secp256k1_dettman_mul_ratio11508");
    println!("cargo:rustc-link-lib=static=fiat_secp256k1_dettman_square_gcc");
    println!("cargo:rustc-link-lib=static=fiat_secp256k1_dettman_square_clang");
    println!("cargo:rustc-link-lib=static=fiat_secp256k1_dettman_square_ratio11258");
    // CryptOpt Fiat Secp256k1 Montgomery
    println!("cargo:rustc-link-lib=static=fiat_secp256k1_montgomery_mul_gcc");
    println!("cargo:rustc-link-lib=static=fiat_secp256k1_montgomery_mul_clang");
    println!("cargo:rustc-link-lib=static=fiat_secp256k1_montgomery_mul_ratio18998");
    println!("cargo:rustc-link-lib=static=fiat_secp256k1_montgomery_square_gcc");
    println!("cargo:rustc-link-lib=static=fiat_secp256k1_montgomery_square_clang");
    println!("cargo:rustc-link-lib=static=fiat_secp256k1_montgomery_square_ratio17679");
    // CryptOpt Fiat P521
    println!("cargo:rustc-link-lib=static=fiat_p521_carry_mul_gcc");
    println!("cargo:rustc-link-lib=static=fiat_p521_carry_mul_clang");
    println!("cargo:rustc-link-lib=static=fiat_p521_carry_mul_ratio13969");
    println!("cargo:rustc-link-lib=static=fiat_p521_carry_square_gcc");
    println!("cargo:rustc-link-lib=static=fiat_p521_carry_square_clang");
    println!("cargo:rustc-link-lib=static=fiat_p521_carry_square_ratio15398");
    // Fiat C Curve25519 (square)
    println!("cargo:rustc-link-lib=static=fiat_c_curve25519_carry_square_vec");
    println!("cargo:rustc-link-lib=static=fiat_c_curve25519_carry_square_vec_nasm");
    println!("cargo:rustc-link-lib=static=fiat_c_curve25519_carry_square_CryptOpt");
    // Fiat C Secp256k1 Dettman (mul)
    println!("cargo:rustc-link-lib=static=fiat_c_secp256k1_dettman_mul_vec");
    println!("cargo:rustc-link-lib=static=fiat_c_secp256k1_dettman_mul_vec_nasm");
    println!("cargo:rustc-link-lib=static=fiat_c_secp256k1_dettman_mul_CryptOpt");
    // Fiat C Secp256k1 Dettman (square)
    println!("cargo:rustc-link-lib=static=fiat_c_secp256k1_dettman_square_vec");
    println!("cargo:rustc-link-lib=static=fiat_c_secp256k1_dettman_square_vec_nasm");
    println!("cargo:rustc-link-lib=static=fiat_c_secp256k1_dettman_square_CryptOpt");
    // Fiat C Poly1305 (mul)
    println!("cargo:rustc-link-lib=static=fiat_c_poly1305_carry_mul_vec");
    println!("cargo:rustc-link-lib=static=fiat_c_poly1305_carry_mul_vec_nasm");
    println!("cargo:rustc-link-lib=static=fiat_c_poly1305_carry_mul_CryptOpt");
    // Fiat C Poly1305 (square)
    println!("cargo:rustc-link-lib=static=fiat_c_poly1305_carry_square_vec");
    println!("cargo:rustc-link-lib=static=fiat_c_poly1305_carry_square_vec_nasm");
    println!("cargo:rustc-link-lib=static=fiat_c_poly1305_carry_square_CryptOpt");
    // Fiat C P448 (mul)
    println!("cargo:rustc-link-lib=static=fiat_c_p448_solinas_carry_mul_vec");
    println!("cargo:rustc-link-lib=static=fiat_c_p448_solinas_carry_mul_vec_nasm");
    println!("cargo:rustc-link-lib=static=fiat_c_p448_carry_mul_CryptOpt");
    // Fiat C P448 (square)
    println!("cargo:rustc-link-lib=static=fiat_c_p448_solinas_carry_square_vec");
    println!("cargo:rustc-link-lib=static=fiat_c_p448_solinas_carry_square_vec_nasm");
    println!("cargo:rustc-link-lib=static=fiat_c_p448_solinas_carry_square_CryptOpt");
    // OpenSSL Curve25519 (mul)
    println!("cargo:rustc-link-lib=static=openssl_curve25519_fe51_mul_vec");
    println!("cargo:rustc-link-lib=static=openssl_curve25519_fe51_mul_vec_nasm");
    println!("cargo:rustc-link-lib=static=openssl_curve25519_fe51_mul_hand_optimised");
    println!("cargo:rustc-link-lib=static=openssl_curve25519_fe51_mul_hand_optimised_nasm");
    println!("cargo:rustc-link-lib=static=openssl_curve25519_fe51_mul_CryptOpt");
    // OpenSSL Curve25519 (square)
    println!("cargo:rustc-link-lib=static=openssl_curve25519_fe51_square_vec");
    println!("cargo:rustc-link-lib=static=openssl_curve25519_fe51_square_vec_nasm");
    println!("cargo:rustc-link-lib=static=openssl_curve25519_fe51_square_hand_optimised");
    println!("cargo:rustc-link-lib=static=openssl_curve25519_fe51_square_hand_optimised_nasm");
    println!("cargo:rustc-link-lib=static=openssl_curve25519_fe51_square_CryptOpt");
    // OpenSSL P256 hand-optimised (mul + square)
    println!("cargo:rustc-link-lib=static=openssl_p256_hand_optimised");
    // OpenSSL P448 (mul)
    println!("cargo:rustc-link-lib=static=openssl_p448_mul_vec");
    println!("cargo:rustc-link-lib=static=openssl_p448_mul_vec_nasm");
    println!("cargo:rustc-link-lib=static=openssl_p448_mul_CryptOpt");
    // OpenSSL P448 (square)
    println!("cargo:rustc-link-lib=static=openssl_p448_square_vec");
    println!("cargo:rustc-link-lib=static=openssl_p448_square_vec_nasm");
    println!("cargo:rustc-link-lib=static=openssl_p448_square_CryptOpt");
    // -------------------------------------------------------------------------
    // Re-run build.rs if any assembly files change
    println!("cargo:rerun-if-changed=src/rust/curve25519");
    println!("cargo:rerun-if-changed=src/rust/curve25519-dalek");
    println!("cargo:rerun-if-changed=src/rust/p448");
    println!("cargo:rerun-if-changed=src/rust/poly1305");
    println!("cargo:rerun-if-changed=src/rust/bls12");
    println!("cargo:rerun-if-changed=src/rust/secp256k1_dettman");
    println!("cargo:rerun-if-changed=src/rust/rust_ec_secp256k1");
    println!("cargo:rerun-if-changed=src/c/fiat-curve25519");
    println!("cargo:rerun-if-changed=src/c/fiat-secp256k1_dettman");
    println!("cargo:rerun-if-changed=src/c/fiat-poly1305");
    println!("cargo:rerun-if-changed=src/c/fiat-p448");
    println!("cargo:rerun-if-changed=src/c/openssl-curve25519");
    println!("cargo:rerun-if-changed=src/c/openssl-p448");
    println!("cargo:rerun-if-changed=src/c/openssl-p256");
    println!("cargo:rerun-if-changed=src/openssl-asm/ecp_nistz256-x86_64.pl");
    println!("cargo:rerun-if-changed=src/openssl-asm/ecp_nistz256_table.c");
    println!("cargo:rerun-if-changed=src/openssl-asm/x86_64-xlate.pl");

    // Run BINSEC verification on all CryptOpt implementations if enabled
    let binsec_config = BinsecConfig::default();
    if binsec_config.enabled {
        if !run_binsec_verification(&binsec_config) {
            // Build failed due to verification errors
            panic!("BINSEC verification failed!");
        }
    }
}
