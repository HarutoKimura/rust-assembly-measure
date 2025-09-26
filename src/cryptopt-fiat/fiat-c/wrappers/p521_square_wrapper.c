#include <stdint.h>

// Wrapper to expose the static inline Fiat p521 Montgomery carry square as a global symbol.
#ifndef FIAT_P521_SQUARE_BASELINE_NAME
#define FIAT_P521_SQUARE_BASELINE_NAME fiat_p521_carry_square_baseline
#endif

#include "../src/p521_64.c"

void FIAT_P521_SQUARE_BASELINE_NAME(
    uint64_t out1[9],
    const uint64_t arg1[9])
{
    fiat_p521_carry_square(out1, arg1);
}
