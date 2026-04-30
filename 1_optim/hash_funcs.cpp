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

    for (int i = 0; i < (int)strlen(word); word ++, i++)
        crc = _mm_crc32_u8(crc, (unsigned char)*word);

    return crc;
}

//gui kcachegrind