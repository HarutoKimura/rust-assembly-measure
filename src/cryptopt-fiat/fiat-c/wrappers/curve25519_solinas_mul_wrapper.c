#include <stdint.h>

// Wrapper to expose the static inline Fiat curve25519 Solinas mul as a global symbol.
#ifndef FIAT_CURVE25519_SOLINAS_BASELINE_NAME
#define FIAT_CURVE25519_SOLINAS_BASELINE_NAME fiat_curve25519_solinas_mul_baseline
#endif

#include "../src/curve25519_solinas_64.c"

void FIAT_CURVE25519_SOLINAS_BASELINE_NAME(
    uint64_t out1[4],
    const uint64_t arg1[4],
    const uint64_t arg2[4])
{
    fiat_curve25519_solinas_mul(out1, arg1, arg2);
}
