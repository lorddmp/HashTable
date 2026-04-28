--------------------------------------------------------------------------------
Profile data file 'callgrind.out.4553' (creator: callgrind-3.22.0)
--------------------------------------------------------------------------------
I1 cache: 
D1 cache: 
LL cache: 
Timerange: Basic block 0 - 561249187
Trigger: Program termination
Profiled target:  ./a.out (PID 4553, part 1)
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
4,672,084,962 (100.0%)  PROGRAM TOTALS

--------------------------------------------------------------------------------
Ir                      file:function
--------------------------------------------------------------------------------
3,520,000,000 (75.34%)  spisok.cpp:Init_Spisok(str_spisok*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
  546,585,066 (11.70%)  hash_funcs.cpp:Hash_crc32(char*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
   96,051,418 ( 2.06%)  ./malloc/./malloc/malloc.c:_int_malloc [/usr/lib/x86_64-linux-gnu/libc.so.6]
   77,602,826 ( 1.66%)  hash_table.cpp:Read_Test_Words() [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
   76,056,862 ( 1.63%)  hash_table.cpp:Fill_Hash_Table(str_spisok*, char*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
   66,331,292 ( 1.42%)  ./malloc/./malloc/malloc.c:calloc [/usr/lib/x86_64-linux-gnu/libc.so.6]
   63,012,263 ( 1.35%)  hash_table.cpp:Find_Word(str_spisok*, char*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
   53,077,305 ( 1.14%)  ./string/../sysdeps/x86_64/multiarch/strcmp-avx2.S:__strcmp_avx2 [/usr/lib/x86_64-linux-gnu/libc.so.6]
   39,647,194 ( 0.85%)  ./malloc/./malloc/malloc.c:_int_free [/usr/lib/x86_64-linux-gnu/libc.so.6]
   28,213,318 ( 0.60%)  ./ctype/./ctype/ctype.c:isalpha [/usr/lib/x86_64-linux-gnu/libc.so.6]
   25,532,980 ( 0.55%)  hash_table.cpp:Skip_non_letters(char**) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
   17,984,592 ( 0.38%)  hash_table.cpp:Word_In_List(str_spisok, char*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
   15,542,686 ( 0.33%)  ./malloc/./malloc/malloc.c:free [/usr/lib/x86_64-linux-gnu/libc.so.6]

--------------------------------------------------------------------------------
-- Auto-annotated source: hash_funcs.cpp
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
  4,563,825 ( 0.10%)  {
    912,765 ( 0.02%)      unsigned crc = 0xFFFFFFFF;
    912,765 ( 0.02%)      unsigned palinom = 0xEDB88320;
  3,651,060 ( 0.08%)      int len = (int)strlen(word);
 14,620,006 ( 0.31%)  => ???:0x0000000000109170 (912,765x)
          .           
 32,971,660 ( 0.71%)      for (int i = 0; i < len; word++, i++)
          .               {
 22,726,268 ( 0.49%)          crc = crc ^ (unsigned)*word;
159,083,876 ( 3.40%)          for (int j = 0; j < 8; j++)
          .                   {
181,810,144 ( 3.89%)              if (crc & 1)
114,702,340 ( 2.46%)                  crc = (crc >> 1) ^ palinom;
          .                       else
 22,512,068 ( 0.48%)                  crc = crc >> 1;
          .                   }
          .               }
          .           
    912,765 ( 0.02%)      return crc;
  1,825,530 ( 0.04%)  }
--------------------------------------------------------------------------------
-- Auto-annotated source: spisok.cpp
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
    1,288,000 ( 0.03%)  => ???:0x00000000001091a0 (4,000x)
       24,000 ( 0.00%)      spisok->next = (int*)calloc(SIZE_DATA, sizeof(int));
    1,260,000 ( 0.03%)  => ???:0x00000000001091a0 (4,000x)
       24,000 ( 0.00%)      spisok->prev = (int*)calloc(SIZE_DATA, sizeof(int));
    1,260,000 ( 0.03%)  => ???:0x00000000001091a0 (4,000x)
        8,000 ( 0.00%)      spisok->free = 1;
        8,000 ( 0.00%)      spisok->head = 0;                                           //индекс первого элемента списка в data
        8,000 ( 0.00%)      spisok->tail = 0;                                           //индекс последнего элемента списка в data
        8,000 ( 0.00%)      spisok->size = 0;                                           //количество элементов в списке (можно использовать как индикатор для tail или
            .                                                                           //чтобы после индекса больше чем элементов в data элемент ставился в конец)
       16,000 ( 0.00%)      IF_ERROR_CALLOC(spisok->data);
       16,000 ( 0.00%)      IF_ERROR_CALLOC(spisok->next);
       16,000 ( 0.00%)      IF_ERROR_CALLOC(spisok->prev);
            .           
  479,992,000 (10.27%)      for (int i = 1; i < SIZE_DATA - 1; i++)
1,439,928,000 (30.82%)          spisok->next[i] = i + 1;
            .           
  479,980,000 (10.27%)      for (int i = 2; i < SIZE_DATA - 1; i++)
1,119,916,000 (23.97%)          spisok->prev[i] = -1;
            .               
        4,000 ( 0.00%)      return 0;
        8,000 ( 0.00%)  }
            .           
            .           //-----------------------------------------------------------------------------
            .           
            .           int Data_Vstavka(str_spisok* spisok, int index, char* value)
      115,416 ( 0.00%)  {
      148,392 ( 0.00%)      if (spisok->prev[index] == -1)
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
      148,392 ( 0.00%)      int next_free = spisok->next[spisok->free];
      148,392 ( 0.00%)      spisok->data[spisok->free] = value;
            .           
      346,248 ( 0.01%)      spisok->prev[spisok->free] = spisok->prev[spisok->next[index]];
      247,320 ( 0.01%)      spisok->prev[spisok->next[index]] = spisok->free;
            .           
      247,320 ( 0.01%)      spisok->next[spisok->free] = spisok->next[index];
      148,392 ( 0.00%)      spisok->next[index] = spisok->free;
            .           
       49,464 ( 0.00%)      spisok->free = next_free;
            .           
       82,440 ( 0.00%)      spisok->size++;
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
      268,000 ( 0.01%)  => ???:0x0000000000109130 (4,000x)
       12,000 ( 0.00%)      free(spisok.next);
      268,000 ( 0.01%)  => ???:0x0000000000109130 (4,000x)
       12,000 ( 0.00%)      free(spisok.prev);
      268,000 ( 0.01%)  => ???:0x0000000000109130 (4,000x)
       12,000 ( 0.00%)  }
            .           
            .           void Mas_List_Destructor(str_spisok* mas_list)
            6 ( 0.00%)  {
       12,004 ( 0.00%)      for (int i = 0; i < MASSIVE_SIZE; i++)
            .               {
      270,344 ( 0.01%)          for (int j = 1; j <= mas_list[i].size; j++)
      280,296 ( 0.01%)              free(mas_list[i].data[j]);
    1,780,681 ( 0.04%)  => ???:0x0000000000109130 (16,488x)
            .           
       96,000 ( 0.00%)          List_Destructor(mas_list[i]);
      864,000 ( 0.02%)  => spisok.cpp:List_Destructor(str_spisok) (4,000x)
            .               }
            .           
            3 ( 0.00%)      free (mas_list);
           67 ( 0.00%)  => ???:0x0000000000109130 (1x)
            4 ( 0.00%)  }
            .           
            .           void Stat_List_Size(str_spisok* mas_list)
            .           {
            .               FILE* fp = fopen(NAME_LIST_STAT, "w");
            .           
            .               for (int i = 0; i < MASSIVE_SIZE; i++)
            .                   fprintf(fp, "%d\n", mas_list[i].size);
            .           
-- line 126 ----------------------------------------

--------------------------------------------------------------------------------
-- Auto-annotated source: hash_table.cpp
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
3,523,808,000 (75.42%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/spisok.cpp:Init_Spisok(str_spisok*) (4,000x)
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
       615 ( 0.00%)  => ???:0x0000000000109160 (1x)
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
 1,480,424 ( 0.03%)      for (int i = 0; i < SIZE_TEST_FILE; i++, massive++)
         .               {
 3,330,945 ( 0.07%)          mas_words[i] = (char*)calloc(20, sizeof(char));
81,063,184 ( 1.74%)  => ???:0x00000000001091a0 (370,105x)
30,891,484 ( 0.66%)          for (int j = 0; (j < 20) && (*massive != '\n'); j++, massive++)
41,899,920 ( 0.90%)              mas_words[i][j] = *massive;
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
 2,713,305 ( 0.06%)  {
17,415,457 ( 0.37%)      while (**massive != '\0' && !isalpha(**massive))
11,681,163 ( 0.25%)  => ???:0x00000000001091e0 (1,297,907x)
 3,776,235 ( 0.08%)          (*massive)++;
 1,627,983 ( 0.03%)  }
         .           
         .           bool Word_In_List(str_spisok spisok, char* word)
 2,713,300 ( 0.06%)  {
 3,735,744 ( 0.08%)      for (int i = 1; i <= spisok.size; i++)
         .               {
 9,381,396 ( 0.20%)          if (strcmp(spisok.data[i], word) == 0)
19,616,430 ( 0.42%)  => ???:0x00000000001091b0 (781,783x)
 1,052,344 ( 0.02%)              return 1;
         .               }
         .           
    16,488 ( 0.00%)      return 0;
 1,085,320 ( 0.02%)  }
         .           
         .           int Find_Word(str_spisok* mas_list, char* word)
 2,220,630 ( 0.05%)  {
 6,661,890 ( 0.14%)      long long index_mas = Hash_crc32(word) % MASSIVE_SIZE;
337,548,647 ( 7.22%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/hash_funcs.cpp:Hash_crc32(char*) (370,105x)
         .           
22,791,589 ( 0.49%)      for (int i = 1; i <= mas_list[index_mas].size; i++)
30,215,420 ( 0.65%)          if (strcmp(mas_list[index_mas].data[i], word) == 0)
38,045,983 ( 0.81%)  => ???:0x00000000001091b0 (1,510,771x)
    24,838 ( 0.00%)              return i;
         .           
   357,686 ( 0.01%)      return 0;
   740,210 ( 0.02%)  }
         .           
         .           void Fill_Hash_Table(str_spisok* mas_list, char* massive)
         7 ( 0.00%)  {
         3 ( 0.00%)      Skip_non_letters(&massive);
        31 ( 0.00%)  => hash_table.cpp:Skip_non_letters(char**) (1x)
 2,170,645 ( 0.05%)      while (*massive != 0)
         .               {
 2,170,640 ( 0.05%)          char* word = (char*)calloc(20, sizeof(char));
84,115,057 ( 1.80%)  => ???:0x00000000001091a0 (542,660x)
28,972,917 ( 0.62%)          for (int i = 0; isalpha(*massive); i++, massive++)
24,593,103 ( 0.53%)  => ???:0x00000000001091e0 (2,732,567x)
15,329,349 ( 0.33%)              word[i] = *massive;
         .           
 1,627,980 ( 0.03%)          Skip_non_letters(&massive);
37,214,112 ( 0.80%)  => hash_table.cpp:Skip_non_letters(char**) (542,660x)
         .           
 2,170,640 ( 0.05%)          long long index = Hash_crc32(word);
223,656,425 ( 4.79%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/hash_funcs.cpp:Hash_crc32(char*) (542,660x)
         .           
 6,511,920 ( 0.14%)          index %= MASSIVE_SIZE;
         .           
14,651,820 ( 0.31%)          if (Word_In_List(mas_list[index], word))
37,601,022 ( 0.80%)  => hash_table.cpp:Word_In_List(str_spisok, char*) (542,660x)
         .                   {
 1,578,516 ( 0.03%)              free(word);
55,774,099 ( 1.19%)  => ???:0x0000000000109130 (526,172x)
   526,172 ( 0.01%)              continue;
         .                   }
         .           
   346,248 ( 0.01%)          Data_Vstavka(&mas_list[index], mas_list[index].size, word);
 1,834,099 ( 0.04%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/spisok.cpp:Data_Vstavka(str_spisok*, int, char*) (16,488x)
         .               }
         5 ( 0.00%)  }
--------------------------------------------------------------------------------
The following files chosen for auto-annotation could not be found:
--------------------------------------------------------------------------------
  ./ctype/./ctype/ctype.c
  ./malloc/./malloc/malloc.c
  ./string/../sysdeps/x86_64/multiarch/strcmp-avx2.S

--------------------------------------------------------------------------------
Ir                     
--------------------------------------------------------------------------------
4,329,383,402 (92.66%)  events annotated

