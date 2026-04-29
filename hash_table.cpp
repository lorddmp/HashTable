#include "hash_table.h"
#include "hash_funcs.h"

#include <stdio.h>
#include <sys/stat.h>
#include <ctype.h>
#include <string.h>

#define INPUT_FILE "words_source.txt"
#define INPUT_TEST_FILE "words_tests.txt"

extern "C" int my_strcmp(char* str1, char* str2);

str_spisok* Init_Hash_Table()
{
    str_spisok* mas_list = (str_spisok*)calloc(MASSIVE_SIZE, sizeof(str_spisok));

    for (int i = 0; i < MASSIVE_SIZE; i++)
        Init_Spisok(&mas_list[i]);

    return mas_list;
}

char* Read_Words()
{
    FILE* fp = fopen(INPUT_FILE, "r");

    if (fp == NULL)
        printf("Couldn't open words' source file\n");

    int descriptor = fileno(fp);
    struct stat haha;
    fstat(descriptor, &haha);

    char* massive = (char*)calloc((size_t)haha.st_size + 1, sizeof(char));

    fread(massive, sizeof(char), (size_t)haha.st_size, fp);

    fclose(fp);

    return massive;
}

char** Read_Test_Words()
{
    FILE* fp = fopen(INPUT_TEST_FILE, "r");

    if (fp == NULL)
        printf("Couldn't open words' source file\n");

    int descriptor = fileno(fp);
    struct stat haha;
    fstat(descriptor, &haha);

    char* massive = (char*)calloc((size_t)haha.st_size + 1, sizeof(char));
    char* massive_pointer = massive;
    char** mas_words = (char**)calloc(SIZE_TEST_FILE, sizeof(char*));

    fread(massive, sizeof(char), (size_t)haha.st_size, fp);

    for (int i = 0; i < SIZE_TEST_FILE; i++, massive++)
    {
        mas_words[i] = (char*)calloc(32, sizeof(char));
        for (int j = 0; (j < 20) && (*massive != '\n'); j++, massive++)
            mas_words[i][j] = *massive;
    }

    fclose(fp);
    free (massive_pointer);

    return mas_words;
}

void Skip_non_letters(char** massive)
{
    while (**massive != '\0' && !isalpha(**massive))
        (*massive)++;
}

bool Word_In_List(str_spisok spisok, char* word)
{
    for (int i = 1; i <= spisok.size; i++)
    {
        if (strcmp(spisok.data[i], word) == 0)
            return 1;
    }

    return 0;
}

int Find_Word(str_spisok* mas_list, char* word)
{
    long long index_mas = Hash_crc32(word) % MASSIVE_SIZE;

    for (int i = 1; i <= mas_list[index_mas].size; i++)
        if (my_strcmp(mas_list[index_mas].data[i], word) == 0)
            return i;

    return 0;
}

void Fill_Hash_Table(str_spisok* mas_list, char* massive)
{
    Skip_non_letters(&massive);
    while (*massive != 0)
    {
        char* word = (char*)calloc(32, sizeof(char));
        for (int i = 0; isalpha(*massive); i++, massive++)
            word[i] = *massive;

        Skip_non_letters(&massive);

        long long index = Hash_crc32(word);

        index %= MASSIVE_SIZE;

        if (Word_In_List(mas_list[index], word))
        {
            free(word);
            continue;
        }

        Data_Vstavka(&mas_list[index], mas_list[index].size, word);
    }
}