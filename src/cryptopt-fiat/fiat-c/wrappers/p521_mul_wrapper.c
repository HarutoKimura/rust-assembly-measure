#include <stdint.h>

// Wrapper to expose the static inline Fiat p521 Montgomery carry mul as a global symbol.
#ifndef FIAT_P521_BASELINE_NAME
#define FIAT_P521_BASELINE_NAME fiat_p521_carry_mul_baseline
#endif

#include "../src/p521_64.c"

void FIAT_P521_BASELINE_NAME(
    uint64_t out1[9],
    const uint64_t arg1[9],
    const uint64_t arg2[9])
{
    fiat_p521_carry_mul(out1, arg1, arg2);
}
