use libc::{c_char, c_int, c_void};
use std::ffi::{CStr, CString};
use std::marker::PhantomData;
use std::ops::Deref;
use std::os::unix::ffi::OsStrExt;
use std::path::Path;

const RTLD_NOW: c_int = 2;

#[derive(Debug, Clone)]
pub struct Error {
    message: String,
}

impl Error {
    fn new(msg: impl Into<String>) -> Self {
        Self { message: msg.into() }
    }

    fn from_dl_error(fallback: impl Into<String>) -> Self {
        unsafe {
            let err_ptr = libc::dlerror();
            if err_ptr.is_null() {
                Self::new(fallback)
            } else {
                let msg = CStr::from_ptr(err_ptr).to_string_lossy().into_owned();
                Self::new(msg)
            }
        }
    }
}

impl std::fmt::Display for Error {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", self.message)
    }
}

impl std::error::Error for Error {}

pub struct Library(*mut c_void);

impl Library {
    pub unsafe fn new<P: AsRef<Path>>(path: P) -> Result<Self, Error> {
        let path = path.as_ref();
        let bytes = path.as_os_str().as_bytes();
        let c_path = CString::new(bytes).map_err(|_| Error::new("library path contains interior null byte"))?;
        // Clear existing dlerror state
        libc::dlerror();
        let handle = libc::dlopen(c_path.as_ptr(), RTLD_NOW);
        if handle.is_null() {
            Err(Error::from_dl_error(format!("dlopen({}) failed", path.display())))
        } else {
            Ok(Library(handle))
        }
    }

    pub unsafe fn get<T>(&self, symbol: &[u8]) -> Result<Symbol<'_, T>, Error> {
        let needs_nul = symbol.last().copied() != Some(0);
        let mut _owned = None;
        let sym_ptr = if needs_nul {
            let cstr = CString::new(symbol)
                .map_err(|_| Error::new("symbol name contains interior null byte"))?;
            let ptr = cstr.as_ptr();
            _owned = Some(cstr);
            ptr
        } else {
            symbol.as_ptr() as *const c_char
        };
        libc::dlerror();
        let ptr = libc::dlsym(self.0, sym_ptr);
        if ptr.is_null() {
            Err(Error::from_dl_error("dlsym failed"))
        } else {
            Ok(Symbol {
                pointer: ptr as *mut T,
                _marker: PhantomData,
            })
        }
    }
}

impl Drop for Library {
    fn drop(&mut self) {
        unsafe {
            if !self.0.is_null() {
                libc::dlclose(self.0);
            }
        }
    }
}

pub struct Symbol<'lib, T> {
    pointer: *mut T,
    _marker: PhantomData<&'lib Library>,
}

impl<'lib, T> Deref for Symbol<'lib, T> {
    type Target = T;

    fn deref(&self) -> &Self::Target {
        unsafe { &*self.pointer }
    }
}

impl<'lib, T> Symbol<'lib, T> {
    pub fn as_ptr(&self) -> *mut T {
        self.pointer
    }
}

impl<'lib, T> Clone for Symbol<'lib, T> {
    fn clone(&self) -> Self {
        Self {
            pointer: self.pointer,
            _marker: PhantomData,
        }
    }
}

impl<'lib, T> Copy for Symbol<'lib, T> {}

pub type Result<T, E = Error> = std::result::Result<T, E>;
