#[cfg(not(feature = "dynamic-api"))]
fn main() {
    eprintln!("Enable `--features dynamic-api` to run this example.");
}

#[cfg(feature = "dynamic-api")]
use std::env;
#[cfg(feature = "dynamic-api")]
use std::fs;
#[cfg(feature = "dynamic-api")]
use std::path::{Path, PathBuf};

#[cfg(feature = "dynamic-api")]
use anyhow::Context;
#[cfg(feature = "dynamic-api")]
use rust_assembly_measure::{prewarm, DynFunc};

#[cfg(feature = "dynamic-api")]
fn main() -> anyhow::Result<()> {
    let manifest_dir = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
    let spec = parse_target_spec(&manifest_dir)?;

    let profile = env::var("PROFILE").unwrap_or_else(|_| "debug".to_string());
    let so_path = manifest_dir.join(format!("target/{profile}/librust_assembly_measure.so"));
    if !so_path.exists() {
        return Err(anyhow::anyhow!(
            "shared object {} not found; run cargo build --features dynamic-api --lib first",
            so_path.display()
        ));
    }

    println!(
        "Loading symbol '{}' from {}",
        spec.symbol_display,
        so_path.display()
    );

    match spec.signature {
        Signature::Mul => {
            type FnTy = unsafe extern "C" fn(*mut u64, *const u64, *const u64);
            let func = unsafe { DynFunc::<FnTy>::load(&so_path, &spec.symbol_bytes)? };
            let mut out = [0u64; 16];
            let lhs = [1u64; 16];
            let rhs = [2u64; 16];
            unsafe {
                prewarm(func.function(), |f| {
                    f(out.as_mut_ptr(), lhs.as_ptr(), rhs.as_ptr())
                });
                out.fill(0);
                func.function()(out.as_mut_ptr(), lhs.as_ptr(), rhs.as_ptr());
            }
            println!("Result (first limb): {}", out[0]);
        }
        Signature::Square => {
            type FnTy = unsafe extern "C" fn(*mut u64, *const u64);
            let func = unsafe { DynFunc::<FnTy>::load(&so_path, &spec.symbol_bytes)? };
            let mut out = [0u64; 16];
            let input = [3u64; 16];
            unsafe {
                prewarm(func.function(), |f| f(out.as_mut_ptr(), input.as_ptr()));
                out.fill(0);
                func.function()(out.as_mut_ptr(), input.as_ptr());
            }
            println!("Result (first limb): {}", out[0]);
        }
    }

    Ok(())
}

#[cfg(feature = "dynamic-api")]
#[derive(Clone, Copy)]
enum Signature {
    Mul,
    Square,
}

#[cfg(feature = "dynamic-api")]
struct TargetSpec {
    symbol_bytes: Vec<u8>,
    symbol_display: String,
    signature: Signature,
}

#[cfg(feature = "dynamic-api")]
fn parse_target_spec(manifest_dir: &Path) -> anyhow::Result<TargetSpec> {
    let raw_specs = env::var("CARGO_DYNAMIC_TARGETS")
        .context("CARGO_DYNAMIC_TARGETS must be set for this example")?;
    let first = raw_specs
        .split(',')
        .map(|s| s.trim())
        .find(|s| !s.is_empty())
        .context("CARGO_DYNAMIC_TARGETS did not contain any entries")?;

    let mut parts = first.splitn(3, "::");
    let asm_part = parts.next().unwrap();
    let symbol_override = parts.next().filter(|s| !s.is_empty());
    let signature_override = parts.next().filter(|s| !s.is_empty());

    let mut asm_path = PathBuf::from(asm_part);
    if !asm_path.is_absolute() {
        asm_path = manifest_dir.join(asm_path);
    }

    let symbol = if let Some(name) = symbol_override {
        name.to_string()
    } else {
        infer_symbol_from_asm(&asm_path)?
    };

    let signature = if let Some(sig) = signature_override {
        parse_signature(sig)
    } else {
        infer_signature(&asm_path, &symbol)
    }?;

    Ok(TargetSpec {
        symbol_bytes: symbol.as_bytes().to_vec(),
        symbol_display: symbol,
        signature,
    })
}

#[cfg(feature = "dynamic-api")]
fn parse_signature(raw: &str) -> anyhow::Result<Signature> {
    match raw.to_ascii_lowercase().as_str() {
        "mul_u64" | "mul64" | "u64_mul" => Ok(Signature::Mul),
        "square_u64" | "square64" | "u64_square" => Ok(Signature::Square),
        other => Err(anyhow::anyhow!("Unknown signature override '{other}'")),
    }
}

#[cfg(feature = "dynamic-api")]
fn infer_signature(path: &Path, symbol: &str) -> anyhow::Result<Signature> {
    let lowered_path = path.display().to_string().to_ascii_lowercase();
    if lowered_path.contains("/square/") || lowered_path.contains("\\square\\") {
        return Ok(Signature::Square);
    }
    let lowered_symbol = symbol.to_ascii_lowercase();
    if lowered_symbol.contains("square") {
        return Ok(Signature::Square);
    }
    Ok(Signature::Mul)
}

#[cfg(feature = "dynamic-api")]
fn infer_symbol_from_asm(path: &Path) -> anyhow::Result<String> {
    let contents = fs::read_to_string(path)
        .with_context(|| format!("Failed to read assembly file {}", path.display()))?;
    for raw_line in contents.lines() {
        let line = raw_line
            .split(|c| c == '#' || c == ';')
            .next()
            .unwrap_or(raw_line)
            .trim();
        if line.is_empty() {
            continue;
        }
        if let Some(rest) = line.strip_prefix(".globl") {
            return Ok(rest.trim().to_string());
        }
        if let Some(rest) = line.strip_prefix(".global") {
            return Ok(rest.trim().to_string());
        }
        if let Some(rest) = line.strip_prefix("GLOBAL ") {
            return Ok(rest.trim().to_string());
        }
        if let Some(rest) = line.strip_prefix("global ") {
            let mut tokens = rest.split(|c: char| matches!(c, ',' | ':') || c.is_whitespace());
            if let Some(sym) = tokens.next() {
                if !sym.is_empty() {
                    return Ok(sym.to_string());
                }
            }
        }
    }
    Err(anyhow::anyhow!(
        "Unable to infer exported symbol from {}",
        path.display()
    ))
}
