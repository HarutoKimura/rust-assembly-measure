//! Shared library entry point for rust-assembly-meausre.
//!
//! When the `dynamic-api` feature is enabled the build script stitches together
//! the requested assembly (and optional baseline C) objects into a single
//! `cdylib`. The modules exposed here provide a safe façade around the dynamic
//! loader and benchmarking helpers. Without the feature the crate exposes the
//! original static measurement tooling.

pub mod curve_spec;  // Now available for both legacy and dynamic modes
pub mod ffi;
#[cfg(not(feature = "dynamic-api"))]
pub mod measurement;
#[cfg(not(feature = "dynamic-api"))]
pub mod precise_timing;

#[cfg(not(feature = "dynamic-api"))]
pub use curve_spec::{CurveType, Function, FunctionLabels, ALL_CURVES};
#[cfg(feature = "dynamic-api")]
pub use curve_spec::{BoundSpec, CurveType};  // Export needed types for dynamic mode
#[cfg(not(feature = "dynamic-api"))]
pub use measurement::{
    calculate_median, measure_u64_mul_functions_interleaved_enhanced,
    measure_u64_mul_functions_interleaved_enhanced_five,
    measure_u64_mul_functions_interleaved_enhanced_four,
    measure_u64_square_functions_interleaved_enhanced,
    measure_u64_square_functions_interleaved_enhanced_five,
    measure_u64_square_functions_interleaved_enhanced_four,
    measure_usize_mul_functions_interleaved_enhanced,
};
#[cfg(not(feature = "dynamic-api"))]
pub use precise_timing::{MeasurementConfig, MeasurementStats};

#[cfg(all(feature = "dynamic-api", target_arch = "x86_64"))]
pub mod dynamic_cli;
#[cfg(feature = "dynamic-api")]
mod dynload;
#[cfg(all(feature = "dynamic-api", target_arch = "x86_64"))]
mod measure_dyn;
#[cfg(feature = "dynamic-api")]
pub mod runtime_build;

#[cfg(all(feature = "dynamic-api", not(target_arch = "x86_64")))]
compile_error!("dynamic-api feature currently supports x86_64 targets only");

#[cfg(feature = "dynamic-api")]
pub use dynload::{prewarm, DynFunc};
#[cfg(all(feature = "dynamic-api", target_arch = "x86_64"))]
pub use measure_dyn::{measure_pair, MeasureCfg, MeasureOut};

#[cfg(feature = "dynamic-api")]
include!(concat!(env!("OUT_DIR"), "/dynamic_wrappers.rs"));
