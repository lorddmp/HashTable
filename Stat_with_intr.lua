--------------------------------------------------------------------------------
Profile data file 'callgrind.out.4586' (creator: callgrind-3.22.0)
--------------------------------------------------------------------------------
I1 cache: 
D1 cache: 
LL cache: 
Timerange: Basic block 0 - 435940822
Trigger: Program termination
Profiled target:  ./a.out (PID 4586, part 1)
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
4,232,301,411 (100.0%)  PROGRAM TOTALS

--------------------------------------------------------------------------------
Ir                      file:function
--------------------------------------------------------------------------------
3,520,000,000 (83.17%)  spisok.cpp:Init_Spisok(str_spisok*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
   96,051,418 ( 2.27%)  ./malloc/./malloc/malloc.c:_int_malloc [/usr/lib/x86_64-linux-gnu/libc.so.6]
   84,608,574 ( 2.00%)  hash_funcs.cpp:Hash_crc32(char*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
   77,602,826 ( 1.83%)  hash_table.cpp:Read_Test_Words() [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
   76,056,862 ( 1.80%)  hash_table.cpp:Fill_Hash_Table(str_spisok*, char*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
   66,331,292 ( 1.57%)  ./malloc/./malloc/malloc.c:calloc [/usr/lib/x86_64-linux-gnu/libc.so.6]
   63,009,063 ( 1.49%)  hash_table.cpp:Find_Word(str_spisok*, char*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
   52,799,523 ( 1.25%)  ./string/../sysdeps/x86_64/multiarch/strcmp-avx2.S:__strcmp_avx2 [/usr/lib/x86_64-linux-gnu/libc.so.6]
   39,647,194 ( 0.94%)  ./malloc/./malloc/malloc.c:_int_free [/usr/lib/x86_64-linux-gnu/libc.so.6]
   28,213,318 ( 0.67%)  ./ctype/./ctype/ctype.c:isalpha [/usr/lib/x86_64-linux-gnu/libc.so.6]
   25,532,980 ( 0.60%)  hash_table.cpp:Skip_non_letters(char**) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
   22,726,268 ( 0.54%)  /usr/lib/gcc/x86_64-linux-gnu/13/include/smmintrin.h:Hash_crc32(char*)
   17,760,464 ( 0.42%)  hash_table.cpp:Word_In_List(str_spisok, char*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
   15,542,686 ( 0.37%)  ./malloc/./malloc/malloc.c:free [/usr/lib/x86_64-linux-gnu/libc.so.6]
   12,794,476 ( 0.30%)  ./string/../sysdeps/x86_64/multiarch/strlen-avx2.S:__strlen_avx2 [/usr/lib/x86_64-linux-gnu/libc.so.6]

--------------------------------------------------------------------------------
-- Auto-annotated source: /usr/lib/gcc/x86_64-linux-gnu/13/include/smmintrin.h
--------------------------------------------------------------------------------
Ir                  

-- line 816 ----------------------------------------
         .           #pragma GCC target("crc32")
         .           #define __DISABLE_CRC32__
         .           #endif /* __CRC32__ */
         .           
         .           /* Accumulate CRC32 (polynomial 0x11EDC6F41) value.  */
         .           extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
         .           _mm_crc32_u8 (unsigned int __C, unsigned char __V)
         .           {
22,726,268 ( 0.54%)    return __builtin_ia32_crc32qi (__C, __V);
         .           }
         .           
         .           extern __inline unsigned int __attribute__((__gnu_inline__, __always_inline__, __artificial__))
         .           _mm_crc32_u16 (unsigned int __C, unsigned short __V)
         .           {
         .             return __builtin_ia32_crc32hi (__C, __V);
         .           }
         .           
-- line 832 ----------------------------------------

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
 4,563,825 ( 0.11%)  {
   912,765 ( 0.02%)      unsigned crc = 0xFFFFFFFF;
 3,651,060 ( 0.09%)      int len = (int)strlen(word);
14,620,006 ( 0.35%)  => ???:0x0000000000109170 (912,765x)
         .           
32,971,660 ( 0.78%)      for (int i = 0; i < len; word++, i++)
39,770,969 ( 0.94%)          crc = _mm_crc32_u8(crc, (unsigned char)*word);
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
  479,992,000 (11.34%)      for (int i = 1; i < SIZE_DATA - 1; i++)
1,439,928,000 (34.02%)          spisok->next[i] = i + 1;
            .           
  479,980,000 (11.34%)      for (int i = 2; i < SIZE_DATA - 1; i++)
1,119,916,000 (26.46%)          spisok->prev[i] = -1;
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
       19,650 ( 0.00%)          spisok->head = spisok->free;
       50,232 ( 0.00%)      else if (index == spisok->tail)
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
3,523,808,000 (83.26%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/spisok.cpp:Init_Spisok(str_spisok*) (4,000x)
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
 3,330,945 ( 0.08%)          mas_words[i] = (char*)calloc(20, sizeof(char));
81,063,184 ( 1.92%)  => ???:0x00000000001091a0 (370,105x)
30,891,484 ( 0.73%)          for (int j = 0; (j < 20) && (*massive != '\n'); j++, massive++)
41,899,920 ( 0.99%)              mas_words[i][j] = *massive;
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
17,415,457 ( 0.41%)      while (**massive != '\0' && !isalpha(**massive))
11,681,163 ( 0.28%)  => ???:0x00000000001091e0 (1,297,907x)
 3,776,235 ( 0.09%)          (*massive)++;
 1,627,983 ( 0.04%)  }
         .           
         .           bool Word_In_List(str_spisok spisok, char* word)
 2,713,300 ( 0.06%)  {
 3,679,712 ( 0.09%)      for (int i = 1; i <= spisok.size; i++)
         .               {
 9,213,300 ( 0.22%)          if (strcmp(spisok.data[i], word) == 0)
19,321,940 ( 0.46%)  => ???:0x00000000001091b0 (767,775x)
 1,052,344 ( 0.02%)              return 1;
         .               }
         .           
    16,488 ( 0.00%)      return 0;
 1,085,320 ( 0.03%)  }
         .           
         .           int Find_Word(str_spisok* mas_list, char* word)
 2,220,630 ( 0.05%)  {
 6,661,890 ( 0.16%)      long long index_mas = Hash_crc32(word) % MASSIVE_SIZE;
68,456,506 ( 1.62%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/hash_funcs.cpp:Hash_crc32(char*) (370,105x)
         .           
22,790,389 ( 0.54%)      for (int i = 1; i <= mas_list[index_mas].size; i++)
30,213,420 ( 0.71%)          if (strcmp(mas_list[index_mas].data[i], word) == 0)
38,034,475 ( 0.90%)  => ???:0x00000000001091b0 (1,510,671x)
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
84,115,057 ( 1.99%)  => ???:0x00000000001091a0 (542,660x)
28,972,917 ( 0.68%)          for (int i = 0; isalpha(*massive); i++, massive++)
24,593,103 ( 0.58%)  => ???:0x00000000001091e0 (2,732,567x)
15,329,349 ( 0.36%)              word[i] = *massive;
         .           
 1,627,980 ( 0.04%)          Skip_non_letters(&massive);
37,214,112 ( 0.88%)  => hash_table.cpp:Skip_non_letters(char**) (542,660x)
         .           
 2,170,640 ( 0.05%)          long long index = Hash_crc32(word);
53,498,342 ( 1.26%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/hash_funcs.cpp:Hash_crc32(char*) (542,660x)
         .           
 6,511,920 ( 0.15%)          index %= MASSIVE_SIZE;
         .           
14,651,820 ( 0.35%)          if (Word_In_List(mas_list[index], word))
37,082,404 ( 0.88%)  => hash_table.cpp:Word_In_List(str_spisok, char*) (542,660x)
         .                   {
 1,578,516 ( 0.04%)              free(word);
55,774,099 ( 1.32%)  => ???:0x0000000000109130 (526,172x)
   526,172 ( 0.01%)              continue;
         .                   }
         .           
   346,248 ( 0.01%)          Data_Vstavka(&mas_list[index], mas_list[index].size, word);
 1,834,098 ( 0.04%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/spisok.cpp:Data_Vstavka(str_spisok*, int, char*) (16,488x)
         .               }
         5 ( 0.00%)  }
--------------------------------------------------------------------------------
The following files chosen for auto-annotation could not be found:
--------------------------------------------------------------------------------
  ./ctype/./ctype/ctype.c
  ./malloc/./malloc/malloc.c
  ./string/../sysdeps/x86_64/multiarch/strcmp-avx2.S
  ./string/../sysdeps/x86_64/multiarch/strlen-avx2.S

--------------------------------------------------------------------------------
Ir                     
--------------------------------------------------------------------------------
3,889,905,849 (91.91%)  events annotated

