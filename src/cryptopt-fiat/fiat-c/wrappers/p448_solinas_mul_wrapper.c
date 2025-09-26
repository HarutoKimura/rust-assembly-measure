#include <stdint.h>

// Wrapper to expose the static inline Fiat p448 Solinas carry mul as a global symbol.
#ifndef FIAT_P448_SOLINAS_BASELINE_NAME
#define FIAT_P448_SOLINAS_BASELINE_NAME fiat_p448_solinas_carry_mul_baseline
#endif

#include "../src/p448_solinas_64.c"

void FIAT_P448_SOLINAS_BASELINE_NAME(
    uint64_t out1[8],
    const uint64_t arg1[8],
    const uint64_t arg2[8])
{
    fiat_p448_carry_mul(out1, arg1, arg2);
}
