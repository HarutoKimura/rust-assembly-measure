#include <stdint.h>

// Wrapper to expose the static inline Fiat p434 Montgomery mul as a global symbol.
#ifndef FIAT_P434_BASELINE_NAME
#define FIAT_P434_BASELINE_NAME fiat_p434_mul_baseline
#endif

#include "../src/p434_64.c"

void FIAT_P434_BASELINE_NAME(
    uint64_t out1[7],
    const uint64_t arg1[7],
    const uint64_t arg2[7])
{
    fiat_p434_mul(out1, arg1, arg2);
}
