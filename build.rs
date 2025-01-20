use std::process::Command;

fn build_curve25519() {
       // LLC version
       assert!(Command::new("clang")
              .args(&["-c", "src/curve25519/llc/rust_fiat_curve25519_carry_mul.asm", 
                     "-o", "src/curve25519/llc/rust_fiat_curve25519_carry_mul.o"])
              .status()
              .unwrap()
              .success());

       assert!(Command::new("ar")
              .args(&["rcs", "src/curve25519/llc/librust_fiat_curve25519_carry_mul.a", 
                     "src/curve25519/llc/rust_fiat_curve25519_carry_mul.o"])
              .status()
              .unwrap()
              .success());

       // NASM version
       assert!(Command::new("nasm")
              .args(&["-f", "elf64", "src/curve25519/llc-nasm/rust_fiat_curve25519_carry_mul_nasm.asm", 
                     "-o", "src/curve25519/llc-nasm/rust_fiat_curve25519_carry_mul_nasm.o"])
              .status()
              .unwrap()
              .success());

       assert!(Command::new("ar")
              .args(&["rcs", "src/curve25519/llc-nasm/librust_fiat_curve25519_carry_mul_nasm.a", 
                     "src/curve25519/llc-nasm/rust_fiat_curve25519_carry_mul_nasm.o"])
              .status()
              .unwrap()
              .success());

       // CryptOpt version
       assert!(Command::new("nasm")
              .args(&["-f", "elf64", "src/curve25519/cryptopt/seed0001730861385656_ratio11529.asm", 
                     "-o", "src/curve25519/cryptopt/seed0001730861385656_ratio11529.o"])
              .status()
              .unwrap()
              .success());

       assert!(Command::new("ar")
              .args(&["rcs", "src/curve25519/cryptopt/librust_fiat_curve25519_carry_mul_CryptOpt.a", 
                     "src/curve25519/cryptopt/seed0001730861385656_ratio11529.o"])
              .status()
              .unwrap()
              .success());
}

fn build_p448() {
       // LLC version
       assert!(Command::new("clang")
              .args(&["-c", "src/p448/llc/rust_fiat_p448_solinas_carry_mul.asm", 
                     "-o", "src/p448/llc/rust_fiat_p448_solinas_carry_mul.o"])
              .status()
              .unwrap()
              .success());

       assert!(Command::new("ar")
              .args(&["rcs", "src/p448/llc/librust_fiat_p448_solinas_carry_mul.a", 
                     "src/p448/llc/rust_fiat_p448_solinas_carry_mul.o"])
              .status()
              .unwrap()
              .success());


       // NASM version
       assert!(Command::new("nasm")
              .args(&["-f", "elf64", "src/p448/llc-nasm/rust_fiat_p448_solinas_carry_mul_nasm.asm", 
                     "-o", "src/p448/llc-nasm/rust_fiat_p448_solinas_carry_mul_nasm.o"])
              .status()
              .unwrap()
              .success());

       assert!(Command::new("ar")
              .args(&["rcs", "src/p448/llc-nasm/librust_fiat_p448_solinas_carry_mul_nasm.a", 
                     "src/p448/llc-nasm/rust_fiat_p448_solinas_carry_mul_nasm.o"])
              .status()
              .unwrap()
              .success());

       // CryptOpt version
       assert!(Command::new("nasm")
              .args(&["-f", "elf64", "src/p448/cryptopt/seed0001731544914221_ratio15039.asm", 
                     "-o", "src/p448/cryptopt/seed0001731544914221_ratio15039.o"])
              .status()
              .unwrap()
              .success());

       assert!(Command::new("ar")
              .args(&["rcs", "src/p448/cryptopt/librust_fiat_p448_solinas_carry_mul_CryptOpt.a", 
                     "src/p448/cryptopt/seed0001731544914221_ratio15039.o"])
              .status()
              .unwrap()
              .success());
}

fn build_poly1305() {
       // Compile LLC version with Clang
       assert!(Command::new("clang")
              .args(&["-c", "src/poly1305/llc/rust_fiat_poly1305_carry_mul.asm", "-o", "src/poly1305/llc/rust_fiat_poly1305_carry_mul.o"])
              .status()
              .unwrap()
              .success());

       // Create static library for LLC version
       assert!(Command::new("ar")
              .args(&["rcs", "src/poly1305/llc/librust_fiat_poly1305_carry_mul.a", "src/poly1305/llc/rust_fiat_poly1305_carry_mul.o"])
              .status()
              .unwrap()
              .success());


       // NASM version
       assert!(Command::new("nasm")
              .args(&["-f", "elf64", "src/poly1305/llc-nasm/rust_fiat_poly1305_carry_mul_nasm.asm", 
                     "-o", "src/poly1305/llc-nasm/rust_fiat_poly1305_carry_mul_nasm.o"])
              .status()
              .unwrap()
              .success());

       assert!(Command::new("ar")
              .args(&["rcs", "src/poly1305/llc-nasm/librust_fiat_poly1305_carry_mul_nasm.a", 
                     "src/poly1305/llc-nasm/rust_fiat_poly1305_carry_mul_nasm.o"])
              .status()
              .unwrap()
              .success());


       // Compile CryptOpt version with NASM
       assert!(Command::new("nasm")
              .args(&["-f", "elf64", "src/poly1305/cryptopt/seed0001731558041395_ratio13486.asm", "-o", "src/poly1305/cryptopt/seed0001731558041395_ratio13486.o"])
              .status()
              .unwrap()
              .success());

       // Create static library for CryptOpt version
       assert!(Command::new("ar")
              .args(&["rcs", "src/poly1305/cryptopt/librust_fiat_poly1305_carry_mul_CryptOpt.a", "src/poly1305/cryptopt/seed0001731558041395_ratio13486.o"])
              .status()
              .unwrap()
              .success());
}

fn build_bls12(){
       // LLC version
       assert!(Command::new("clang")
              .args(&["-c", "src/bls12/llc/bls12_mul.asm", 
                     "-o", "src/bls12/llc/bls12_mul.o"])
              .status()
              .unwrap()
              .success());

       assert!(Command::new("ar")
              .args(&["rcs", "src/bls12/llc/libbls12_mul.a", 
                     "src/bls12/llc/bls12_mul.o"])
              .status()
              .unwrap()
              .success());

       // NASM version
       assert!(Command::new("nasm")
              .args(&["-f", "elf64", "src/bls12/llc-nasm/bls12_mul_nasm.asm", 
                     "-o", "src/bls12/llc-nasm/bls12_mul_nasm.o"])
              .status()
              .unwrap()
              .success());

       assert!(Command::new("ar")
              .args(&["rcs", "src/bls12/llc-nasm/libbls12_mul_nasm.a", 
                     "src/bls12/llc-nasm/bls12_mul_nasm.o"])
              .status()
              .unwrap()
              .success());

       // CryptOpt version
       assert!(Command::new("nasm")
              .args(&["-f", "elf64", "src/bls12/cryptopt/seed0001727835929832_ratio11238.asm", 
                     "-o", "src/bls12/cryptopt/seed0001727835929832_ratio11238.o"])
              .status()
              .unwrap()
              .success());

       assert!(Command::new("ar")
              .args(&["rcs", "src/bls12/cryptopt/libbls12_mul_CryptOpt.a", 
                     "src/bls12/cryptopt/seed0001727835929832_ratio11238.o"])
              .status()
              .unwrap()
              .success());

}

fn build_secp256k1_dettman(){
       // LLC version
       assert!(Command::new("clang")
              .args(&["-c", "src/secp256k1_dettman/llc/rust_fiat_secp256k1_dettman_mul.asm", 
                     "-o", "src/secp256k1_dettman/llc/rust_fiat_secp256k1_dettman_mul.o"])
              .status()
              .unwrap()
              .success());

       assert!(Command::new("ar")
              .args(&["rcs", "src/secp256k1_dettman/llc/librust_fiat_secp256k1_dettman_mul.a", 
                     "src/secp256k1_dettman/llc/rust_fiat_secp256k1_dettman_mul.o"])
              .status()
              .unwrap()
              .success());

       // NASM version
       assert!(Command::new("nasm")
              .args(&["-f", "elf64", "src/secp256k1_dettman/llc-nasm/rust_fiat_secp256k1_dettman_mul_nasm.asm", 
                     "-o", "src/secp256k1_dettman/llc-nasm/rust_fiat_secp256k1_dettman_mul_nasm.o"])
              .status()
              .unwrap()
              .success());

       assert!(Command::new("ar")
              .args(&["rcs", "src/secp256k1_dettman/llc-nasm/librust_fiat_secp256k1_dettman_mul_nasm.a", 
                     "src/secp256k1_dettman/llc-nasm/rust_fiat_secp256k1_dettman_mul_nasm.o"])
              .status()
              .unwrap()
              .success());

       // CryptOpt version
       assert!(Command::new("nasm")
              .args(&["-f", "elf64", "src/secp256k1_dettman/cryptopt/seed3823874498784910_ratio10849.asm", 
                     "-o", "src/secp256k1_dettman/cryptopt/seed3823874498784910_ratio10849.o"])
              .status()
              .unwrap()
              .success());

       assert!(Command::new("ar")
              .args(&["rcs", "src/secp256k1_dettman/cryptopt/librust_fiat_secp256k1_dettman_mul_CryptOpt.a", 
                     "src/secp256k1_dettman/cryptopt/seed3823874498784910_ratio10849.o"])
              .status()
              .unwrap()
              .success());

}



fn main() {
       // Build all curves
       build_curve25519();
       build_p448();
       build_poly1305();
       build_bls12();
       build_secp256k1_dettman();

       // Link paths for all curves
       println!("cargo:rustc-link-search=native=src/curve25519/llc");
       println!("cargo:rustc-link-search=native=src/curve25519/llc-nasm");
       println!("cargo:rustc-link-search=native=src/curve25519/cryptopt");
       println!("cargo:rustc-link-search=native=src/p448/llc");
       println!("cargo:rustc-link-search=native=src/p448/llc-nasm");
       println!("cargo:rustc-link-search=native=src/p448/cryptopt");
       println!("cargo:rustc-link-search=native=src/poly1305/llc");
       println!("cargo:rustc-link-search=native=src/poly1305/llc-nasm");
       println!("cargo:rustc-link-search=native=src/poly1305/cryptopt");
       println!("cargo:rustc-link-search=native=src/bls12/llc");
       println!("cargo:rustc-link-search=native=src/bls12/llc-nasm");
       println!("cargo:rustc-link-search=native=src/bls12/cryptopt");
       println!("cargo:rustc-link-search=native=src/secp256k1_dettman/llc");
       println!("cargo:rustc-link-search=native=src/secp256k1_dettman/llc-nasm");
       println!("cargo:rustc-link-search=native=src/secp256k1_dettman/cryptopt");

       // Link libraries
       println!("cargo:rustc-link-lib=static=rust_fiat_curve25519_carry_mul");
       println!("cargo:rustc-link-lib=static=rust_fiat_curve25519_carry_mul_nasm");
       println!("cargo:rustc-link-lib=static=rust_fiat_curve25519_carry_mul_CryptOpt");
       println!("cargo:rustc-link-lib=static=rust_fiat_p448_solinas_carry_mul");
       println!("cargo:rustc-link-lib=static=rust_fiat_p448_solinas_carry_mul_nasm");
       println!("cargo:rustc-link-lib=static=rust_fiat_p448_solinas_carry_mul_CryptOpt");
       println!("cargo:rustc-link-lib=static=rust_fiat_poly1305_carry_mul");
       println!("cargo:rustc-link-lib=static=rust_fiat_poly1305_carry_mul_nasm");
       println!("cargo:rustc-link-lib=static=rust_fiat_poly1305_carry_mul_CryptOpt");
       println!("cargo:rustc-link-lib=static=bls12_mul");
       println!("cargo:rustc-link-lib=static=bls12_mul_nasm");
       println!("cargo:rustc-link-lib=static=bls12_mul_CryptOpt");
       println!("cargo:rustc-link-lib=static=rust_fiat_secp256k1_dettman_mul");
       println!("cargo:rustc-link-lib=static=rust_fiat_secp256k1_dettman_mul_nasm");
       println!("cargo:rustc-link-lib=static=rust_fiat_secp256k1_dettman_mul_CryptOpt");

       // Watch for changes
       println!("cargo:rerun-if-changed=src/curve25519");
       println!("cargo:rerun-if-changed=src/p448");
       println!("cargo:rerun-if-changed=src/poly1305");
       println!("cargo:rerun-if-changed=src/bls12");
       println!("cargo:rerun-if-changed=src/secp256k1_dettman");
}