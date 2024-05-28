
; File generated by darts version O-2018.09#f5599cac26#190121, Tue May 28 10:41:51 2024
; Copyright 2014-2018 Synopsys, Inc. All rights reserved.
; darts -B -I.. +p -d -h -I../runtime/include -D__tct_patch__=300 +Ihex lib/Release/malloc.o tmicro

; Release: ipd O-2018.09-SP3
.data_segment_name
.bss local 1 __malloc_pool DM 4100

.data_segment_name
.data local 1 __malloc_sentinel DM
	0x0

.text_segment_name
.text local 0 __malloc_void_init
	/*      0 0x2412 */    mvi r2,__malloc_pool + 4096
	/*      1 0x1000 */    /* MW */
	/*      2 0x2410 */    mvi r0,-32768
	/*      3 0x8000 */    /* MW */
	/*      4 0x4290 */    st r0,dm(r2++)
	/*      5 0x2410 */    mvi r0,__malloc_pool + 4096
	/*      6 0x1000 */    /* MW */
	/*      7 0x3024 */    mvib r4,2
	/*      8 0x0044 */    add r1,r0,r4
	/*      9 0x4280 */    st r0,dm(r2)
	/*     10 0x4240 */    st r0,dm(r1)
	/*     11 0x2412 */    mvi r2,-4098
	/*     12 0xeffe */    /* MW */
	/*     13 0x004a */    add r1,r1,r2
	/*     14 0x2412 */    mvi r2,4097
	/*     15 0x1001 */    /* MW */
	/*     16 0x00ca */    add r3,r1,r2
	/*     17 0x2415 */    mvi r5,-4096
	/*     18 0xf000 */    /* MW */
	/*     19 0x40c6 */    ld r6,dm(r3)
	/*     20 0x0126 */    add r4,r4,r6
	/*     21 0x015d */    add r5,r3,r5
	/*     22 0x4301 */    st r1,dm(r4)
	/*     23 0x2414 */    mvi r4,4095
	/*     24 0x0fff */    /* MW */
	/*     25 0x40c3 */    ld r3,dm(r3)
	/*     26 0x4343 */    st r3,dm(r5)
	/*     27 0x00e5 */    add r3,r4,r5
	/*     28 0x2414 */    mvi r4,-4094
	/*     29 0xf002 */    /* MW */
	/*     30 0x011c */    add r4,r3,r4
	/*     31 0x3fe5 */    mvib r5,-2
	/*     32 0x4303 */    st r3,dm(r4)
	/*     33 0x00e5 */    add r3,r4,r5
	/*     34 0x0093 */    add r2,r2,r3
	/*     35 0x2415 */    mvi r5,1024
	/*     36 0x0400 */    /* MW */
	/*     37 0x4245 */    st r5,dm(r1)
	/*     38 0x4283 */    st r3,dm(r2)
	/*     39 0x2414 */    mvi r4,__malloc_sentinel
	/*     40 0x0000 */    /* MW */
	/*     41 0x2ec0 */    rtd 
	/*     42 0x4300 */    st r0,dm(r4)
.label __malloc_void_init__end
	/*     43 0x2e00 */    nop 

.undef local data __malloc_sentinel

.undef local data __malloc_pool

.undef local data __malloc_sentinel

.undef local text __malloc_void_init

.undef local data __malloc_sentinel

.text_segment_name
.text global 0 free
	/*      0 0x3001 */    mvib r1,0
	/*      1 0x1a01 */    eq r0,r1
	/*      2 0x2f18 */    jcr 24
	/*      3 0x4021 */    ld r1,dm(r0--)
	/*      4 0x4001 */    ld r1,dm(r0)
	/*      5 0x2412 */    mvi r2,32767
	/*      6 0x7fff */    /* MW */
	/*      7 0x084a */    and r1,r1,r2
	/*      8 0x2530 */    mv r3,r0
	/*      9 0x4211 */    st r1,dm(r0++)
	/*     10 0x2411 */    mvi r1,__malloc_sentinel
	/*     11 0x0000 */    /* MW */
	/*     12 0x4041 */    ld r1,dm(r1)
	/*     13 0x2521 */    mv r2,r1
	/*     14 0x4055 */    ld r5,dm(r1++)
	/*     15 0x4045 */    ld r5,dm(r1)
	/*     16 0x3024 */    mvib r4,2
	/*     17 0x0165 */    add r5,r4,r5
	/*     18 0x3fe4 */    mvib r4,-2
	/*     19 0x4343 */    st r3,dm(r5)
	/*     20 0x2e00 */    nop 
	/*     21 0x4043 */    ld r3,dm(r1)
	/*     22 0x4213 */    st r3,dm(r0++)
	/*     23 0x4202 */    st r2,dm(r0)
	/*     24 0x0004 */    add r0,r0,r4
	/*     25 0x2ec0 */    rtd 
	/*     26 0x4240 */    st r0,dm(r1)
	/*     27 0x2e00 */    nop 
.label free__end
	/*     28 0x2eb8 */    rt 

.text_segment_name
.text global 0 malloc
	/*      0 0x2410 */    mvi r0,__malloc_sentinel
	/*      1 0x0000 */    /* MW */
	/*      2 0x4002 */    ld r2,dm(r0)
	/*      3 0x3003 */    mvib r3,0
	/*      4 0x5020 */    addb sp, 2
	/*      5 0x1a53 */    ne r2,r3
	/*      6 0x2f07 */    jcr 7
	/*      7 0x7ffb */    st lr,dm(sp-1)
	/*      8 0x7fe1 */    st r1,dm(sp-2)
	/*      9 0x2e98 */    cl __malloc_void_init
	/*     10 0x0000 */    /* MW */
	/*     11 0x2410 */    mvi r0,__malloc_sentinel
	/*     12 0x0000 */    /* MW */
	/*     13 0x6fe1 */    ld r1,dm(sp-2)
	/*     14 0x6ffb */    ld lr,dm(sp-1)
	/*     15 0x3042 */    mvib r2,4
	/*     16 0x004a */    add r1,r1,r2
	/*     17 0x3022 */    mvib r2,2
	/*     18 0x128a */    lsr r2,r1,r2
	/*     19 0x4001 */    ld r1,dm(r0)
	/*     20 0x7ff2 */    st r2,dm(sp-1)
	/*     21 0x7fe1 */    st r1,dm(sp-2)
	/*     22 0x2410 */    mvi r0,-32768
	/*     23 0x8000 */    /* MW */
	/*     24 0x4052 */    ld r2,dm(r1++)
	/*     25 0x4041 */    ld r1,dm(r1)
	/*     26 0x6fe2 */    ld r2,dm(sp-2)
	/*     27 0x1a4a */    ne r1,r2
	/*     28 0x2412 */    mvi r2,32767
	/*     29 0x7fff */    /* MW */
	/*     30 0x2f02 */    jcr 2
	/*     31 0x2ec0 */    rtd 
	/*     32 0x3000 */    mvib r0,0
	/*     33 0x5fe0 */    addb sp, -2
	/*     34 0x4043 */    ld r3,dm(r1)
	/*     35 0x0893 */    and r2,r2,r3
	/*     36 0x3025 */    mvib r5,2
	/*     37 0x14d5 */    lsl r3,r2,r5
	/*     38 0x00cb */    add r3,r1,r3
	/*     39 0x3005 */    mvib r5,0
	/*     40 0x40d4 */    ld r4,dm(r3++)
	/*     41 0x0984 */    and r6,r0,r4
	/*     42 0x1a75 */    ne r6,r5
	/*     43 0x2415 */    mvi r5,32767
	/*     44 0x7fff */    /* MW */
	/*     45 0x2f0e */    jcr 14
	/*     46 0x0925 */    and r4,r4,r5
	/*     47 0x0094 */    add r2,r2,r4
	/*     48 0x2543 */    mv r4,r3
	/*     49 0x40d5 */    ld r5,dm(r3++)
	/*     50 0x40c6 */    ld r6,dm(r3)
	/*     51 0x4242 */    st r2,dm(r1)
	/*     52 0x2e00 */    nop 
	/*     53 0x4197 */    ld r7,dm(r6++)
	/*     54 0x4385 */    st r5,dm(r6)
	/*     55 0x3025 */    mvib r5,2
	/*     56 0x4104 */    ld r4,dm(r4)
	/*     57 0x40c3 */    ld r3,dm(r3)
	/*     58 0x0125 */    add r4,r4,r5
	/*     59 0x2ce9 */    jrd -23
	/*     60 0x4303 */    st r3,dm(r4)
.label __ll2_malloc
	/*     61 0x6ff3 */    ld r3,dm(sp-1)
	/*     62 0x0e13 */    lt r2,r3
	/*     63 0x2fd7 */    jcr -41
	/*     64 0x6ff5 */    ld r5,dm(sp-1)
	/*     65 0x0e95 */    le r2,r5
	/*     66 0x2f15 */    jcr 21
	/*     67 0x05d5 */    sub r7,r2,r5
	/*     68 0x6fe3 */    ld r3,dm(sp-2)
	/*     69 0x2523 */    mv r2,r3
	/*     70 0x40d4 */    ld r4,dm(r3++)
	/*     71 0x3024 */    mvib r4,2
	/*     72 0x156c */    lsl r5,r5,r4
	/*     73 0x014d */    add r5,r1,r5
	/*     74 0x2565 */    mv r6,r5
	/*     75 0x4357 */    st r7,dm(r5++)
	/*     76 0x2e00 */    nop 
	/*     77 0x40c7 */    ld r7,dm(r3)
	/*     78 0x01e7 */    add r7,r4,r7
	/*     79 0x2e00 */    nop 
	/*     80 0x43c6 */    st r6,dm(r7)
	/*     81 0x2e00 */    nop 
	/*     82 0x40c6 */    ld r6,dm(r3)
	/*     83 0x4356 */    st r6,dm(r5++)
	/*     84 0x4342 */    st r2,dm(r5)
	/*     85 0x3fe2 */    mvib r2,-2
	/*     86 0x0095 */    add r2,r2,r5
	/*     87 0x2c02 */    jrd 2
	/*     88 0x42c2 */    st r2,dm(r3)
	/*     89 0x3024 */    mvib r4,2
	/*     90 0x2e00 */    nop 
	/*     91 0x6ff2 */    ld r2,dm(sp-1)
	/*     92 0x0a02 */    or r0,r0,r2
	/*     93 0x4250 */    st r0,dm(r1++)
	/*     94 0x2501 */    mv r0,r1
	/*     95 0x4052 */    ld r2,dm(r1++)
	/*     96 0x4043 */    ld r3,dm(r1)
	/*     97 0x2e00 */    nop 
	/*     98 0x40d5 */    ld r5,dm(r3++)
	/*     99 0x42c2 */    st r2,dm(r3)
	/*    100 0x2e00 */    nop 
	/*    101 0x4002 */    ld r2,dm(r0)
	/*    102 0x4041 */    ld r1,dm(r1)
	/*    103 0x0094 */    add r2,r2,r4
	/*    104 0x2ec0 */    rtd 
	/*    105 0x4281 */    st r1,dm(r2)
.label malloc__end
	/*    106 0x5fe0 */    addb sp, -2

.text_segment_name
.text global 0 calloc
	/*      0 0x180a */    mulss (r6,r7),r1,r2
	/*      1 0x5030 */    addb sp, 3
	/*      2 0x2516 */    mv r1,r6
	/*      3 0x7feb */    st lr,dm(sp-2)
	/*      4 0x7ff1 */    st r1,dm(sp-1)
	/*      5 0x2e98 */    cl malloc
	/*      6 0x0000 */    /* MW */
	/*      7 0x3001 */    mvib r1,0
	/*      8 0x7fd0 */    st r0,dm(sp-3)
	/*      9 0x1a01 */    eq r0,r1
	/*     10 0x2f04 */    jcr 4
	/*     11 0x6ff3 */    ld r3,dm(sp-1)
	/*     12 0x3002 */    mvib r2,0
	/*     13 0x6fd1 */    ld r1,dm(sp-3)
	/*     14 0x2e98 */    cl memset
	/*     15 0x0000 */    /* MW */
	/*     16 0x6feb */    ld lr,dm(sp-2)
	/*     17 0x2ec0 */    rtd 
	/*     18 0x6fd0 */    ld r0,dm(sp-3)
.label calloc__end
	/*     19 0x5fd0 */    addb sp, -3

.undef global text malloc

.undef global text memset

.text_segment_name
.text global 0 realloc
	/*      0 0x5040 */    addb sp, 4
	/*      1 0x3000 */    mvib r0,0
	/*      2 0x1a48 */    ne r1,r0
	/*      3 0x7ff1 */    st r1,dm(sp-1)
	/*      4 0x2512 */    mv r1,r2
	/*      5 0x7fdb */    st lr,dm(sp-3)
	/*      6 0x7fe1 */    st r1,dm(sp-2)
	/*      7 0x2f03 */    jcr 3
	/*      8 0x6fdb */    ld lr,dm(sp-3)
	/*      9 0x5fc0 */    addb sp, -4
	/*     10 0x2e80 */    j malloc
	/*     11 0x0000 */    /* MW */
	/*     12 0x3000 */    mvib r0,0
	/*     13 0x1a48 */    ne r1,r0
	/*     14 0x2f08 */    jcr 8
	/*     15 0x2411 */    mvi r1,free
	/*     16 0x0000 */    /* MW */
	/*     17 0x2ea1 */    clid r1
	/*     18 0x6ff0 */    ld r0,dm(sp-1)
	/*     19 0x2e00 */    nop 
	/*     20 0x6fdb */    ld lr,dm(sp-3)
	/*     21 0x2ec0 */    rtd 
	/*     22 0x3000 */    mvib r0,0
	/*     23 0x5fc0 */    addb sp, -4
	/*     24 0x2410 */    mvi r0,malloc
	/*     25 0x0000 */    /* MW */
	/*     26 0x2ea0 */    clid r0
	/*     27 0x2e00 */    nop 
	/*     28 0x2e00 */    nop 
	/*     29 0x3001 */    mvib r1,0
	/*     30 0x7fc0 */    st r0,dm(sp-4)
	/*     31 0x1a01 */    eq r0,r1
	/*     32 0x2f14 */    jcr 20
	/*     33 0x6ff3 */    ld r3,dm(sp-1)
	/*     34 0x2411 */    mvi r1,32767
	/*     35 0x7fff */    /* MW */
	/*     36 0x40e4 */    ld r4,dm(r3--)
	/*     37 0x40c3 */    ld r3,dm(r3)
	/*     38 0x084b */    and r1,r1,r3
	/*     39 0x3023 */    mvib r3,2
	/*     40 0x14cb */    lsl r3,r1,r3
	/*     41 0x6fe4 */    ld r4,dm(sp-2)
	/*     42 0x40e1 */    ld r1,dm(r3--)
	/*     43 0x0e5c */    ltu r3,r4
	/*     44 0x22dc */    sel r3,r3,r4
	/*     45 0x6ff2 */    ld r2,dm(sp-1)
	/*     46 0x6fc1 */    ld r1,dm(sp-4)
	/*     47 0x2e98 */    cl memcpy
	/*     48 0x0000 */    /* MW */
	/*     49 0x2411 */    mvi r1,free
	/*     50 0x0000 */    /* MW */
	/*     51 0x2ea1 */    clid r1
	/*     52 0x6ff0 */    ld r0,dm(sp-1)
	/*     53 0x2e00 */    nop 
	/*     54 0x6fdb */    ld lr,dm(sp-3)
	/*     55 0x2ec0 */    rtd 
	/*     56 0x6fc0 */    ld r0,dm(sp-4)
.label realloc__end
	/*     57 0x5fc0 */    addb sp, -4

.undef global text free

.undef global text malloc

.undef global text memcpy
