#include <stdint.h>

// Wrapper to expose the static inline Fiat p384 Montgomery square as a global symbol.
#ifndef FIAT_P384_SQUARE_BASELINE_NAME
#define FIAT_P384_SQUARE_BASELINE_NAME fiat_p384_square_baseline
#endif

#include "../src/p384_64.c"

void FIAT_P384_SQUARE_BASELINE_NAME(
    uint64_t out1[6],
    const uint64_t arg1[6])
{
    fiat_p384_square(out1, arg1);
}
