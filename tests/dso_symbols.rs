use std::env;
use std::path::PathBuf;
use std::process::Command;

#[test]
#[ignore]
fn dynamic_symbols_are_exported() {
    let manifest_dir = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
    let target_asm = "src/rust/curve25519/llc/mul/rust_fiat_curve25519_carry_mul_vec.asm";
    let baseline_c = "src/cryptopt-fiat/fiat-c/wrappers/curve25519_64_mul_wrapper.c";
    let baseline_symbol = "fiat_curve25519_carry_mul_baseline";

    let mut build = Command::new("cargo");
    build
        .arg("build")
        .arg("--features")
        .arg("dynamic-api")
        .arg("--lib")
        .current_dir(&manifest_dir)
        .env("CARGO_DYNAMIC_TARGETS", target_asm)
        .env("CARGO_BASELINE_C", baseline_c)
        .env("CARGO_BASELINE_SYMBOL", baseline_symbol);

    let status = build.status().expect("failed to spawn cargo build");
    assert!(
        status.success(),
        "dynamic build failed with status {status:?}"
    );

    let profile = env::var("PROFILE").unwrap_or_else(|_| "debug".to_string());
    let so_path = manifest_dir.join(format!("target/{profile}/librust_assembly_measure.so"));
    assert!(
        so_path.exists(),
        "expected shared object at {}",
        so_path.display()
    );

    let output = Command::new("nm")
        .arg("-D")
        .arg(&so_path)
        .output()
        .expect("failed to run nm");
    assert!(output.status.success(), "nm -D failed");

    let stdout = String::from_utf8_lossy(&output.stdout);
    assert!(
        stdout.contains("rust_fiat_curve25519_carry_mul_vec"),
        "assembly symbol not found in nm output"
    );
    assert!(
        stdout.contains(baseline_symbol),
        "baseline symbol not found in nm output"
    );
}
