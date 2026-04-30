#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>

#include "spisok.h"
#include "hash_funcs.h"
#include "hash_table.h"

int main()
{
    str_spisok* mas_list = Init_Hash_Table();
    assert(mas_list);

    int counter = 0;
    char* massive = Read_Words();
    assert(massive);

    char* massive_pointer = massive;
    char** mas_test_words = Read_Test_Words();

    int max_len = 0;

    Fill_Hash_Table(mas_list, massive);
    for (int j = 0; j < 10; j++)
    {
        for (int i = 0; i < SIZE_TEST_FILE; i++)
        {
            int lenlen = (int)strlen(mas_test_words[i]);
            if (lenlen > max_len)
                max_len = lenlen;
            if (Find_Word(mas_list, mas_test_words[i]) == 0)
                counter++;
        }
    }

    printf("maxlen = %d\n", max_len);
    printf("-- words not found = %d --\n", counter);
    Mas_List_Destructor(mas_list);
    free(massive_pointer);

    return 0;
}