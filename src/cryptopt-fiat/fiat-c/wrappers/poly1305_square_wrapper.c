#include <stdint.h>

// Wrapper to expose the static inline Fiat poly1305 carry square as a global symbol.
#ifndef FIAT_POLY1305_SQUARE_BASELINE_NAME
#define FIAT_POLY1305_SQUARE_BASELINE_NAME fiat_poly1305_carry_square_baseline
#endif

#include "../src/poly1305_64.c"

void FIAT_POLY1305_SQUARE_BASELINE_NAME(
    uint64_t out1[3],
    const uint64_t arg1[3])
{
    fiat_poly1305_carry_square(out1, arg1);
}
