
; File generated by darts version O-2018.09#f5599cac26#190121, Tue May 28 10:42:08 2024
; Copyright 2014-2018 Synopsys, Inc. All rights reserved.
; darts -B -I. +p -d -h -Iruntime/include -D__tct_patch__=300 +Ihex Release/tmicro_long_div.o tmicro

; Release: ipd O-2018.09-SP3
.text_segment_name
.text global 0 __ulong_div_called___ulong___ulong_R__ulong
	/*      0 0x2513 */    mv r1,r3
	/*      1 0x2502 */    mv r0,r2
	/*      2 0x3006 */    mvib r6,0
	/*      3 0x30f3 */    mvib r3,15
	/*      4 0x3002 */    mvib r2,0
	/*      5 0x2ee0 */    doi 32,LE_F__ulong_div_called___ulong___ulong_R__ulong_24
	/*      6 0x0018 */    /* MW */
	/*      7 0x0020 */    /* MW */
	/*      8 0x01b6 */    add r6,r6,r6
	/*      9 0x0292 */    addc r2,r2,r2
	/*     10 0x13cb */    lsr r7,r1,r3
	/*     11 0x0000 */    add r0,r0,r0
	/*     12 0x0bb7 */    or r6,r6,r7
	/*     13 0x0249 */    addc r1,r1,r1
	/*     14 0x0e6a */    ltu r5,r2
	/*     15 0x2f03 */    jcr 3
	/*     16 0x1a6a */    ne r5,r2
	/*     17 0x2f05 */    jcr 5
	/*     18 0x0f66 */    gtu r4,r6
	/*     19 0x2f03 */    jcr 3
	/*     20 0x05b4 */    sub r6,r6,r4
	/*     21 0x3017 */    mvib r7,1
	/*     22 0x0a07 */    or r0,r0,r7
	/*     23 0x0695 */    subb r2,r2,r5
.label LE_F__ulong_div_called___ulong___ulong_R__ulong_24
	/*     24 0x2e00 */    nop 
	/*     25 0x7fe6 */    st r6,dm(sp-2)
	/*     26 0x2ec0 */    rtd 
	/*     27 0x7ff2 */    st r2,dm(sp-1)
.label __ulong_div_called___ulong___ulong_R__ulong__end
	/*     28 0x2e00 */    nop 

.text_segment_name
.text global 0 __slong_div_called___slong___slong_R__slong
	/*      0 0x5020 */    addb sp, 2
	/*      1 0x2513 */    mv r1,r3
	/*      2 0x3006 */    mvib r6,0
	/*      3 0x7ff1 */    st r1,dm(sp-1)
	/*      4 0x0f8e */    ge r1,r6
	/*      5 0x7fe5 */    st r5,dm(sp-2)
	/*      6 0x2502 */    mv r0,r2
	/*      7 0x2f02 */    jcr 2
	/*      8 0x0430 */    sub r0,r6,r0
	/*      9 0x6ff1 */    ld r1,dm(sp-1)
	/*     10 0x0671 */    subb r1,r6,r1
	/*     11 0x0fae */    ge r5,r6
	/*     12 0x2f02 */    jcr 2
	/*     13 0x0534 */    sub r4,r6,r4
	/*     14 0x6fe5 */    ld r5,dm(sp-2)
	/*     15 0x0775 */    subb r5,r6,r5
	/*     16 0x30f3 */    mvib r3,15
	/*     17 0x3002 */    mvib r2,0
	/*     18 0x2ee0 */    doi 32,LE_F__slong_div_called___slong___slong_R__slong_37
	/*     19 0x0025 */    /* MW */
	/*     20 0x0020 */    /* MW */
	/*     21 0x01b6 */    add r6,r6,r6
	/*     22 0x0292 */    addc r2,r2,r2
	/*     23 0x13cb */    lsr r7,r1,r3
	/*     24 0x0000 */    add r0,r0,r0
	/*     25 0x0bb7 */    or r6,r6,r7
	/*     26 0x0249 */    addc r1,r1,r1
	/*     27 0x0e6a */    ltu r5,r2
	/*     28 0x2f03 */    jcr 3
	/*     29 0x1a6a */    ne r5,r2
	/*     30 0x2f05 */    jcr 5
	/*     31 0x0f66 */    gtu r4,r6
	/*     32 0x2f03 */    jcr 3
	/*     33 0x05b4 */    sub r6,r6,r4
	/*     34 0x3017 */    mvib r7,1
	/*     35 0x0a07 */    or r0,r0,r7
	/*     36 0x0695 */    subb r2,r2,r5
.label LE_F__slong_div_called___slong___slong_R__slong_37
	/*     37 0x2e00 */    nop 
	/*     38 0x7fd2 */    st r2,dm(sp-3)
	/*     39 0x3005 */    mvib r5,0
	/*     40 0x6ff4 */    ld r4,dm(sp-1)
	/*     41 0x7fc6 */    st r6,dm(sp-4)
	/*     42 0x0fa5 */    ge r4,r5
	/*     43 0x6fe2 */    ld r2,dm(sp-2)
	/*     44 0x2f05 */    jcr 5
	/*     45 0x6fc3 */    ld r3,dm(sp-4)
	/*     46 0x04eb */    sub r3,r5,r3
	/*     47 0x6fd6 */    ld r6,dm(sp-3)
	/*     48 0x07ae */    subb r6,r5,r6
	/*     49 0x7fd6 */    st r6,dm(sp-3)
	/*     50 0x7fc3 */    st r3,dm(sp-4)
	/*     51 0x0d14 */    xor r4,r2,r4
	/*     52 0x0fa5 */    ge r4,r5
	/*     53 0x2f01 */    jcr 1
	/*     54 0x0428 */    sub r0,r5,r0
	/*     55 0x0669 */    subb r1,r5,r1
	/*     56 0x2ec0 */    rtd 
	/*     57 0x5fe0 */    addb sp, -2
.label __slong_div_called___slong___slong_R__slong__end
	/*     58 0x2e00 */    nop 
