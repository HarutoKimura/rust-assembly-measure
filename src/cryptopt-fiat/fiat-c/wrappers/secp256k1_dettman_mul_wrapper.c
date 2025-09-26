#include <stdint.h>

// Wrapper to expose the static inline Fiat secp256k1 Dettman mul as a global symbol.
#ifndef FIAT_SECP256K1_DETTMAN_BASELINE_NAME
#define FIAT_SECP256K1_DETTMAN_BASELINE_NAME fiat_secp256k1_dettman_mul_baseline
#endif

#include "../src/secp256k1_dettman_64.c"

void FIAT_SECP256K1_DETTMAN_BASELINE_NAME(
    uint64_t out1[5],
    const uint64_t arg1[5],
    const uint64_t arg2[5])
{
    fiat_secp256k1_dettman_mul(out1, arg1, arg2);
}
