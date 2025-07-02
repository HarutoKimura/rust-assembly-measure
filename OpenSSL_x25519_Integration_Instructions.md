# Task: Integrate OpenSSL x25519 Assembly as CryptOpt Baseline

## Objective
Add OpenSSL's x25519-x86_64.pl assembly implementation as a new baseline for benchmarking CryptOpt curve25519 outputs. The goal is to compile it through build.rs to create `.a` files like existing implementations and measure CryptOpt performance against this industry-standard baseline.

## Current Project Structure
The project already has a sophisticated assembly compilation system:
- **Location**: `/home/harutok/rust-assembly-measure`
- **Build system**: `build.rs` handles compilation of assembly files using clang/nasm
- **Structure pattern**: `src/{c,rust}/curve-name/{llc,llc-nasm,cryptopt}/{mul,square}/`
- **Output**: Static `.a` library files for linking
- **Existing baseline**: There's already a `src/c/openssl-curve25519/` directory

## Existing CryptOpt Implementations to Compare Against
- **C variant**: `src/c/fiat-curve25519/cryptopt/`
- **Rust variant**: `src/rust/curve25519/cryptopt/`
- Both have `mul/` and `square/` subdirectories with `.asm` files

## Step-by-Step Implementation

### 1. Download OpenSSL x25519 Assembly
```bash
# Download the OpenSSL x25519-x86_64.pl file
wget https://raw.githubusercontent.com/openssl/openssl/master/crypto/ec/asm/x25519-x86_64.pl -O src/c/openssl-curve25519/src/x25519-x86_64.pl
```

### 2. Check Assembly Format and Convert if Needed
- **First**: Examine the `.pl` file to determine if it's already NASM format or needs conversion
- **If conversion needed**: Use the provided script `/home/harutok/CryptOpt/src/bridge/rust-bridge/data/asm-cleaner2.py` to convert from LLC to NASM format
- **Target format**: NASM-compatible assembly for x86_64

### 3. Create Directory Structure
Follow the existing pattern in `src/c/openssl-curve25519/`:
```
src/c/openssl-curve25519/
├── nasm/
│   ├── mul/           # For x25519 scalar multiplication
│   └── square/        # For field squaring (if applicable)
└── src/
    └── x25519-x86_64.pl (or converted .asm)
```

### 4. Extract/Adapt Function Names
- **Current pattern**: Functions like `fiat_c_curve25519_carry_mul`, `rust_fiat_curve25519_carry_mul`
- **OpenSSL naming**: Likely different, need to create wrapper functions or adapt names
- **Target naming convention**: `openssl_x25519_mul`, `openssl_x25519_square` (or similar)

### 5. Update build.rs
Add compilation steps for OpenSSL assembly following the existing pattern around line 1020+ in `build.rs`:

```rust
// OpenSSL x25519 version
assert!(Command::new("nasm")
    .args(&[
        "-f", "elf64",
        "src/c/openssl-curve25519/nasm/mul/x25519_openssl.asm",
        "-o",
        "src/c/openssl-curve25519/nasm/mul/x25519_openssl.o"
    ])
    .status()
    .unwrap()
    .success());
    
assert!(Command::new("ar")
    .args(&[
        "rcs",
        "src/c/openssl-curve25519/nasm/mul/libx25519_openssl.a",
        "src/c/openssl-curve25519/nasm/mul/x25519_openssl.o"
    ])
    .status()
    .unwrap()
    .success());
```

### 6. Add FFI Declarations
In `src/main.rs`, add a new module around line 80+:

```rust
mod openssl_curve25519 {
    pub const LOOSE_BOUND: u64 = 0x18000000000000;
    pub const SIZE: usize = 4;
    extern "C" {
        pub fn x25519_openssl_mul(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        // Add square function if available
    }
}
```

### 7. Update CurveType Enum and Function Mappings
- Add `OpenSSLCurve25519` variant to `CurveType` enum
- Update `get_mul_functions()` and `get_square_functions()` methods
- Add linking instructions in `build.rs`

### 8. Key Technical Considerations

#### Assembly Format Detection
The OpenSSL `.pl` file might be:
- **Perl script**: Generates assembly (need to run it first)
- **Direct assembly**: Can be compiled directly
- **AT&T syntax**: May need conversion to Intel/NASM syntax

#### Function Signature Compatibility
Ensure OpenSSL functions match the expected signature:
```c
void function_name(const uint64_t* arg1, const uint64_t* arg2, uint64_t* result);
```

#### Build Dependencies
- Ensure `nasm` is available
- Handle any OpenSSL-specific assembly requirements
- Test compilation before integration

### 9. Testing and Validation
1. **Compile test**: Ensure the assembly compiles without errors
2. **Link test**: Verify the `.a` file links correctly
3. **Function test**: Basic functionality test before benchmarking
4. **Benchmark integration**: Add to existing benchmark suite

### 10. Expected Benchmark Results
After implementation, you should be able to run:
```bash
cargo run --release openssl-curve25519
```
And see performance comparisons between:
- OpenSSL x25519 (new baseline)
- CryptOpt curve25519 outputs (C and Rust variants)
- Existing LLC/NASM baselines

## Files to Modify
1. **`build.rs`**: Add OpenSSL compilation steps
2. **`src/main.rs`**: Add FFI declarations and enum variants
3. **Assembly files**: Convert and place OpenSSL assembly
4. **Directory structure**: Create `src/c/openssl-curve25519/nasm/`

## Success Criteria
- [ ] OpenSSL assembly compiles to `.a` file
- [ ] FFI integration works without linking errors
- [ ] Benchmark runs comparing CryptOpt vs OpenSSL baseline
- [ ] Performance measurements show meaningful comparison

This integration will provide a robust industry-standard baseline for evaluating CryptOpt's curve25519 optimizations against real-world implementations.

## Reference Links
- [OpenSSL x25519-x86_64.pl source](https://github.com/openssl/openssl/blob/master/crypto/ec/asm/x25519-x86_64.pl)
- Assembly cleaner script: `/home/harutok/CryptOpt/src/bridge/rust-bridge/data/asm-cleaner2.py` 