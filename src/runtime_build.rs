#![cfg(feature = "dynamic-api")]

use std::ffi::OsStr;
use std::path::{Path, PathBuf};
use std::process::Command;
use std::{fs, time::SystemTime};

use anyhow::{anyhow, Context, Result};

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum FunctionSignature {
    U64Mul,
    U64Square,
}

pub struct TargetSpec {
    pub path: PathBuf,
    pub symbol: String,
    pub signature: FunctionSignature,
}

pub struct BuildArtifacts {
    pub so_path: PathBuf,
    pub symbol: String,
    pub signature: FunctionSignature,
}

pub fn parse_target_spec(spec: &str, manifest_dir: &Path) -> Result<TargetSpec> {
    let mut parts = spec.splitn(3, "::");
    let path_part = parts
        .next()
        .filter(|s| !s.is_empty())
        .ok_or_else(|| anyhow!("target specification must start with a file path"))?;

    let mut path = PathBuf::from(path_part);
    if !path.is_absolute() {
        path = manifest_dir.join(&path);
    }

    if !path.exists() {
        return Err(anyhow!("target file '{}' does not exist", path.display()));
    }

    let symbol_override = parts
        .next()
        .filter(|s| !s.is_empty())
        .map(|s| s.to_string());
    let signature_override = parts.next().filter(|s| !s.is_empty());

    let symbol = if let Some(sym) = symbol_override {
        sym
    } else {
        infer_symbol_from_source(&path)?
    };

    if symbol.is_empty() {
        return Err(anyhow!(
            "could not infer exported symbol from '{}'",
            path.display()
        ));
    }

    let signature = parse_signature(signature_override, &path, &symbol)?;

    Ok(TargetSpec {
        path,
        symbol: symbol.clone(),
        signature,
    })
}

pub fn build_shared_object(target: &TargetSpec, label: &str) -> Result<BuildArtifacts> {
    let base_out = Path::new("target").join("dynamic-runtime");
    fs::create_dir_all(&base_out).context("failed to create dynamic-runtime directory")?;

    let timestamp = SystemTime::now()
        .duration_since(SystemTime::UNIX_EPOCH)
        .unwrap_or_default()
        .as_millis();
    let out_dir = base_out.join(format!("{}-{}", timestamp, label));
    fs::create_dir_all(&out_dir)
        .with_context(|| format!("failed to create {}", out_dir.display()))?;

    let obj_path = out_dir.join("module.o");
    compile_source(&target.path, &obj_path)?;

    let so_path = out_dir.join("module.so");
    link_shared_object(&obj_path, &so_path)?;

    Ok(BuildArtifacts {
        so_path,
        symbol: target.symbol.clone(),
        signature: target.signature,
    })
}

fn compile_source(src: &Path, obj: &Path) -> Result<()> {
    match src.extension().and_then(OsStr::to_str) {
        Some("c") => compile_c_source(src, obj),
        _ => compile_asm_source(src, obj),
    }
}

fn compile_c_source(src: &Path, obj: &Path) -> Result<()> {
    let status = Command::new("clang")
        .args(&[
            "-c",
            "-fPIC",
            "-O3",
            "-march=native",
            "-fno-semantic-interposition",
            "-std=c11",
            src.to_str().unwrap(),
            "-o",
            obj.to_str().unwrap(),
        ])
        .status()
        .context("failed to invoke clang for C compilation")?;

    if !status.success() {
        return Err(anyhow!(
            "clang failed to compile {} (exit code {:?})",
            src.display(),
            status.code()
        ));
    }
    Ok(())
}

fn compile_asm_source(src: &Path, obj: &Path) -> Result<()> {
    let status = if is_nasm_source(src) {
        Command::new("nasm")
            .args(&[
                "-f",
                "elf64",
                "-DPIC",
                src.to_str().unwrap(),
                "-o",
                obj.to_str().unwrap(),
            ])
            .status()
            .context("failed to invoke nasm")?
    } else {
        Command::new("clang")
            .args(&[
                "-c",
                "-fPIC",
                src.to_str().unwrap(),
                "-o",
                obj.to_str().unwrap(),
            ])
            .status()
            .context("failed to invoke clang for asm compilation")?
    };

    if !status.success() {
        return Err(anyhow!(
            "assembler failed for {} (exit code {:?})",
            src.display(),
            status.code()
        ));
    }
    Ok(())
}

fn link_shared_object(obj: &Path, so: &Path) -> Result<()> {
    let status = Command::new("clang")
        .args(&[
            "-shared",
            obj.to_str().unwrap(),
            "-o",
            so.to_str().unwrap(),
            "-Wl,-Bsymbolic",
            "-Wl,-z,now",
            "-Wl,-z,noexecstack",
        ])
        .status()
        .context("failed to invoke clang for linking")?;

    if !status.success() {
        return Err(anyhow!(
            "linker failed for {} (exit code {:?})",
            so.display(),
            status.code()
        ));
    }
    Ok(())
}

fn parse_signature(explicit: Option<&str>, path: &Path, symbol: &str) -> Result<FunctionSignature> {
    if let Some(explicit) = explicit {
        match explicit.trim().to_ascii_lowercase().as_str() {
            "mul" | "mul_u64" | "u64_mul" | "mul64" => return Ok(FunctionSignature::U64Mul),
            "square" | "square_u64" | "u64_square" | "square64" => {
                return Ok(FunctionSignature::U64Square)
            }
            _other => {
                return Err(anyhow!(
                    "unknown signature override '{other}'. expected mul or square"
                ))
            }
        }
    }

    let lowered_path = path.display().to_string().to_ascii_lowercase();
    if lowered_path.contains("/square/") || lowered_path.contains("\\square\\") {
        return Ok(FunctionSignature::U64Square);
    }

    let lowered_symbol = symbol.to_ascii_lowercase();
    if lowered_symbol.contains("square") {
        return Ok(FunctionSignature::U64Square);
    }

    Ok(FunctionSignature::U64Mul)
}

fn infer_symbol_from_source(path: &Path) -> Result<String> {
    match path.extension().and_then(OsStr::to_str) {
        Some("c") => infer_symbol_from_c(path),
        _ => infer_symbol_from_asm(path)
            .ok_or_else(|| anyhow!("Unable to locate exported symbol in {}", path.display())),
    }
}

fn infer_symbol_from_c(path: &Path) -> Result<String> {
    let contents =
        fs::read_to_string(path).with_context(|| format!("failed to read {}", path.display()))?;
    for line in contents.lines() {
        let line = line.trim();
        if line.starts_with("void ") {
            if let Some(name_part) = line[5..].split('(').next() {
                let name = name_part.trim();
                if !name.is_empty() {
                    return Ok(name.to_string());
                }
            }
        }
    }
    Err(anyhow!(
        "could not infer exported symbol from C file {}. specify ::symbol explicitly",
        path.display()
    ))
}

fn infer_symbol_from_asm(path: &Path) -> Option<String> {
    let contents = fs::read_to_string(path).ok()?;
    for raw_line in contents.lines() {
        let trimmed = raw_line.trim();
        if trimmed.is_empty() {
            continue;
        }
        let line = trimmed
            .split(|c| c == '#' || c == ';')
            .next()
            .unwrap_or(trimmed)
            .trim();
        if line.is_empty() {
            continue;
        }
        if let Some(rest) = line.strip_prefix(".globl") {
            return Some(rest.trim().to_string());
        }
        if let Some(rest) = line.strip_prefix(".global") {
            return Some(rest.trim().to_string());
        }
        if let Some(rest) = line.strip_prefix("GLOBAL ") {
            return Some(rest.trim().to_string());
        }
        if let Some(rest) = line.strip_prefix("global ") {
            let mut tokens = rest.split(|c: char| matches!(c, ',' | ':') || c.is_whitespace());
            if let Some(sym) = tokens.next() {
                if !sym.is_empty() {
                    return Some(sym.to_string());
                }
            }
        }
    }
    None
}

fn is_nasm_source(path: &Path) -> bool {
    let lower = path.display().to_string().to_ascii_lowercase();
    // Check for NASM directories or CryptOpt generated files
    // Note: cryptopt-fiat/generated/ uses NASM, but cryptopt-fiat/fiat-c/ uses GAS
    lower.contains("nasm") 
        || lower.contains("hand_opt")
        || lower.contains("/generated/")  // CryptOpt generated files use NASM syntax
        || lower.contains("\\generated\\")  // Windows path separator
}
