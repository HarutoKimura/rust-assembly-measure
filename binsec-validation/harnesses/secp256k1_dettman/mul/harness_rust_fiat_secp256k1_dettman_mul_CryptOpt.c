#include <stdint.h>
#include <string.h>
#include <stdlib.h>

// External assembly function
extern void rust_fiat_secp256k1_dettman_mul_CryptOpt(uint64_t* out, const uint64_t* arg1, const uint64_t* arg2);

// Global variables for BINSEC to track
uint64_t secret_input1[5];
uint64_t secret_input2[5];
uint64_t public_output[5];

int main() {
    // Initialize secret inputs with symbolic values
    // BINSEC will treat these as secret when marked in the config
    for (int i = 0; i < 5; i++) {
        secret_input1[i] = 0x1111111111111111ULL * (i + 1);
        secret_input2[i] = 0x2222222222222222ULL * (i + 1);
    }
    
    // Call the assembly function
    rust_fiat_secp256k1_dettman_mul_CryptOpt(public_output, secret_input1, secret_input2);
    
    // Return value based on output to prevent optimization
    return (int)(public_output[0] & 0xFF);
}
