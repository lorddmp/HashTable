--------------------------------------------------------------------------------
Profile data file 'callgrind.out.505' (creator: callgrind-3.22.0)
--------------------------------------------------------------------------------
I1 cache: 
D1 cache: 
LL cache: 
Timerange: Basic block 0 - 245966128
Trigger: Program termination
Profiled target:  ./a.out (PID 505, part 1)
Events recorded:  Ir
Events shown:     Ir
Event sort order: Ir
Thresholds:       99
Include dirs:     
User annotated:   
Auto-annotation:  on

--------------------------------------------------------------------------------
Ir                     
--------------------------------------------------------------------------------
1,177,775,033 (100.0%)  PROGRAM TOTALS

--------------------------------------------------------------------------------
Ir                    file:function
--------------------------------------------------------------------------------
546,585,066 (46.41%)  0_optim/hash_funcs.cpp:Hash_crc32(char*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
 95,870,665 ( 8.14%)  ./malloc/./malloc/malloc.c:_int_malloc [/usr/lib/x86_64-linux-gnu/libc.so.6]
 77,602,826 ( 6.59%)  0_optim/hash_table.cpp:Read_Test_Words() [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
 76,056,862 ( 6.46%)  0_optim/hash_table.cpp:Fill_Hash_Table(str_spisok*, char*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
 69,249,648 ( 5.88%)  ./malloc/./malloc/malloc.c:calloc [/usr/lib/x86_64-linux-gnu/libc.so.6]
 63,012,263 ( 5.35%)  0_optim/hash_table.cpp:Find_Word(str_spisok*, char*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
 51,684,586 ( 4.39%)  ./string/../sysdeps/x86_64/multiarch/strcmp-avx2.S:__strcmp_avx2 [/usr/lib/x86_64-linux-gnu/libc.so.6]
 40,264,605 ( 3.42%)  ./malloc/./malloc/malloc.c:_int_free [/usr/lib/x86_64-linux-gnu/libc.so.6]
 28,213,318 ( 2.40%)  ./ctype/./ctype/ctype.c:isalpha [/usr/lib/x86_64-linux-gnu/libc.so.6]
 25,532,980 ( 2.17%)  0_optim/hash_table.cpp:Skip_non_letters(char**) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
 17,984,592 ( 1.53%)  0_optim/hash_table.cpp:Word_In_List(str_spisok, char*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
 17,970,968 ( 1.53%)  ./string/../sysdeps/x86_64/multiarch/strlen-avx2.S:__strlen_avx2 [/usr/lib/x86_64-linux-gnu/libc.so.6]
 15,530,742 ( 1.32%)  ./malloc/./malloc/malloc.c:free [/usr/lib/x86_64-linux-gnu/libc.so.6]
 11,090,808 ( 0.94%)  0_optim/main.cpp:main [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
  8,800,000 ( 0.75%)  0_optim/spisok.cpp:Init_Spisok(str_spisok*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
  8,060,948 ( 0.68%)  ???:0x00000000001091e0 [???]
  4,585,108 ( 0.39%)  ???:0x00000000001091b0 [???]
  2,565,740 ( 0.22%)  ???:0x0000000000109170 [???]
  1,849,538 ( 0.16%)  ???:0x00000000001091a0 [???]
  1,849,532 ( 0.16%)  ./malloc/./malloc/arena.c:calloc
  1,834,099 ( 0.16%)  0_optim/spisok.cpp:Data_Vstavka(str_spisok*, int, char*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]

--------------------------------------------------------------------------------
-- Auto-annotated source: 0_optim/hash_funcs.cpp
--------------------------------------------------------------------------------
Ir                   

-- line 38 ----------------------------------------
          .                   hash = (hash >> 63) | (hash << 1);
          .                   hash = hash ^ word[i];
          .               }
          .           
          .               return hash;
          .           }
          .           
          .           long long Hash_crc32(char* word)
  4,563,825 ( 0.39%)  {
    912,765 ( 0.08%)      unsigned crc = 0xFFFFFFFF;
    912,765 ( 0.08%)      unsigned palinom = 0xEDB88320;
  3,651,060 ( 0.31%)      int len = (int)strlen(word);
 14,611,866 ( 1.24%)  => ???:0x0000000000109170 (912,765x)
          .           
 32,971,660 ( 2.80%)      for (int i = 0; i < len; word++, i++)
          .               {
 22,726,268 ( 1.93%)          crc = crc ^ (unsigned)*word;
159,083,876 (13.51%)          for (int j = 0; j < 8; j++)
          .                   {
181,810,144 (15.44%)              if (crc & 1)
114,702,340 ( 9.74%)                  crc = (crc >> 1) ^ palinom;
          .                       else
 22,512,068 ( 1.91%)                  crc = crc >> 1;
          .                   }
          .               }
          .           
    912,765 ( 0.08%)      return crc;
  1,825,530 ( 0.15%)  }
          .           
--------------------------------------------------------------------------------
-- Auto-annotated source: 0_optim/main.cpp
--------------------------------------------------------------------------------
Ir                 

-- line 3 ----------------------------------------
        .           #include <assert.h>
        .           #include <string.h>
        .           
        .           #include "spisok.h"
        .           #include "hash_funcs.h"
        .           #include "hash_table.h"
        .           
        .           int main()
        4 ( 0.00%)  {
        2 ( 0.00%)      str_spisok* mas_list = Init_Hash_Table();
12,020,226 ( 1.02%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/0_optim/hash_table.cpp:Init_Hash_Table() (1x)
        2 ( 0.00%)      assert(mas_list);
        .           
        1 ( 0.00%)      int counter = 0;
        2 ( 0.00%)      char* massive = Read_Words();
    2,218 ( 0.00%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/0_optim/hash_table.cpp:Read_Words() (1x)
        2 ( 0.00%)      assert(massive);
        .           
        2 ( 0.00%)      char* massive_pointer = massive;
        2 ( 0.00%)      char** mas_test_words = Read_Test_Words();
159,778,404 (13.57%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/0_optim/hash_table.cpp:Read_Test_Words() (1x)
        .           
        1 ( 0.00%)      int max_len = 0;
        .           
        5 ( 0.00%)      Fill_Hash_Table(mas_list, massive);
542,167,325 (46.03%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/0_optim/hash_table.cpp:Fill_Hash_Table(str_spisok*, char*) (1x)
        .           
        3 ( 0.00%)      Stat_List_Size(mas_list);
2,370,189 ( 0.20%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/0_optim/spisok.cpp:Stat_List_Size(str_spisok*) (1x)
        .           
1,110,319 ( 0.09%)      for (int i = 0; i < SIZE_TEST_FILE; i++)
        .               {
3,330,945 ( 0.28%)          int lenlen = (int)strlen(mas_test_words[i]);
5,924,842 ( 0.50%)  => ???:0x0000000000109170 (370,105x)
1,110,315 ( 0.09%)          if (lenlen > max_len)
       26 ( 0.00%)              max_len = lenlen;
5,181,470 ( 0.44%)          if (Find_Word(mas_list, mas_test_words[i]) == 0)
437,511,924 (37.15%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/0_optim/hash_table.cpp:Find_Word(str_spisok*, char*) (370,105x)
  357,686 ( 0.03%)              counter++;
        .               }
        .           
        6 ( 0.00%)      printf("maxlen = %d\n", max_len);
    1,926 ( 0.00%)  => ???:0x0000000000109180 (1x)
        6 ( 0.00%)      printf("-- words not found = %d --\n", counter);
      931 ( 0.00%)  => ???:0x0000000000109180 (1x)
        3 ( 0.00%)      Mas_List_Destructor(mas_list);
6,766,255 ( 0.57%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/0_optim/spisok.cpp:Mas_List_Destructor(str_spisok*) (1x)
        3 ( 0.00%)      free(massive_pointer);
       67 ( 0.00%)  => ???:0x0000000000109130 (1x)
        .           
        1 ( 0.00%)      return 0;
        2 ( 0.00%)  }
--------------------------------------------------------------------------------
-- Auto-annotated source: 0_optim/spisok.cpp
--------------------------------------------------------------------------------
Ir                 

-- line 13 ----------------------------------------
        .               if (arg == NULL)                        \
        .               {                                       \
        .                   printf("CALLOC ERROR\n");           \
        .                   return 1;                           \
        .               }                                       \
        .           } while (0)
        .           
        .           int Init_Spisok(str_spisok* spisok)
   20,000 ( 0.00%)  {
   24,000 ( 0.00%)      spisok->data = (char**)calloc(SIZE_DATA, sizeof(char*));
1,095,133 ( 0.09%)  => ???:0x00000000001091a0 (4,000x)
   24,000 ( 0.00%)      spisok->next = (int*)calloc(SIZE_DATA, sizeof(int));
1,033,350 ( 0.09%)  => ???:0x00000000001091a0 (4,000x)
   24,000 ( 0.00%)      spisok->prev = (int*)calloc(SIZE_DATA, sizeof(int));
1,033,744 ( 0.09%)  => ???:0x00000000001091a0 (4,000x)
    8,000 ( 0.00%)      spisok->free = 1;
    8,000 ( 0.00%)      spisok->head = 0;                                           //индекс первого элемента списка в data
    8,000 ( 0.00%)      spisok->tail = 0;                                           //индекс последнего элемента списка в data
    8,000 ( 0.00%)      spisok->size = 0;                                           //количество элементов в списке (можно использовать как индикатор для tail или
        .                                                                           //чтобы после индекса больше чем элементов в data элемент ставился в конец)
   16,000 ( 0.00%)      IF_ERROR_CALLOC(spisok->data);
   16,000 ( 0.00%)      IF_ERROR_CALLOC(spisok->next);
   16,000 ( 0.00%)      IF_ERROR_CALLOC(spisok->prev);
        .           
1,192,000 ( 0.10%)      for (int i = 1; i < SIZE_DATA - 1; i++)
3,528,000 ( 0.30%)          spisok->next[i] = i + 1;
        .           
1,180,000 ( 0.10%)      for (int i = 2; i < SIZE_DATA - 1; i++)
2,716,000 ( 0.23%)          spisok->prev[i] = -1;
        .               
    4,000 ( 0.00%)      return 0;
    8,000 ( 0.00%)  }
        .           
        .           //-----------------------------------------------------------------------------
        .           
        .           int Data_Vstavka(str_spisok* spisok, int index, char* value)
  115,416 ( 0.01%)  {
  148,392 ( 0.01%)      if (spisok->prev[index] == -1)
        .               {
        .                   fprintf(stderr, "Illegal index in insert\n");
        .                   return 1;
        .               }
        .           
   32,976 ( 0.00%)      if (index == 0)
   19,655 ( 0.00%)          spisok->head = spisok->free;
   50,228 ( 0.00%)      else if (index == spisok->tail)
        .                   spisok->tail = spisok->free;
        .           
  148,392 ( 0.01%)      int next_free = spisok->next[spisok->free];
  148,392 ( 0.01%)      spisok->data[spisok->free] = value;
        .           
  346,248 ( 0.03%)      spisok->prev[spisok->free] = spisok->prev[spisok->next[index]];
  247,320 ( 0.02%)      spisok->prev[spisok->next[index]] = spisok->free;
        .           
  247,320 ( 0.02%)      spisok->next[spisok->free] = spisok->next[index];
  148,392 ( 0.01%)      spisok->next[index] = spisok->free;
        .           
   49,464 ( 0.00%)      spisok->free = next_free;
        .           
   82,440 ( 0.01%)      spisok->size++;
        .           
   16,488 ( 0.00%)      return 0;
   32,976 ( 0.00%)  }
        .           
        .           int Data_Delete(str_spisok* spisok, int del_index)
        .           {
        .               if (spisok->prev[del_index] == -1)
        .               {
        .                   fprintf(stderr, "Illegal index in insert\n");
        .                   return 1;
        .               }
-- line 80 ----------------------------------------
-- line 93 ----------------------------------------
        .           
        .               spisok->free = del_index;
        .               spisok->size--;
        .           
        .               return 0;
        .           }
        .           
        .           void List_Destructor(str_spisok spisok)
   12,000 ( 0.00%)  {
   12,000 ( 0.00%)      free(spisok.data);
2,524,705 ( 0.21%)  => ???:0x0000000000109130 (4,000x)
   12,000 ( 0.00%)      free(spisok.next);
  874,860 ( 0.07%)  => ???:0x0000000000109130 (4,000x)
   12,000 ( 0.00%)      free(spisok.prev);
  875,034 ( 0.07%)  => ???:0x0000000000109130 (4,000x)
   12,000 ( 0.00%)  }
        .           
        .           void Mas_List_Destructor(str_spisok* mas_list)
        6 ( 0.00%)  {
   12,004 ( 0.00%)      for (int i = 0; i < MASSIVE_SIZE; i++)
        .               {
  270,344 ( 0.02%)          for (int j = 1; j <= mas_list[i].size; j++)
  280,296 ( 0.02%)              free(mas_list[i].data[j]);
1,772,932 ( 0.15%)  => ???:0x0000000000109130 (16,488x)
        .           
   96,000 ( 0.01%)          List_Destructor(mas_list[i]);
4,334,599 ( 0.37%)  => 0_optim/spisok.cpp:List_Destructor(str_spisok) (4,000x)
        .               }
        .           
        3 ( 0.00%)      free (mas_list);
       67 ( 0.00%)  => ???:0x0000000000109130 (1x)
        4 ( 0.00%)  }
        .           
        .           void Stat_List_Size(str_spisok* mas_list)
        5 ( 0.00%)  {
        6 ( 0.00%)      FILE* fp = fopen(NAME_LIST_STAT, "w");
      469 ( 0.00%)  => ???:0x00000000001091f0 (1x)
        .           
   12,004 ( 0.00%)      for (int i = 0; i < MASSIVE_SIZE; i++)
   64,000 ( 0.01%)          fprintf(fp, "%d\n", mas_list[i].size);
2,293,016 ( 0.19%)  => ???:0x00000000001091c0 (4,000x)
        .           
        3 ( 0.00%)      fclose(fp);
      683 ( 0.00%)  => ???:0x0000000000109160 (1x)
        3 ( 0.00%)  }
--------------------------------------------------------------------------------
-- Auto-annotated source: 0_optim/hash_table.cpp
--------------------------------------------------------------------------------
Ir                  

-- line 5 ----------------------------------------
         .           #include <sys/stat.h>
         .           #include <ctype.h>
         .           #include <string.h>
         .           
         .           #define INPUT_FILE "words_source.txt"
         .           #define INPUT_TEST_FILE "words_tests.txt"
         .           
         .           str_spisok* Init_Hash_Table()
         4 ( 0.00%)  {
         4 ( 0.00%)      str_spisok* mas_list = (str_spisok*)calloc(MASSIVE_SIZE, sizeof(str_spisok));
     1,984 ( 0.00%)  => ???:0x00000000001091a0 (1x)
         .           
    12,004 ( 0.00%)      for (int i = 0; i < MASSIVE_SIZE; i++)
    44,000 ( 0.00%)          Init_Spisok(&mas_list[i]);
11,962,227 ( 1.02%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/0_optim/spisok.cpp:Init_Spisok(str_spisok*) (4,000x)
         .           
         1 ( 0.00%)      return mas_list;
         2 ( 0.00%)  }
         .           
         .           char* Read_Words()
         4 ( 0.00%)  {
         6 ( 0.00%)      FILE* fp = fopen(INPUT_FILE, "r");
       607 ( 0.00%)  => ???:0x00000000001091f0 (1x)
         .           
         2 ( 0.00%)      if (fp == NULL)
         .                   printf("Couldn't open words' source file\n");
         .           
         4 ( 0.00%)      int descriptor = fileno(fp);
         9 ( 0.00%)  => ???:0x00000000001091d0 (1x)
         .               struct stat haha;
         5 ( 0.00%)      fstat(descriptor, &haha);
         8 ( 0.00%)  => ???:0x0000000000109210 (1x)
         .           
         6 ( 0.00%)      char* massive = (char*)calloc((size_t)haha.st_size + 1, sizeof(char));
       322 ( 0.00%)  => ???:0x00000000001091a0 (1x)
         .           
         9 ( 0.00%)      fread(massive, sizeof(char), (size_t)haha.st_size, fp);
       658 ( 0.00%)  => ???:0x0000000000109150 (1x)
         .           
         3 ( 0.00%)      fclose(fp);
       572 ( 0.00%)  => ???:0x0000000000109160 (1x)
         .           
         1 ( 0.00%)      return massive;
         2 ( 0.00%)  }
         .           
         .           char** Read_Test_Words()
         5 ( 0.00%)  {
         6 ( 0.00%)      FILE* fp = fopen(INPUT_TEST_FILE, "r");
       465 ( 0.00%)  => ???:0x00000000001091f0 (1x)
         .           
         2 ( 0.00%)      if (fp == NULL)
         .                   printf("Couldn't open words' source file\n");
         .           
         4 ( 0.00%)      int descriptor = fileno(fp);
         9 ( 0.00%)  => ???:0x00000000001091d0 (1x)
         .               struct stat haha;
         5 ( 0.00%)      fstat(descriptor, &haha);
         8 ( 0.00%)  => ???:0x0000000000109210 (1x)
         .           
         6 ( 0.00%)      char* massive = (char*)calloc((size_t)haha.st_size + 1, sizeof(char));
       322 ( 0.00%)  => ???:0x00000000001091a0 (1x)
         2 ( 0.00%)      char* massive_pointer = massive;
         4 ( 0.00%)      char** mas_words = (char**)calloc(SIZE_TEST_FILE, sizeof(char*));
       322 ( 0.00%)  => ???:0x00000000001091a0 (1x)
         .           
         9 ( 0.00%)      fread(massive, sizeof(char), (size_t)haha.st_size, fp);
       873 ( 0.00%)  => ???:0x0000000000109150 (1x)
         .           
 1,480,424 ( 0.13%)      for (int i = 0; i < SIZE_TEST_FILE; i++, massive++)
         .               {
 3,330,945 ( 0.28%)          mas_words[i] = (char*)calloc(32, sizeof(char));
82,172,922 ( 6.98%)  => ???:0x00000000001091a0 (370,105x)
30,891,484 ( 2.62%)          for (int j = 0; (j < 20) && (*massive != '\n'); j++, massive++)
41,899,920 ( 3.56%)              mas_words[i][j] = *massive;
         .               }
         .           
         3 ( 0.00%)      fclose(fp);
       583 ( 0.00%)  => ???:0x0000000000109160 (1x)
         3 ( 0.00%)      free (massive_pointer);
        74 ( 0.00%)  => ???:0x0000000000109130 (1x)
         .           
         1 ( 0.00%)      return mas_words;
         3 ( 0.00%)  }
         .           
         .           void Skip_non_letters(char** massive)
 2,713,305 ( 0.23%)  {
17,415,457 ( 1.48%)      while (**massive != '\0' && !isalpha(**massive))
11,681,163 ( 0.99%)  => ???:0x00000000001091e0 (1,297,907x)
 3,776,235 ( 0.32%)          (*massive)++;
 1,627,983 ( 0.14%)  }
         .           
         .           bool Word_In_List(str_spisok spisok, char* word)
 2,713,300 ( 0.23%)  {
 3,735,744 ( 0.32%)      for (int i = 1; i <= spisok.size; i++)
         .               {
 9,381,396 ( 0.80%)          if (strcmp(spisok.data[i], word) == 0)
19,315,466 ( 1.64%)  => ???:0x00000000001091b0 (781,783x)
 1,052,344 ( 0.09%)              return 1;
         .               }
         .           
    16,488 ( 0.00%)      return 0;
 1,085,320 ( 0.09%)  }
         .           
         .           int Find_Word(str_spisok* mas_list, char* word)
 2,220,630 ( 0.19%)  {
 6,661,890 ( 0.57%)      long long index_mas = Hash_crc32(word) % MASSIVE_SIZE;
337,545,433 (28.66%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/0_optim/hash_funcs.cpp:Hash_crc32(char*) (370,105x)
         .           
22,791,589 ( 1.94%)      for (int i = 1; i <= mas_list[index_mas].size; i++)
30,215,420 ( 2.57%)          if (strcmp(mas_list[index_mas].data[i], word) == 0)
36,954,228 ( 3.14%)  => ???:0x00000000001091b0 (1,510,771x)
    24,838 ( 0.00%)              return i;
         .           
   357,686 ( 0.03%)      return 0;
   740,210 ( 0.06%)  }
         .           
         .           void Fill_Hash_Table(str_spisok* mas_list, char* massive)
         7 ( 0.00%)  {
         3 ( 0.00%)      Skip_non_letters(&massive);
        31 ( 0.00%)  => 0_optim/hash_table.cpp:Skip_non_letters(char**) (1x)
 2,170,645 ( 0.18%)      while (*massive != 0)
         .               {
 2,170,640 ( 0.18%)          char* word = (char*)calloc(32, sizeof(char));
85,743,462 ( 7.28%)  => ???:0x00000000001091a0 (542,660x)
28,972,917 ( 2.46%)          for (int i = 0; isalpha(*massive); i++, massive++)
24,593,103 ( 2.09%)  => ???:0x00000000001091e0 (2,732,567x)
15,329,349 ( 1.30%)              word[i] = *massive;
         .           
 1,627,980 ( 0.14%)          Skip_non_letters(&massive);
37,214,112 ( 3.16%)  => 0_optim/hash_table.cpp:Skip_non_letters(char**) (542,660x)
         .           
 2,170,640 ( 0.18%)          long long index = Hash_crc32(word);
223,651,499 (18.99%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/0_optim/hash_funcs.cpp:Hash_crc32(char*) (542,660x)
         .           
 6,511,920 ( 0.55%)          index %= MASSIVE_SIZE;
         .           
14,651,820 ( 1.24%)          if (Word_In_List(mas_list[index], word))
37,300,058 ( 3.17%)  => 0_optim/hash_table.cpp:Word_In_List(str_spisok, char*) (542,660x)
         .                   {
 1,578,516 ( 0.13%)              free(word);
55,774,099 ( 4.74%)  => ???:0x0000000000109130 (526,172x)
   526,172 ( 0.04%)              continue;
         .                   }
         .           
   346,248 ( 0.03%)          Data_Vstavka(&mas_list[index], mas_list[index].size, word);
 1,834,099 ( 0.16%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/0_optim/spisok.cpp:Data_Vstavka(str_spisok*, int, char*) (16,488x)
         .               }
         5 ( 0.00%)  }
--------------------------------------------------------------------------------
The following files chosen for auto-annotation could not be found:
--------------------------------------------------------------------------------
  ./ctype/./ctype/ctype.c
  ./malloc/./malloc/arena.c
  ./malloc/./malloc/malloc.c
  ./string/../sysdeps/x86_64/multiarch/strcmp-avx2.S
  ./string/../sysdeps/x86_64/multiarch/strlen-avx2.S

--------------------------------------------------------------------------------
Ir                   
--------------------------------------------------------------------------------
829,350,231 (70.42%)  events annotated

