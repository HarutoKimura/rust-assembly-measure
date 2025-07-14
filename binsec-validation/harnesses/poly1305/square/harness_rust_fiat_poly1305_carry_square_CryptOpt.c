#include <stdint.h>
#include <string.h>
#include <stdlib.h>

// External assembly function
extern void rust_fiat_poly1305_carry_square_CryptOpt(uint64_t* out, const uint64_t* arg1);

// Global variables for BINSEC to track
uint64_t secret_input[3];
uint64_t public_output[3];

int main() {
    // Initialize secret input with symbolic values
    // BINSEC will treat this as secret when marked in the config
    for (int i = 0; i < 3; i++) {
        secret_input[i] = 0x3333333333333333ULL * (i + 1);
    }
    
    // Call the assembly function
    rust_fiat_poly1305_carry_square_CryptOpt(public_output, secret_input);
    
    // Return value based on output to prevent optimization
    return (int)(public_output[0] & 0xFF);
}
