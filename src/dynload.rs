use std::ffi::CString;
use std::path::Path;

use anyhow::{anyhow, Context, Result};
use libloading::Library;

/// Loaded function symbol alongside the owning dynamic library.
pub struct DynFunc<T: Copy + Sized> {
    _lib: Library,
    func: T,
    raw: *const (),
}

impl<T: Copy + Sized> DynFunc<T> {
    /// Loads `symbol` from `path`, forcing eager relocation.
    ///
    /// # Safety
    /// Caller must ensure that `T` matches the actual ABI of `symbol`.
    pub unsafe fn load<P: AsRef<Path>>(path: P, symbol: &[u8]) -> Result<Self> {
        let path = path.as_ref();
        let lib = Library::new(path)
            .with_context(|| format!("Failed to open dynamic library at {}", path.display()))?;

        let symbol_cstr = CString::new(symbol).map_err(|_| {
            anyhow!(
                "Symbol name '{}' contains interior null bytes",
                String::from_utf8_lossy(symbol)
            )
        })?;

        let raw_symbol: libloading::Symbol<T> =
            lib.get(symbol_cstr.as_bytes_with_nul()).with_context(|| {
                format!(
                    "Failed to resolve symbol '{}'",
                    String::from_utf8_lossy(symbol)
                )
            })?;
        let raw_ptr = raw_symbol.as_ptr() as *const T as *const ();
        let func = *raw_symbol;

        Ok(Self {
            _lib: lib,
            func,
            raw: raw_ptr,
        })
    }

    /// Returns the raw pointer for this function symbol.
    pub fn as_ptr(&self) -> *const () {
        self.raw
    }

    /// Returns the typed function pointer for direct invocation.
    pub fn function(&self) -> T {
        self.func
    }
}

/// Convenience helper to ensure any cold-start side-effects happen outside of
/// timed regions.
pub fn prewarm<F>(f: F, call: impl FnOnce(&F)) {
    call(&f);
}

// All supported targets rely on `Library::new` internally using eager symbol binding.
