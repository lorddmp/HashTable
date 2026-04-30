#ifndef HASH_TABLE
#define HASH_TABLE

#include "spisok.h"

#define SIZE_TEST_FILE 370105

str_spisok* Init_Hash_Table();

char* Read_Words(); 

char** Read_Test_Words();

void Skip_non_letters(char** massive);

bool Word_In_List(str_spisok spisok, char* word);

void Fill_Hash_Table(str_spisok* mas_list, char* massive);

int Find_Word(str_spisok* mas_list, char* word);

#endif