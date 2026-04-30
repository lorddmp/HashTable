--------------------------------------------------------------------------------
Profile data file 'callgrind.out.524' (creator: callgrind-3.22.0)
--------------------------------------------------------------------------------
I1 cache: 
D1 cache: 
LL cache: 
Timerange: Basic block 0 - 140713778
Trigger: Program termination
Profiled target:  ./a.out (PID 524, part 1)
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
794,461,373 (100.0%)  PROGRAM TOTALS

--------------------------------------------------------------------------------
Ir                   file:function
--------------------------------------------------------------------------------
95,870,665 (12.07%)  ./malloc/./malloc/malloc.c:_int_malloc [/usr/lib/x86_64-linux-gnu/libc.so.6]
77,602,826 ( 9.77%)  1_optim/hash_table.cpp:Read_Test_Words() [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
76,056,862 ( 9.57%)  1_optim/hash_table.cpp:Fill_Hash_Table(str_spisok*, char*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
74,921,191 ( 9.43%)  1_optim/hash_table.cpp:Find_Word(str_spisok*, char*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
72,965,619 ( 9.18%)  ./string/../sysdeps/x86_64/multiarch/strcmp-avx2.S:__strcmp_avx2 [/usr/lib/x86_64-linux-gnu/libc.so.6]
69,249,648 ( 8.72%)  ./malloc/./malloc/malloc.c:calloc [/usr/lib/x86_64-linux-gnu/libc.so.6]
60,965,402 ( 7.67%)  ./string/../sysdeps/x86_64/multiarch/strlen-avx2.S:__strlen_avx2 [/usr/lib/x86_64-linux-gnu/libc.so.6]
57,544,970 ( 7.24%)  1_optim/hash_funcs.cpp:Hash_crc32(char*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
40,265,567 ( 5.07%)  ./malloc/./malloc/malloc.c:_int_free [/usr/lib/x86_64-linux-gnu/libc.so.6]
28,213,318 ( 3.55%)  ./ctype/./ctype/ctype.c:isalpha [/usr/lib/x86_64-linux-gnu/libc.so.6]
27,260,080 ( 3.43%)  1_optim/hash_table.cpp:Word_In_List(str_spisok, char*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
25,532,980 ( 3.21%)  1_optim/hash_table.cpp:Skip_non_letters(char**) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
15,530,742 ( 1.95%)  ./malloc/./malloc/malloc.c:free [/usr/lib/x86_64-linux-gnu/libc.so.6]
12,268,780 ( 1.54%)  /usr/lib/gcc/x86_64-linux-gnu/13/include/smmintrin.h:Hash_crc32(char*)
11,090,808 ( 1.40%)  1_optim/main.cpp:main [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
 8,800,000 ( 1.11%)  1_optim/spisok.cpp:Init_Spisok(str_spisok*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
 8,700,130 ( 1.10%)  ???:0x0000000000109170 [???]
 8,060,948 ( 1.01%)  ???:0x00000000001091e0 [???]
 6,488,852 ( 0.82%)  ???:0x00000000001091b0 [???]
 1,849,538 ( 0.23%)  ???:0x00000000001091a0 [???]
 1,849,532 ( 0.23%)  ./malloc/./malloc/arena.c:calloc
 1,833,611 ( 0.23%)  1_optim/spisok.cpp:Data_Vstavka(str_spisok*, int, char*) [/mnt/c/Users/Дима/Desktop/C/HashTable/a.out]
 1,663,998 ( 0.21%)  ./malloc/./malloc/arena.c:free
 1,594,436 ( 0.20%)  ./malloc/./malloc/malloc.c:alloc_perturb [/usr/lib/x86_64-linux-gnu/libc.so.6]
 1,250,683 ( 0.16%)  ./malloc/./malloc/malloc.c:malloc_consolidate [/usr/lib/x86_64-linux-gnu/libc.so.6]

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
12,268,780 ( 1.54%)    return __builtin_ia32_crc32qi (__C, __V);
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
-- Auto-annotated source: 1_optim/main.cpp
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
12,020,226 ( 1.51%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/1_optim/hash_table.cpp:Init_Hash_Table() (1x)
        2 ( 0.00%)      assert(mas_list);
        .           
        1 ( 0.00%)      int counter = 0;
        2 ( 0.00%)      char* massive = Read_Words();
    2,218 ( 0.00%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/1_optim/hash_table.cpp:Read_Words() (1x)
        2 ( 0.00%)      assert(massive);
        .           
        2 ( 0.00%)      char* massive_pointer = massive;
        2 ( 0.00%)      char** mas_test_words = Read_Test_Words();
159,778,404 (20.11%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/1_optim/hash_table.cpp:Read_Test_Words() (1x)
        .           
        1 ( 0.00%)      int max_len = 0;
        .           
        5 ( 0.00%)      Fill_Hash_Table(mas_list, massive);
401,056,540 (50.48%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/1_optim/hash_table.cpp:Fill_Hash_Table(str_spisok*, char*) (1x)
        .           
        3 ( 0.00%)      Stat_List_Size(mas_list);
2,372,756 ( 0.30%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/1_optim/spisok.cpp:Stat_List_Size(str_spisok*) (1x)
        .           
1,110,319 ( 0.14%)      for (int i = 0; i < SIZE_TEST_FILE; i++)
        .               {
3,330,945 ( 0.42%)          int lenlen = (int)strlen(mas_test_words[i]);
5,924,842 ( 0.75%)  => ???:0x0000000000109170 (370,105x)
1,110,315 ( 0.14%)          if (lenlen > max_len)
       26 ( 0.00%)              max_len = lenlen;
5,181,470 ( 0.65%)          if (Find_Word(mas_list, mas_test_words[i]) == 0)
195,348,922 (24.59%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/1_optim/hash_table.cpp:Find_Word(str_spisok*, char*) (370,105x)
  357,686 ( 0.05%)              counter++;
        .               }
        .           
        6 ( 0.00%)      printf("maxlen = %d\n", max_len);
    1,926 ( 0.00%)  => ???:0x0000000000109180 (1x)
        6 ( 0.00%)      printf("-- words not found = %d --\n", counter);
      931 ( 0.00%)  => ???:0x0000000000109180 (1x)
        3 ( 0.00%)      Mas_List_Destructor(mas_list);
6,723,815 ( 0.85%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/1_optim/spisok.cpp:Mas_List_Destructor(str_spisok*) (1x)
        3 ( 0.00%)      free(massive_pointer);
       67 ( 0.00%)  => ???:0x0000000000109130 (1x)
        .           
        1 ( 0.00%)      return 0;
        2 ( 0.00%)  }
--------------------------------------------------------------------------------
-- Auto-annotated source: 1_optim/hash_table.cpp
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
    44,000 ( 0.01%)          Init_Spisok(&mas_list[i]);
11,962,227 ( 1.51%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/1_optim/spisok.cpp:Init_Spisok(str_spisok*) (4,000x)
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
 1,480,424 ( 0.19%)      for (int i = 0; i < SIZE_TEST_FILE; i++, massive++)
         .               {
 3,330,945 ( 0.42%)          mas_words[i] = (char*)calloc(32, sizeof(char));
82,172,922 (10.34%)  => ???:0x00000000001091a0 (370,105x)
30,891,484 ( 3.89%)          for (int j = 0; (j < 20) && (*massive != '\n'); j++, massive++)
41,899,920 ( 5.27%)              mas_words[i][j] = *massive;
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
 2,713,305 ( 0.34%)  {
17,415,457 ( 2.19%)      while (**massive != '\0' && !isalpha(**massive))
11,681,163 ( 1.47%)  => ???:0x00000000001091e0 (1,297,907x)
 3,776,235 ( 0.48%)          (*massive)++;
 1,627,983 ( 0.20%)  }
         .           
         .           bool Word_In_List(str_spisok spisok, char* word)
 2,713,300 ( 0.34%)  {
 6,054,616 ( 0.76%)      for (int i = 1; i <= spisok.size; i++)
         .               {
16,338,012 ( 2.06%)          if (strcmp(spisok.data[i], word) == 0)
33,398,428 ( 4.20%)  => ???:0x00000000001091b0 (1,361,501x)
 1,052,344 ( 0.13%)              return 1;
         .               }
         .           
    16,488 ( 0.00%)      return 0;
 1,085,320 ( 0.14%)  }
         .           
         .           int Find_Word(str_spisok* mas_list, char* word)
 2,220,630 ( 0.28%)  {
 6,661,890 ( 0.84%)      long long index_mas = Hash_crc32(word) % MASSIVE_SIZE;
74,371,688 ( 9.36%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/1_optim/hash_funcs.cpp:Hash_crc32(char*) (370,105x)
         .           
27,257,437 ( 3.43%)      for (int i = 1; i <= mas_list[index_mas].size; i++)
37,658,500 ( 4.74%)          if (strcmp(mas_list[index_mas].data[i], word) == 0)
46,056,043 ( 5.80%)  => ???:0x00000000001091b0 (1,882,925x)
    24,838 ( 0.00%)              return i;
         .           
   357,686 ( 0.05%)      return 0;
   740,210 ( 0.09%)  }
         .           
         .           void Fill_Hash_Table(str_spisok* mas_list, char* massive)
         7 ( 0.00%)  {
         3 ( 0.00%)      Skip_non_letters(&massive);
        31 ( 0.00%)  => 1_optim/hash_table.cpp:Skip_non_letters(char**) (1x)
 2,170,645 ( 0.27%)      while (*massive != 0)
         .               {
 2,170,640 ( 0.27%)          char* word = (char*)calloc(32, sizeof(char));
85,743,462 (10.79%)  => ???:0x00000000001091a0 (542,660x)
28,972,917 ( 3.65%)          for (int i = 0; isalpha(*massive); i++, massive++)
24,593,103 ( 3.10%)  => ???:0x00000000001091e0 (2,732,567x)
15,329,349 ( 1.93%)              word[i] = *massive;
         .           
 1,627,980 ( 0.20%)          Skip_non_letters(&massive);
37,214,112 ( 4.68%)  => 1_optim/hash_table.cpp:Skip_non_letters(char**) (542,660x)
         .           
 2,170,640 ( 0.27%)          long long index = Hash_crc32(word);
59,182,752 ( 7.45%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/1_optim/hash_funcs.cpp:Hash_crc32(char*) (542,660x)
         .           
 6,511,920 ( 0.82%)          index %= MASSIVE_SIZE;
         .           
14,651,820 ( 1.84%)          if (Word_In_List(mas_list[index], word))
60,658,508 ( 7.64%)  => 1_optim/hash_table.cpp:Word_In_List(str_spisok, char*) (542,660x)
         .                   {
 1,578,516 ( 0.20%)              free(word);
55,774,099 ( 7.02%)  => ???:0x0000000000109130 (526,172x)
   526,172 ( 0.07%)              continue;
         .                   }
         .           
   346,248 ( 0.04%)          Data_Vstavka(&mas_list[index], mas_list[index].size, word);
 1,833,611 ( 0.23%)  => /mnt/c/Users/Дима/Desktop/C/HashTable/1_optim/spisok.cpp:Data_Vstavka(str_spisok*, int, char*) (16,488x)
         .               }
         5 ( 0.00%)  }
--------------------------------------------------------------------------------
-- Auto-annotated source: 1_optim/spisok.cpp
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
1,095,133 ( 0.14%)  => ???:0x00000000001091a0 (4,000x)
   24,000 ( 0.00%)      spisok->next = (int*)calloc(SIZE_DATA, sizeof(int));
1,033,350 ( 0.13%)  => ???:0x00000000001091a0 (4,000x)
   24,000 ( 0.00%)      spisok->prev = (int*)calloc(SIZE_DATA, sizeof(int));
1,033,744 ( 0.13%)  => ???:0x00000000001091a0 (4,000x)
    8,000 ( 0.00%)      spisok->free = 1;
    8,000 ( 0.00%)      spisok->head = 0;                                           //индекс первого элемента списка в data
    8,000 ( 0.00%)      spisok->tail = 0;                                           //индекс последнего элемента списка в data
    8,000 ( 0.00%)      spisok->size = 0;                                           //количество элементов в списке (можно использовать как индикатор для tail или
        .                                                                           //чтобы после индекса больше чем элементов в data элемент ставился в конец)
   16,000 ( 0.00%)      IF_ERROR_CALLOC(spisok->data);
   16,000 ( 0.00%)      IF_ERROR_CALLOC(spisok->next);
   16,000 ( 0.00%)      IF_ERROR_CALLOC(spisok->prev);
        .           
1,192,000 ( 0.15%)      for (int i = 1; i < SIZE_DATA - 1; i++)
3,528,000 ( 0.44%)          spisok->next[i] = i + 1;
        .           
1,180,000 ( 0.15%)      for (int i = 2; i < SIZE_DATA - 1; i++)
2,716,000 ( 0.34%)          spisok->prev[i] = -1;
        .               
    4,000 ( 0.00%)      return 0;
    8,000 ( 0.00%)  }
        .           
        .           //-----------------------------------------------------------------------------
        .           
        .           int Data_Vstavka(str_spisok* spisok, int index, char* value)
  115,416 ( 0.01%)  {
  148,392 ( 0.02%)      if (spisok->prev[index] == -1)
        .               {
        .                   fprintf(stderr, "Illegal index in insert\n");
        .                   return 1;
        .               }
        .           
   32,976 ( 0.00%)      if (index == 0)
   17,215 ( 0.00%)          spisok->head = spisok->free;
   52,180 ( 0.01%)      else if (index == spisok->tail)
        .                   spisok->tail = spisok->free;
        .           
  148,392 ( 0.02%)      int next_free = spisok->next[spisok->free];
  148,392 ( 0.02%)      spisok->data[spisok->free] = value;
        .           
  346,248 ( 0.04%)      spisok->prev[spisok->free] = spisok->prev[spisok->next[index]];
  247,320 ( 0.03%)      spisok->prev[spisok->next[index]] = spisok->free;
        .           
  247,320 ( 0.03%)      spisok->next[spisok->free] = spisok->next[index];
  148,392 ( 0.02%)      spisok->next[index] = spisok->free;
        .           
   49,464 ( 0.01%)      spisok->free = next_free;
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
2,481,303 ( 0.31%)  => ???:0x0000000000109130 (4,000x)
   12,000 ( 0.00%)      free(spisok.next);
  874,860 ( 0.11%)  => ???:0x0000000000109130 (4,000x)
   12,000 ( 0.00%)      free(spisok.prev);
  875,034 ( 0.11%)  => ???:0x0000000000109130 (4,000x)
   12,000 ( 0.00%)  }
        .           
        .           void Mas_List_Destructor(str_spisok* mas_list)
        6 ( 0.00%)  {
   12,004 ( 0.00%)      for (int i = 0; i < MASSIVE_SIZE; i++)
        .               {
  270,344 ( 0.03%)          for (int j = 1; j <= mas_list[i].size; j++)
  280,296 ( 0.04%)              free(mas_list[i].data[j]);
1,773,894 ( 0.22%)  => ???:0x0000000000109130 (16,488x)
        .           
   96,000 ( 0.01%)          List_Destructor(mas_list[i]);
4,291,197 ( 0.54%)  => 1_optim/spisok.cpp:List_Destructor(str_spisok) (4,000x)
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
2,295,583 ( 0.29%)  => ???:0x00000000001091c0 (4,000x)
        .           
        3 ( 0.00%)      fclose(fp);
      683 ( 0.00%)  => ???:0x0000000000109160 (1x)
        3 ( 0.00%)  }
--------------------------------------------------------------------------------
-- Auto-annotated source: 1_optim/hash_funcs.cpp
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
 4,563,825 ( 0.57%)  {
   912,765 ( 0.11%)      unsigned crc = 0xFFFFFFFF;
         .           
27,859,720 ( 3.51%)      for (int i = 0; i < (int)strlen(word); word ++, i++)
63,740,690 ( 8.02%)  => ???:0x0000000000109170 (3,979,960x)
21,470,365 ( 2.70%)          crc = _mm_crc32_u8(crc, (unsigned char)*word);
         .           
   912,765 ( 0.11%)      return crc;
 1,825,530 ( 0.23%)  }
         .           
         .           //gui kcachegrind
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
373,762,843 (47.05%)  events annotated

