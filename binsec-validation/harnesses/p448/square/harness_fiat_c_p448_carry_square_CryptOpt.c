#include <stdint.h>
#include <string.h>
#include <stdlib.h>

// External assembly function
extern void fiat_c_p448_carry_square_CryptOpt(uint64_t* out, const uint64_t* arg1);

// Global variables for BINSEC to track
uint64_t secret_input[8];
uint64_t public_output[8];

int main() {
    // Initialize secret input with symbolic values
    // BINSEC will treat this as secret when marked in the config
    for (int i = 0; i < 8; i++) {
        secret_input[i] = 0x3333333333333333ULL * (i + 1);
    }
    
    // Call the assembly function
    fiat_c_p448_carry_square_CryptOpt(public_output, secret_input);
    
    // Return value based on output to prevent optimization
    return (int)(public_output[0] & 0xFF);
}
