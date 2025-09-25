#include <stdint.h>

// Wrapper to expose the static inline Fiat p256 Montgomery square as a global symbol.
#ifndef FIAT_P256_SQUARE_BASELINE_NAME
#define FIAT_P256_SQUARE_BASELINE_NAME fiat_p256_square_baseline
#endif

#include "../src/p256_64.c"

void FIAT_P256_SQUARE_BASELINE_NAME(
    uint64_t out1[4],
    const uint64_t arg1[4])
{
    fiat_p256_square(out1, arg1);
}
