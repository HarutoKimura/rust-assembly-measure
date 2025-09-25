#include <stdint.h>

// Wrapper to expose the static inline Fiat-crypto carry_square as a global symbol.
#ifndef FIAT_CURVE25519_SQUARE_BASELINE_NAME
#define FIAT_CURVE25519_SQUARE_BASELINE_NAME fiat_curve25519_carry_square_baseline
#endif

#include "../src/curve25519_64.c"

void FIAT_CURVE25519_SQUARE_BASELINE_NAME(
    uint64_t out1[5],
    const uint64_t arg1[5])
{
    fiat_25519_carry_square(out1, arg1);
}
