// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//

#include <cstddef>
#include <cstdint>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

static uint32_t nextSrand = 0;

// clang-format off
static uint32_t
wasm_random(void)
{
    uint32_t randomNum;
    uint32_t timestamp = (unsigned int)time(0);
    nextSrand += timestamp;
    srand(nextSrand);
    randomNum = rand();
    return randomNum;
}

static void
wasm_buf(void * const buf, const size_t size)
{
    unsigned char *p = (unsigned char *) buf;
    size_t         i;

    for (i = (size_t) 0U; i < size; i++) {
        p[i] = (unsigned char) wasm_random();
    }
}
// clang-format on

extern "C" {
uint32_t random32(void) {
    return wasm_random();
}

void random_buffer(uint8_t* buf, size_t len) {
    wasm_buf(buf, len);
    return;
}

} // extern "C"