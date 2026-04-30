#include "hash_funcs.h"

#include "immintrin.h"
#include <string.h>

long long Hash_return_0(char* word)
{
    return 0;
}

long long Hash_1_letter(char* word)
{
    return word[0];
}

long long Hash_len(char* word)
{
    return (int)strlen(word);
}

long long Hash_sum_ASCII(char* word)
{
    int sum = 0;

    for (int i = 0; word[i] != 0; i++)
        sum += word[i];

    return sum;
}

long long Hash_rol_xor(char* word)
{
    long long hash = 0;
    int len = (int)strlen(word);

    for (int i = 0; i < len; i++)
    {
        hash = (hash >> 63) | (hash << 1);
        hash = hash ^ word[i];
    }

    return hash;
}

long long Hash_crc32(char* word)
{
    unsigned crc = 0xFFFFFFFF;
    int len = (int)strlen(word);
    int count_cyc_1 = len / 4;
    int count_cyc_2 = len % 4;

    for (int i = 0; i < count_cyc_1; word += 4, i++)
    {
        int words_4 = (*word << 24) | (*(word+1) << 16) | (*(word+2) << 8) | *(word+3);
        crc = _mm_crc32_u32(crc, (unsigned)words_4);
    }

    for (int i = 0; i < count_cyc_2; word ++, i++)
    {
        unsigned char ch = *word;
        __asm__ volatile 
        (
            "crc32b %1, %0"
            : "+r"(crc)
            : "r"(ch)
        );
    }

    return crc;
}

//gui kcachegrind