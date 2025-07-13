#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#define DUDECT_IMPLEMENTATION
#include "dudect.h"

// Function signatures - will be filled by generator
// FUNCTION_DECLARATION

// Test configuration
#define FIELD_SIZE FIELD_SIZE_VALUE
#define LOOSE_BOUND LOOSE_BOUND_VALUE

// Global variables for test data
static uint64_t result[FIELD_SIZE];
static uint64_t input1[FIELD_SIZE];
static uint64_t input2[FIELD_SIZE];

// Initialize field element with random values within bounds
static void random_field_element(uint64_t *out) {
    for (int i = 0; i < FIELD_SIZE; i++) {
        // Generate random value within the loose bound
        out[i] = ((uint64_t)rand() << 32 | rand()) % LOOSE_BOUND;
    }
}

// This will be called repeatedly by dudect
uint8_t do_one_computation(uint8_t *data) {
    // Cast data to our test structure
    uint64_t *test_input1 = (uint64_t*)data;
    uint64_t *test_input2 = (uint64_t*)(data + FIELD_SIZE * sizeof(uint64_t));
    
    // Call the function under test
    FUNCTION_CALL
    
    // Return a byte from the result (dudect needs this)
    return (uint8_t)(result[0] & 0xFF);
}

// Prepare test inputs for dudect
void prepare_inputs(dudect_config_t *c, uint8_t *input_data, uint8_t *classes) {
    for (size_t i = 0; i < c->number_measurements; i++) {
        uint64_t *current_input1 = (uint64_t*)(input_data + i * c->chunk_size);
        uint64_t *current_input2 = (uint64_t*)(input_data + i * c->chunk_size + FIELD_SIZE * sizeof(uint64_t));
        
        classes[i] = randombit();
        
        if (classes[i] == 0) {
            // Class 0: Use fixed pattern
            for (int j = 0; j < FIELD_SIZE; j++) {
                current_input1[j] = 0;
                current_input2[j] = j + 1;
            }
        } else {
            // Class 1: Use random values
            random_field_element(current_input1);
            random_field_element(current_input2);
        }
    }
}

int main(int argc, char **argv) {
    printf("Testing constant-time property of FUNCTION_NAME\n");
    printf("Field size: %d, Loose bound: 0x%lx\n", FIELD_SIZE, LOOSE_BOUND);
    
    dudect_config_t config = {
        .chunk_size = 2 * FIELD_SIZE * sizeof(uint64_t),
        .number_measurements = 1000,
    };
    
    dudect_ctx_t ctx;
    dudect_init(&ctx, &config);
    
    // Run for a maximum number of iterations or until leakage is found
    dudect_state_t state = DUDECT_NO_LEAKAGE_EVIDENCE_YET;
    int max_iterations = 100; // Adjust as needed
    int iteration = 0;
    
    while (state == DUDECT_NO_LEAKAGE_EVIDENCE_YET && iteration < max_iterations) {
        state = dudect_main(&ctx);
        iteration++;
    }
    
    dudect_free(&ctx);
    
    if (state == DUDECT_LEAKAGE_FOUND) {
        printf("FAIL: Timing leakage detected in FUNCTION_NAME!\n");
        return 1;
    } else {
        printf("PASS: No timing leakage detected in FUNCTION_NAME after %d iterations\n", iteration);
        return 0;
    }
}