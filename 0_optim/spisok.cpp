#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "spisok.h"

#define NAME_LIST_STAT "list_sizes6.txt"

int Find_Index_In_Next(str_spisok* spisok, int counter, int index_next);

#define IF_ERROR_CALLOC(arg)                \
do                                          \
{                                           \
    if (arg == NULL)                        \
    {                                       \
        printf("CALLOC ERROR\n");           \
        return 1;                           \
    }                                       \
} while (0)

int Init_Spisok(str_spisok* spisok)
{
    spisok->data = (char**)calloc(SIZE_DATA, sizeof(char*));
    spisok->next = (int*)calloc(SIZE_DATA, sizeof(int));
    spisok->prev = (int*)calloc(SIZE_DATA, sizeof(int));
    spisok->free = 1;
    spisok->head = 0;                                           //индекс первого элемента списка в data
    spisok->tail = 0;                                           //индекс последнего элемента списка в data
    spisok->size = 0;                                           //количество элементов в списке (можно использовать как индикатор для tail или
                                                                //чтобы после индекса больше чем элементов в data элемент ставился в конец)
    IF_ERROR_CALLOC(spisok->data);
    IF_ERROR_CALLOC(spisok->next);
    IF_ERROR_CALLOC(spisok->prev);

    for (int i = 1; i < SIZE_DATA - 1; i++)
        spisok->next[i] = i + 1;

    for (int i = 2; i < SIZE_DATA - 1; i++)
        spisok->prev[i] = -1;
    
    return 0;
}

//-----------------------------------------------------------------------------

int Data_Vstavka(str_spisok* spisok, int index, char* value)
{
    if (spisok->prev[index] == -1)
    {
        fprintf(stderr, "Illegal index in insert\n");
        return 1;
    }

    if (index == 0)
        spisok->head = spisok->free;
    else if (index == spisok->tail)
        spisok->tail = spisok->free;

    int next_free = spisok->next[spisok->free];
    spisok->data[spisok->free] = value;

    spisok->prev[spisok->free] = spisok->prev[spisok->next[index]];
    spisok->prev[spisok->next[index]] = spisok->free;

    spisok->next[spisok->free] = spisok->next[index];
    spisok->next[index] = spisok->free;

    spisok->free = next_free;

    spisok->size++;

    return 0;
}

int Data_Delete(str_spisok* spisok, int del_index)
{
    if (spisok->prev[del_index] == -1)
    {
        fprintf(stderr, "Illegal index in insert\n");
        return 1;
    }

    if (del_index == spisok->head)
        spisok->head = spisok->next[del_index];
    else if (del_index == spisok->tail)
        spisok->tail = spisok->prev[del_index];

    spisok->data[del_index] = 0;

    spisok->next[spisok->prev[del_index]] = spisok->next[del_index];
    spisok->prev[spisok->next[del_index]] = spisok->prev[del_index];
    spisok->prev[del_index] = -1;
    spisok->next[del_index] = spisok->free;

    spisok->free = del_index;
    spisok->size--;

    return 0;
}

void List_Destructor(str_spisok spisok)
{
    free(spisok.data);
    free(spisok.next);
    free(spisok.prev);
}

void Mas_List_Destructor(str_spisok* mas_list)
{
    for (int i = 0; i < MASSIVE_SIZE; i++)
    {
        for (int j = 1; j <= mas_list[i].size; j++)
            free(mas_list[i].data[j]);

        List_Destructor(mas_list[i]);
    }

    free (mas_list);
}

void Stat_List_Size(str_spisok* mas_list)
{
    FILE* fp = fopen(NAME_LIST_STAT, "w");

    for (int i = 0; i < MASSIVE_SIZE; i++)
        fprintf(fp, "%d\n", mas_list[i].size);

    fclose(fp);
}