#include <stdint.h>

// Wrapper to expose the static inline Fiat p448 Solinas carry square as a global symbol.
#ifndef FIAT_P448_SOLINAS_SQUARE_BASELINE_NAME
#define FIAT_P448_SOLINAS_SQUARE_BASELINE_NAME fiat_p448_solinas_carry_square_baseline
#endif

#include "../src/p448_solinas_64.c"

void FIAT_P448_SOLINAS_SQUARE_BASELINE_NAME(
    uint64_t out1[8],
    const uint64_t arg1[8])
{
    fiat_p448_carry_square(out1, arg1);
}
