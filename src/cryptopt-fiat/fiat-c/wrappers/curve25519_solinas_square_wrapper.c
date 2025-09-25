#include <stdint.h>

// Wrapper to expose the static inline Fiat curve25519 Solinas square as a global symbol.
#ifndef FIAT_CURVE25519_SOLINAS_SQUARE_BASELINE_NAME
#define FIAT_CURVE25519_SOLINAS_SQUARE_BASELINE_NAME fiat_curve25519_solinas_square_baseline
#endif

#include "../src/curve25519_solinas_64.c"

void FIAT_CURVE25519_SOLINAS_SQUARE_BASELINE_NAME(
    uint64_t out1[4],
    const uint64_t arg1[4])
{
    fiat_curve25519_solinas_square(out1, arg1);
}
