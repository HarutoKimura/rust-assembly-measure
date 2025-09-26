#include <stdint.h>

// Wrapper to expose the static inline Fiat secp256k1 Montgomery square as a global symbol.
#ifndef FIAT_SECP256K1_MONTGOMERY_SQUARE_BASELINE_NAME
#define FIAT_SECP256K1_MONTGOMERY_SQUARE_BASELINE_NAME fiat_secp256k1_montgomery_square_baseline
#endif

#include "../src/secp256k1_montgomery_64.c"

void FIAT_SECP256K1_MONTGOMERY_SQUARE_BASELINE_NAME(
    uint64_t out1[4],
    const uint64_t arg1[4])
{
    fiat_secp256k1_montgomery_square(out1, arg1);
}
