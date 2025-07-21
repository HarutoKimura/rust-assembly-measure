#include <stdint.h>
#include <string.h>

extern void fiat_c_curve25519_carry_mul_CryptOpt(uint64_t* out, const uint64_t* arg1, const uint64_t* arg2);

uint64_t secret_input1[4];
uint64_t secret_input2[4];
uint64_t public_output[4];

int main() {
    for (int i = 0; i < 4; i++) {
        secret_input1[i] = 0x1111111111111111ULL * (i + 1);
        secret_input2[i] = 0x2222222222222222ULL * (i + 1);
    }
    
    fiat_c_curve25519_carry_mul_CryptOpt(public_output, secret_input1, secret_input2);
    
    return (int)(public_output[0] & 0xFF);
}
