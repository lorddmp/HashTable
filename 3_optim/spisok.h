#ifndef SPISOK
#define SPISOK

#include <stdio.h>
#include <stdlib.h>

#define SIZE_DATA 100
#define MASSIVE_SIZE 4000

struct str_spisok{
    char** data;
    int* next;
    int* prev;
    int head;
    int tail;
    int free;
    int size;
};

int Init_Spisok(str_spisok* spisok);

int Data_Vstavka(str_spisok* spisok, int index, char* value);

int Data_Delete(str_spisok* spisok, int index);

int List_Vstavka(str_spisok* spisok, int index, char* value);

int List_Delete(str_spisok* spisok, int index);

void Write_Spisok(str_spisok spisok);

void Stat_List_Size(str_spisok* mas_list);

void List_Destructor(str_spisok spisok);

void Mas_List_Destructor(str_spisok* mas_list);

#endif