# Build Modes Guide

This project supports two measurement methods with flexible build configurations.

---

## 🔄 Two Measurement Methods

### 1. Legacy Method (Static Linking with .a)
- **What**: Traditional cargo build with static libraries
- **Pros**: All functions pre-compiled, faster runtime
- **Cons**: Must specify curve at compile-time, slower builds
- **Usage**: For benchmarking known curves

### 2. Dynamic Method (Runtime Linking with .so)
- **What**: Runtime compilation and dynamic linking
- **Pros**: Specify ANY assembly file at runtime, flexible
- **Cons**: Slightly slower first load (compiles on-the-fly)
- **Usage**: For comparing arbitrary assembly implementations

---

## 🛠️ Build Configurations

### Configuration 1: Legacy Mode (Default)
Builds all static libraries (.a files) for all curves.

```bash
# Build everything (legacy + dynamic capability)
cargo build --release --features dynamic-api

# Time: ~60-90 seconds (builds ~50+ .a files)
# Result: Can use BOTH legacy AND dynamic methods
```

**When to use**: 
- You want to use the legacy method (`cargo run curve25519 mul`)
- You don't mind longer build times
- Backward compatibility


### Configuration 2: Dynamic-Only Mode (Fast)
Skips all .a builds, only enables dynamic-api.

```bash
# Set environment variable to skip legacy builds
export SKIP_LEGACY_BUILD=1

# Fast build (only compiles runtime dynamic loader)
cargo build --release --features dynamic-api

# Time: ~10-15 seconds (skips all .a files)
# Result: Can ONLY use dynamic method
```

**When to use**:
- You ONLY want to use `--dynamic` at runtime
- You want fast iteration/development
- You're comparing arbitrary assembly files


### Configuration 3: Pure Legacy (No Dynamic)
Traditional build without dynamic-api feature.

```bash
# Build without dynamic feature
cargo build --release

# Time: ~60-90 seconds
# Result: Can ONLY use legacy method
```

**When to use**:
- You never need dynamic mode
- Minimal binary size
- Production builds without dynamic capability

---

## 📋 Usage Examples

### Example 1: Using Dynamic-Only Mode (Recommended for Development)

```bash
# One-time setup (add to ~/.bashrc or ~/.zshrc)
export SKIP_LEGACY_BUILD=1

# Fast build
cargo build --release --features dynamic-api

# Use dynamic method at runtime
cargo run --release --features dynamic-api -- --dynamic \
  src/cryptopt-fiat/generated/fiat-amd64/fiat_curve25519_carry_mul/seed*.asm \
  src/cryptopt-fiat/fiat-c/clang/curve25519/mul/fiat_curve25519_carry_mul_clang.asm \
  --cpu 10
```

### Example 2: Using Both Methods

```bash
# Unset skip flag (or don't set it)
unset SKIP_LEGACY_BUILD

# Full build (takes longer)
cargo build --release --features dynamic-api

# Use legacy method
cargo run --release curve25519 mul

# OR use dynamic method
cargo run --release --features dynamic-api -- --dynamic \
  candidate.asm baseline.asm
```

### Example 3: Legacy Only

```bash
# Build without dynamic feature
cargo build --release

# Use legacy method only
cargo run --release curve25519 mul
```

---

## 🚀 Quick Reference

| Goal | Command | Build Time | Methods Available |
|------|---------|------------|-------------------|
| **Fast development** | `SKIP_LEGACY_BUILD=1 cargo build --features dynamic-api` | ~15s | Dynamic only |
| **Maximum flexibility** | `cargo build --features dynamic-api` | ~90s | Both |
| **Legacy only** | `cargo build` | ~90s | Legacy only |

---

## 🔧 Convenience Aliases

Add to your shell config (`~/.bashrc` or `~/.zshrc`):

```bash
# Fast dynamic-only builds
alias rust-asm-build-fast='SKIP_LEGACY_BUILD=1 cargo build --release --features dynamic-api'

# Run dynamic measurement
alias rust-asm-dynamic='cargo run --release --features dynamic-api -- --dynamic'

# Run legacy measurement  
alias rust-asm-legacy='cargo run --release --'
```

Usage:
```bash
# Fast build
rust-asm-build-fast

# Measure
rust-asm-dynamic candidate.asm baseline.asm --cpu 10
```

---

## 🔍 Checking Current Mode

```bash
# Check if SKIP_LEGACY_BUILD is set
echo $SKIP_LEGACY_BUILD

# If output is "1", you're in dynamic-only mode
# If output is empty, you're in full-build mode
```

---

## 💡 Tips

1. **For CI/CD**: Use full build mode (no SKIP_LEGACY_BUILD) to test both methods

2. **For Development**: Use `SKIP_LEGACY_BUILD=1` for fast iteration

3. **For Production**: Choose based on your use case:
   - Use dynamic if you need runtime flexibility
   - Use legacy if you have predefined curves

4. **First Time Setup**: Try dynamic-only mode first to verify your system works

5. **Switching Modes**: Just change the env var and rebuild
   ```bash
   # Switch to fast mode
   export SKIP_LEGACY_BUILD=1
   cargo clean  # Optional: force rebuild
   cargo build --release --features dynamic-api
   
   # Switch to full mode
   unset SKIP_LEGACY_BUILD
   cargo build --release --features dynamic-api
   ```

---

## 📊 Build Time Comparison

On a typical development machine:

| Mode | Build Time | Artifacts | Disk Usage |
|------|------------|-----------|------------|
| Dynamic-Only | ~15 seconds | ~50 files | ~200 MB |
| Full Build | ~90 seconds | ~150 files | ~800 MB |
| Legacy Only | ~90 seconds | ~100 files | ~600 MB |

---

## ❓ Troubleshooting

### "Dynamic measurement failed"
- Check that you built with `--features dynamic-api`
- Verify `nasm` and `clang` are installed

### "Unknown curve" error
- You're trying to use legacy method but built with `SKIP_LEGACY_BUILD=1`
- Solution: Remove SKIP_LEGACY_BUILD and rebuild

### Builds are slow
- Use `SKIP_LEGACY_BUILD=1` if you only need dynamic mode
- Use `cargo build -j8` to parallelize builds

### Want to see what's being built?
```bash
# Verbose build output
cargo build --release --features dynamic-api -vv
```

---

**Last Updated**: 2025-10-09
