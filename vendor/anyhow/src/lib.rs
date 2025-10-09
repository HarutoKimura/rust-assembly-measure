use std::error::Error as StdError;
use std::fmt;

pub type Result<T> = std::result::Result<T, Error>;

#[derive(Debug, Clone)]
pub struct Error {
    message: String,
}

impl Error {
    pub fn new(message: impl Into<String>) -> Self {
        Self {
            message: message.into(),
        }
    }

    fn prepend(mut self, ctx: String) -> Self {
        if self.message.is_empty() {
            self.message = ctx;
        } else {
            self.message = format!("{ctx}: {}", self.message);
        }
        self
    }

    fn from_std_error<E>(error: E) -> Self
    where
        E: StdError + Send + Sync + 'static,
    {
        Self {
            message: error.to_string(),
        }
    }
}

impl fmt::Display for Error {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}", self.message)
    }
}

impl StdError for Error {}

impl From<String> for Error {
    fn from(value: String) -> Self {
        Self { message: value }
    }
}

impl From<&str> for Error {
    fn from(value: &str) -> Self {
        Self {
            message: value.to_string(),
        }
    }
}

pub trait Context<T> {
    fn context(self, msg: impl Into<String>) -> Result<T>;
    fn with_context<F, U>(self, f: F) -> Result<T>
    where
        F: FnOnce() -> U,
        U: Into<String>;
}

impl<T, E> Context<T> for std::result::Result<T, E>
where
    E: StdError + Send + Sync + 'static,
{
    fn context(self, msg: impl Into<String>) -> Result<T> {
        self.map_err(|err| Error::from_std_error(err).prepend(msg.into()))
    }

    fn with_context<F, U>(self, f: F) -> Result<T>
    where
        F: FnOnce() -> U,
        U: Into<String>,
    {
        self.map_err(|err| Error::from_std_error(err).prepend(f().into()))
    }
}

#[macro_export]
macro_rules! anyhow {
    ($msg:literal $(,)?) => {
        $crate::Error::new($msg)
    };
    ($fmt:expr, $($arg:tt)*) => {
        $crate::Error::new(format!($fmt, $($arg)*))
    };
}

#[macro_export]
macro_rules! bail {
    ($msg:literal $(,)?) => {
        return Err($crate::Error::new($msg));
    };
    ($fmt:expr, $($arg:tt)*) => {
        return Err($crate::Error::new(format!($fmt, $($arg)*)));
    };
}

#[macro_export]
macro_rules! ensure {
    ($cond:expr, $msg:literal $(,)?) => {
        if !$cond {
            $crate::bail!($msg);
        }
    };
    ($cond:expr, $fmt:expr, $($arg:tt)*) => {
        if !$cond {
            $crate::bail!($fmt, $($arg)*);
        }
    };
}
