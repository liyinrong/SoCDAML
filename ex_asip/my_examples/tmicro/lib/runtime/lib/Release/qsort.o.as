
; File generated by darts version O-2018.09#f5599cac26#190121, Tue May 28 10:41:36 2024
; Copyright 2014-2018 Synopsys, Inc. All rights reserved.
; darts -B -I.. +p -d -h -I../runtime/include -D__tct_patch__=300 +Ihex lib/Release/qsort.o tmicro

; Release: ipd O-2018.09-SP3
.text_segment_name
.text local 0 __qsort___P__cchar_med3___P__cchar___P__cchar___P__cchar___P__sint_____Pvoid___Pvoid
	/*      0 0x5050 */    addb sp, 5
	/*      1 0x7fbb */    st lr,dm(sp-5)
	/*      2 0x7fe3 */    st r3,dm(sp-2)
	/*      3 0x7fd2 */    st r2,dm(sp-3)
	/*      4 0x7fc1 */    st r1,dm(sp-4)
	/*      5 0x2ea4 */    clid r4
	/*      6 0x7ff4 */    st r4,dm(sp-1)
	/*      7 0x2e00 */    nop 
	/*      8 0x3002 */    mvib r2,0
	/*      9 0x0e02 */    lt r0,r2
	/*     10 0x6ff0 */    ld r0,dm(sp-1)
	/*     11 0x6fe2 */    ld r2,dm(sp-2)
	/*     12 0x6fd1 */    ld r1,dm(sp-3)
	/*     13 0x2f12 */    jcr 18
	/*     14 0x2ea0 */    clid r0
	/*     15 0x2e00 */    nop 
	/*     16 0x2e00 */    nop 
	/*     17 0x3002 */    mvib r2,0
	/*     18 0x0f02 */    gt r0,r2
	/*     19 0x2f0a */    jcr 10
	/*     20 0x6ff0 */    ld r0,dm(sp-1)
	/*     21 0x2ea0 */    clid r0
	/*     22 0x6fc1 */    ld r1,dm(sp-4)
	/*     23 0x6fe2 */    ld r2,dm(sp-2)
	/*     24 0x3002 */    mvib r2,0
	/*     25 0x0e02 */    lt r0,r2
	/*     26 0x6fc0 */    ld r0,dm(sp-4)
	/*     27 0x2f16 */    jcr 22
	/*     28 0x2e00 */    nop 
	/*     29 0x2c15 */    jrd 21
	/*     30 0x6fe0 */    ld r0,dm(sp-2)
	/*     31 0x2c13 */    jrd 19
	/*     32 0x6fd0 */    ld r0,dm(sp-3)
	/*     33 0x2ea0 */    clid r0
	/*     34 0x2e00 */    nop 
	/*     35 0x2e00 */    nop 
	/*     36 0x3002 */    mvib r2,0
	/*     37 0x0e02 */    lt r0,r2
	/*     38 0x2f0a */    jcr 10
	/*     39 0x6ff0 */    ld r0,dm(sp-1)
	/*     40 0x2ea0 */    clid r0
	/*     41 0x6fc1 */    ld r1,dm(sp-4)
	/*     42 0x6fe2 */    ld r2,dm(sp-2)
	/*     43 0x3002 */    mvib r2,0
	/*     44 0x0e02 */    lt r0,r2
	/*     45 0x6fe0 */    ld r0,dm(sp-2)
	/*     46 0x2f03 */    jcr 3
	/*     47 0x2e00 */    nop 
	/*     48 0x2c02 */    jrd 2
	/*     49 0x6fc0 */    ld r0,dm(sp-4)
	/*     50 0x6fd0 */    ld r0,dm(sp-3)
	/*     51 0x6fbb */    ld lr,dm(sp-5)
	/*     52 0x2ec0 */    rtd 
	/*     53 0x5fb0 */    addb sp, -5
.label __qsort___P__cchar_med3___P__cchar___P__cchar___P__cchar___P__sint_____Pvoid___Pvoid__end
	/*     54 0x2e00 */    nop 

.undef local text __qsort___P__cchar_med3___P__cchar___P__cchar___P__cchar___P__sint_____Pvoid___Pvoid

.text_segment_name
.text global 0 qsort
	/*      0 0x5170 */    addb sp, 23
.label __ll1_qsort
	/*      1 0x3027 */    mvib r7,2
	/*      2 0x7fe7 */    st r7,dm(sp-2)
	/*      3 0x3015 */    mvib r5,1
	/*      4 0x0905 */    and r4,r0,r5
	/*      5 0x3007 */    mvib r7,0
	/*      6 0x1a67 */    ne r4,r7
	/*      7 0x2570 */    mv r7,r0
	/*      8 0x7fd0 */    st r0,dm(sp-3)
	/*      9 0x7fcb */    st lr,dm(sp-4)
	/*     10 0x7fb3 */    st r3,dm(sp-5)
	/*     11 0x7fa2 */    st r2,dm(sp-6)
	/*     12 0x2f0a */    jcr 10
	/*     13 0x0915 */    and r4,r2,r5
	/*     14 0x3006 */    mvib r6,0
	/*     15 0x1a66 */    ne r4,r6
	/*     16 0x3024 */    mvib r4,2
	/*     17 0x7fe4 */    st r4,dm(sp-2)
	/*     18 0x2f04 */    jcr 4
	/*     19 0x3024 */    mvib r4,2
	/*     20 0x1a14 */    eq r2,r4
	/*     21 0x3004 */    mvib r4,0
	/*     22 0x2325 */    sel r4,r4,r5
	/*     23 0x7fe4 */    st r4,dm(sp-2)
	/*     24 0x0197 */    add r6,r2,r7
	/*     25 0x3ff3 */    mvib r3,-1
	/*     26 0x7f86 */    st r6,dm(sp-8)
	/*     27 0x18ca */    macl (r7),r1,r2
	/*     28 0x00d3 */    add r3,r2,r3
	/*     29 0x05b2 */    sub r6,r6,r2
	/*     30 0x7f57 */    st r7,dm(sp-11)
	/*     31 0x1315 */    lsr r4,r2,r5
	/*     32 0x7f73 */    st r3,dm(sp-9)
	/*     33 0x7f66 */    st r6,dm(sp-10)
	/*     34 0x7f94 */    st r4,dm(sp-7)
	/*     35 0x3076 */    mvib r6,7
	/*     36 0x40d7 */    ld r7,dm(r3++)
	/*     37 0x7f43 */    st r3,dm(sp-12)
	/*     38 0x0e4e */    ltu r1,r6
	/*     39 0x6fb4 */    ld r4,dm(sp-5)
	/*     40 0x2e90 */    jc TGT_Fqsort_713
	/*     41 0x02c9 */    /* MW */
	/*     42 0x2531 */    mv r3,r1
	/*     43 0x4067 */    ld r7,dm(r1--)
	/*     44 0x6fd7 */    ld r7,dm(sp-3)
	/*     45 0x18ca */    macl (r7),r1,r2
	/*     46 0x2513 */    mv r1,r3
	/*     47 0x7f37 */    st r7,dm(sp-13)
	/*     48 0x2537 */    mv r3,r7
	/*     49 0x2571 */    mv r7,r1
	/*     50 0x127d */    lsr r1,r7,r5
	/*     51 0x2567 */    mv r6,r7
	/*     52 0x6fd7 */    ld r7,dm(sp-3)
	/*     53 0x18ca */    macl (r7),r1,r2
	/*     54 0x3075 */    mvib r5,7
	/*     55 0x0ef5 */    leu r6,r5
	/*     56 0x2527 */    mv r2,r7
	/*     57 0x2f2f */    jcr 47
	/*     58 0x3281 */    mvib r1,40
	/*     59 0x0ef1 */    leu r6,r1
	/*     60 0x2415 */    mvi r5,__qsort___P__cchar_med3___P__cchar___P__cchar___P__cchar___P__sint_____Pvoid___Pvoid
	/*     61 0x0000 */    /* MW */
	/*     62 0x2f26 */    jcr 38
	/*     63 0x3031 */    mvib r1,3
	/*     64 0x1271 */    lsr r1,r6,r1
	/*     65 0x6fa0 */    ld r0,dm(sp-6)
	/*     66 0x1808 */    mulss (r6,r7),r1,r0
	/*     67 0x3011 */    mvib r1,1
	/*     68 0x1431 */    lsl r0,r6,r1
	/*     69 0x6fd1 */    ld r1,dm(sp-3)
	/*     70 0x00c1 */    add r3,r0,r1
	/*     71 0x7f10 */    st r0,dm(sp-15)
	/*     72 0x7f26 */    st r6,dm(sp-14)
	/*     73 0x7f02 */    st r2,dm(sp-16)
	/*     74 0x2ea5 */    clid r5
	/*     75 0x01ce */    add r7,r1,r6
	/*     76 0x2527 */    mv r2,r7
	/*     77 0x6f02 */    ld r2,dm(sp-16)
	/*     78 0x7f00 */    st r0,dm(sp-16)
	/*     79 0x2410 */    mvi r0,__qsort___P__cchar_med3___P__cchar___P__cchar___P__cchar___P__sint_____Pvoid___Pvoid
	/*     80 0x0000 */    /* MW */
	/*     81 0x6f21 */    ld r1,dm(sp-14)
	/*     82 0x6fb4 */    ld r4,dm(sp-5)
	/*     83 0x2ea0 */    clid r0
	/*     84 0x00ca */    add r3,r1,r2
	/*     85 0x0451 */    sub r1,r2,r1
	/*     86 0x6f21 */    ld r1,dm(sp-14)
	/*     87 0x7f20 */    st r0,dm(sp-14)
	/*     88 0x2410 */    mvi r0,__qsort___P__cchar_med3___P__cchar___P__cchar___P__cchar___P__sint_____Pvoid___Pvoid
	/*     89 0x0000 */    /* MW */
	/*     90 0x6f33 */    ld r3,dm(sp-13)
	/*     91 0x0499 */    sub r2,r3,r1
	/*     92 0x6fb4 */    ld r4,dm(sp-5)
	/*     93 0x2ea0 */    clid r0
	/*     94 0x6f11 */    ld r1,dm(sp-15)
	/*     95 0x0459 */    sub r1,r3,r1
	/*     96 0x2530 */    mv r3,r0
	/*     97 0x6fb4 */    ld r4,dm(sp-5)
	/*     98 0x6f22 */    ld r2,dm(sp-14)
	/*     99 0x6f00 */    ld r0,dm(sp-16)
	/*    100 0x2415 */    mvi r5,__qsort___P__cchar_med3___P__cchar___P__cchar___P__cchar___P__sint_____Pvoid___Pvoid
	/*    101 0x0000 */    /* MW */
	/*    102 0x2ea5 */    clid r5
	/*    103 0x2510 */    mv r1,r0
	/*    104 0x2e00 */    nop 
	/*    105 0x2520 */    mv r2,r0
	/*    106 0x6f90 */    ld r0,dm(sp-7)
	/*    107 0x6fd5 */    ld r5,dm(sp-3)
	/*    108 0x4021 */    ld r1,dm(r0--)
	/*    109 0x2515 */    mv r1,r5
	/*    110 0x4153 */    ld r3,dm(r5++)
	/*    111 0x6fe3 */    ld r3,dm(sp-2)
	/*    112 0x3006 */    mvib r6,0
	/*    113 0x3014 */    mvib r4,1
	/*    114 0x7f25 */    st r5,dm(sp-14)
	/*    115 0x1a1e */    eq r3,r6
	/*    116 0x1404 */    lsl r0,r0,r4
	/*    117 0x2f29 */    jcr 41
	/*    118 0x0e9c */    le r3,r4
	/*    119 0x6f73 */    ld r3,dm(sp-9)
	/*    120 0x2f0b */    jcr 11
	/*    121 0x00cb */    add r3,r1,r3
	/*    122 0x6f85 */    ld r5,dm(sp-8)
	/*    123 0x40d4 */    ld r4,dm(r3++)
	/*    124 0x4044 */    ld r4,dm(r1)
	/*    125 0x4087 */    ld r7,dm(r2)
	/*    126 0x4257 */    st r7,dm(r1++)
	/*    127 0x4294 */    st r4,dm(r2++)
	/*    128 0x0e4b */    ltu r1,r3
	/*    129 0x2ff9 */    jcr -7
	/*    130 0x2e00 */    nop 
	/*    131 0x2c2b */    jrd 43
	/*    132 0x3021 */    mvib r1,2
	/*    133 0x7f70 */    st r0,dm(sp-9)
	/*    134 0x3023 */    mvib r3,2
	/*    135 0x6f24 */    ld r4,dm(sp-14)
	/*    136 0x0004 */    add r0,r0,r4
	/*    137 0x0003 */    add r0,r0,r3
	/*    138 0x7f10 */    st r0,dm(sp-15)
	/*    139 0x2551 */    mv r5,r1
	/*    140 0x4050 */    ld r0,dm(r1++)
	/*    141 0x2532 */    mv r3,r2
	/*    142 0x4097 */    ld r7,dm(r2++)
	/*    143 0x4044 */    ld r4,dm(r1)
	/*    144 0x4086 */    ld r6,dm(r2)
	/*    145 0x4347 */    st r7,dm(r5)
	/*    146 0x4246 */    st r6,dm(r1)
	/*    147 0x42c0 */    st r0,dm(r3)
	/*    148 0x4294 */    st r4,dm(r2++)
	/*    149 0x3020 */    mvib r0,2
	/*    150 0x0041 */    add r1,r0,r1
	/*    151 0x6f10 */    ld r0,dm(sp-15)
	/*    152 0x0e48 */    ltu r1,r0
	/*    153 0x4060 */    ld r0,dm(r1--)
	/*    154 0x2fef */    jcr -17
	/*    155 0x3021 */    mvib r1,2
	/*    156 0x3006 */    mvib r6,0
	/*    157 0x6f85 */    ld r5,dm(sp-8)
	/*    158 0x2c10 */    jrd 16
	/*    159 0x6f70 */    ld r0,dm(sp-9)
	/*    160 0x7f70 */    st r0,dm(sp-9)
	/*    161 0x2502 */    mv r0,r2
	/*    162 0x6f23 */    ld r3,dm(sp-14)
	/*    163 0x4097 */    ld r7,dm(r2++)
	/*    164 0x4044 */    ld r4,dm(r1)
	/*    165 0x4086 */    ld r6,dm(r2)
	/*    166 0x40c5 */    ld r5,dm(r3)
	/*    167 0x4247 */    st r7,dm(r1)
	/*    168 0x42c6 */    st r6,dm(r3)
	/*    169 0x4204 */    st r4,dm(r0)
	/*    170 0x4285 */    st r5,dm(r2)
	/*    171 0x3006 */    mvib r6,0
	/*    172 0x6f85 */    ld r5,dm(sp-8)
	/*    173 0x6f70 */    ld r0,dm(sp-9)
	/*    174 0x3021 */    mvib r1,2
	/*    175 0x0041 */    add r1,r0,r1
	/*    176 0x3032 */    mvib r2,3
	/*    177 0x7f11 */    st r1,dm(sp-15)
	/*    178 0x0002 */    add r0,r0,r2
	/*    179 0x6f33 */    ld r3,dm(sp-13)
	/*    180 0x6f81 */    ld r1,dm(sp-8)
	/*    181 0x6fa2 */    ld r2,dm(sp-6)
	/*    182 0x7f70 */    st r0,dm(sp-9)
	/*    183 0x7f03 */    st r3,dm(sp-16)
.label TGT_Fqsort_184
	/*    184 0x2575 */    mv r7,r5
	/*    185 0x3004 */    mvib r4,0
	/*    186 0x4150 */    ld r0,dm(r5++)
	/*    187 0x2c44 */    jrd 68
	/*    188 0x6ff0 */    ld r0,dm(sp-1)
	/*    189 0x1a44 */    ne r0,r4
	/*    190 0x2f3f */    jcr 63
	/*    191 0x6fe2 */    ld r2,dm(sp-2)
	/*    192 0x1a14 */    eq r2,r4
	/*    193 0x2521 */    mv r2,r1
	/*    194 0x2e00 */    nop 
	/*    195 0x4090 */    ld r0,dm(r2++)
	/*    196 0x2f2a */    jcr 42
	/*    197 0x3010 */    mvib r0,1
	/*    198 0x6fe4 */    ld r4,dm(sp-2)
	/*    199 0x6f13 */    ld r3,dm(sp-15)
	/*    200 0x7ef7 */    st r7,dm(sp-17)
	/*    201 0x7ee5 */    st r5,dm(sp-18)
	/*    202 0x7ed1 */    st r1,dm(sp-19)
	/*    203 0x0ea0 */    le r4,r0
	/*    204 0x2f0b */    jcr 11
	/*    205 0x6f42 */    ld r2,dm(sp-12)
	/*    206 0x2507 */    mv r0,r7
	/*    207 0x0097 */    add r2,r2,r7
	/*    208 0x2531 */    mv r3,r1
	/*    209 0x4004 */    ld r4,dm(r0)
	/*    210 0x40c6 */    ld r6,dm(r3)
	/*    211 0x4216 */    st r6,dm(r0++)
	/*    212 0x42d4 */    st r4,dm(r3++)
	/*    213 0x0e42 */    ltu r0,r2
	/*    214 0x2ff9 */    jcr -7
	/*    215 0x2e00 */    nop 
	/*    216 0x2d1f */    jr 31
	/*    217 0x0093 */    add r2,r2,r3
	/*    218 0x7ec2 */    st r2,dm(sp-20)
	/*    219 0x2521 */    mv r2,r1
	/*    220 0x4054 */    ld r4,dm(r1++)
	/*    221 0x41c0 */    ld r0,dm(r7)
	/*    222 0x4143 */    ld r3,dm(r5)
	/*    223 0x4046 */    ld r6,dm(r1)
	/*    224 0x43c4 */    st r4,dm(r7)
	/*    225 0x4346 */    st r6,dm(r5)
	/*    226 0x4280 */    st r0,dm(r2)
	/*    227 0x3022 */    mvib r2,2
	/*    228 0x4243 */    st r3,dm(r1)
	/*    229 0x004a */    add r1,r1,r2
	/*    230 0x6ec0 */    ld r0,dm(sp-20)
	/*    231 0x0e48 */    ltu r1,r0
	/*    232 0x01d7 */    add r7,r2,r7
	/*    233 0x0155 */    add r5,r2,r5
	/*    234 0x4062 */    ld r2,dm(r1--)
	/*    235 0x2fee */    jcr -18
	/*    236 0x6ee5 */    ld r5,dm(sp-18)
	/*    237 0x6ef7 */    ld r7,dm(sp-17)
	/*    238 0x2c09 */    jrd 9
	/*    239 0x6ed1 */    ld r1,dm(sp-19)
	/*    240 0x41c0 */    ld r0,dm(r7)
	/*    241 0x4143 */    ld r3,dm(r5)
	/*    242 0x4044 */    ld r4,dm(r1)
	/*    243 0x4086 */    ld r6,dm(r2)
	/*    244 0x43c4 */    st r4,dm(r7)
	/*    245 0x4346 */    st r6,dm(r5)
	/*    246 0x4240 */    st r0,dm(r1)
	/*    247 0x4283 */    st r3,dm(r2)
	/*    248 0x3004 */    mvib r4,0
	/*    249 0x6fa2 */    ld r2,dm(sp-6)
	/*    250 0x01d7 */    add r7,r2,r7
	/*    251 0x0155 */    add r5,r2,r5
	/*    252 0x6f33 */    ld r3,dm(sp-13)
	/*    253 0x3016 */    mvib r6,1
	/*    254 0x6ff0 */    ld r0,dm(sp-1)
	/*    255 0x004a */    add r1,r1,r2
.label __ll4_qsort
	/*    256 0x0f4b */    gtu r1,r3
	/*    257 0x2f11 */    jcr 17
	/*    258 0x6fb0 */    ld r0,dm(sp-5)
	/*    259 0x7ed5 */    st r5,dm(sp-19)
	/*    260 0x7ee7 */    st r7,dm(sp-18)
	/*    261 0x7ef6 */    st r6,dm(sp-17)
	/*    262 0x7ff1 */    st r1,dm(sp-1)
	/*    263 0x2ea0 */    clid r0
	/*    264 0x2e00 */    nop 
	/*    265 0x6fd2 */    ld r2,dm(sp-3)
	/*    266 0x6ff1 */    ld r1,dm(sp-1)
	/*    267 0x3004 */    mvib r4,0
	/*    268 0x6f33 */    ld r3,dm(sp-13)
	/*    269 0x0e84 */    le r0,r4
	/*    270 0x6fa2 */    ld r2,dm(sp-6)
	/*    271 0x6ed5 */    ld r5,dm(sp-19)
	/*    272 0x6ee7 */    ld r7,dm(sp-18)
	/*    273 0x6ef6 */    ld r6,dm(sp-17)
	/*    274 0x7ff0 */    st r0,dm(sp-1)
	/*    275 0x2fa8 */    jcr -88
	/*    276 0x7f37 */    st r7,dm(sp-13)
	/*    277 0x7ee1 */    st r1,dm(sp-18)
	/*    278 0x2571 */    mv r7,r1
	/*    279 0x4055 */    ld r5,dm(r1++)
	/*    280 0x6f05 */    ld r5,dm(sp-16)
	/*    281 0x7ed1 */    st r1,dm(sp-19)
	/*    282 0x7ef6 */    st r6,dm(sp-17)
	/*    283 0x2e00 */    nop 
	/*    284 0x4151 */    ld r1,dm(r5++)
	/*    285 0x2513 */    mv r1,r3
	/*    286 0x40d6 */    ld r6,dm(r3++)
	/*    287 0x2c57 */    jrd 87
	/*    288 0x6fe6 */    ld r6,dm(sp-2)
	/*    289 0x1a44 */    ne r0,r4
	/*    290 0x2f51 */    jcr 81
	/*    291 0x1a34 */    eq r6,r4
	/*    292 0x6f00 */    ld r0,dm(sp-16)
	/*    293 0x2f3c */    jcr 60
	/*    294 0x3012 */    mvib r2,1
	/*    295 0x6fe7 */    ld r7,dm(sp-2)
	/*    296 0x6f94 */    ld r4,dm(sp-7)
	/*    297 0x7f00 */    st r0,dm(sp-16)
	/*    298 0x7ef5 */    st r5,dm(sp-17)
	/*    299 0x7ec1 */    st r1,dm(sp-20)
	/*    300 0x7eb3 */    st r3,dm(sp-21)
	/*    301 0x0eba */    le r7,r2
	/*    302 0x2f0b */    jcr 11
	/*    303 0x6f42 */    ld r2,dm(sp-12)
	/*    304 0x2541 */    mv r4,r1
	/*    305 0x008a */    add r2,r1,r2
	/*    306 0x4107 */    ld r7,dm(r4)
	/*    307 0x4006 */    ld r6,dm(r0)
	/*    308 0x4316 */    st r6,dm(r4++)
	/*    309 0x4217 */    st r7,dm(r0++)
	/*    310 0x0e62 */    ltu r4,r2
	/*    311 0x2ff9 */    jcr -7
	/*    312 0x2e00 */    nop 
	/*    313 0x2c31 */    jrd 49
	/*    314 0x6f00 */    ld r0,dm(sp-16)
	/*    315 0x3002 */    mvib r2,0
	/*    316 0x7ea4 */    st r4,dm(sp-22)
	/*    317 0x7e92 */    st r2,dm(sp-23)
	/*    318 0x2e00 */    nop 
	/*    319 0x4007 */    ld r7,dm(r0)
	/*    320 0x4042 */    ld r2,dm(r1)
	/*    321 0x40c4 */    ld r4,dm(r3)
	/*    322 0x4146 */    ld r6,dm(r5)
	/*    323 0x4247 */    st r7,dm(r1)
	/*    324 0x42c6 */    st r6,dm(r3)
	/*    325 0x4202 */    st r2,dm(r0)
	/*    326 0x4344 */    st r4,dm(r5)
	/*    327 0x3ff2 */    mvib r2,-1
	/*    328 0x6ea4 */    ld r4,dm(sp-22)
	/*    329 0x01d4 */    add r7,r2,r4
	/*    330 0x6e94 */    ld r4,dm(sp-23)
	/*    331 0x0294 */    addc r2,r2,r4
	/*    332 0x7ea7 */    st r7,dm(sp-22)
	/*    333 0x3024 */    mvib r4,2
	/*    334 0x3007 */    mvib r7,0
	/*    335 0x7e92 */    st r2,dm(sp-23)
	/*    336 0x004c */    add r1,r1,r4
	/*    337 0x0004 */    add r0,r0,r4
	/*    338 0x00dc */    add r3,r3,r4
	/*    339 0x0165 */    add r5,r4,r5
	/*    340 0x0f17 */    gt r2,r7
	/*    341 0x2fe8 */    jcr -24
	/*    342 0x3002 */    mvib r2,0
	/*    343 0x6e94 */    ld r4,dm(sp-23)
	/*    344 0x1a62 */    ne r4,r2
	/*    345 0x2f03 */    jcr 3
	/*    346 0x6ea2 */    ld r2,dm(sp-22)
	/*    347 0x3004 */    mvib r4,0
	/*    348 0x0f54 */    gtu r2,r4
	/*    349 0x2fe0 */    jcr -32
	/*    350 0x6ec1 */    ld r1,dm(sp-20)
	/*    351 0x6ef5 */    ld r5,dm(sp-17)
	/*    352 0x6f00 */    ld r0,dm(sp-16)
	/*    353 0x2c09 */    jrd 9
	/*    354 0x6eb3 */    ld r3,dm(sp-21)
	/*    355 0x4042 */    ld r2,dm(r1)
	/*    356 0x40c4 */    ld r4,dm(r3)
	/*    357 0x4007 */    ld r7,dm(r0)
	/*    358 0x4146 */    ld r6,dm(r5)
	/*    359 0x4247 */    st r7,dm(r1)
	/*    360 0x42c6 */    st r6,dm(r3)
	/*    361 0x4202 */    st r2,dm(r0)
	/*    362 0x4344 */    st r4,dm(r5)
	/*    363 0x3014 */    mvib r4,1
	/*    364 0x6fa2 */    ld r2,dm(sp-6)
	/*    365 0x0402 */    sub r0,r0,r2
	/*    366 0x7f00 */    st r0,dm(sp-16)
	/*    367 0x7ef4 */    st r4,dm(sp-17)
	/*    368 0x056a */    sub r5,r5,r2
	/*    369 0x3004 */    mvib r4,0
	/*    370 0x6ff0 */    ld r0,dm(sp-1)
	/*    371 0x6fe6 */    ld r6,dm(sp-2)
	/*    372 0x6ee7 */    ld r7,dm(sp-18)
	/*    373 0x044a */    sub r1,r1,r2
	/*    374 0x04da */    sub r3,r3,r2
.label __ll5_qsort
	/*    375 0x0f79 */    gtu r7,r1
	/*    376 0x2f10 */    jcr 16
	/*    377 0x6fb0 */    ld r0,dm(sp-5)
	/*    378 0x7eb5 */    st r5,dm(sp-21)
	/*    379 0x7ec3 */    st r3,dm(sp-20)
	/*    380 0x7ff1 */    st r1,dm(sp-1)
	/*    381 0x2ea0 */    clid r0
	/*    382 0x2e00 */    nop 
	/*    383 0x6fd2 */    ld r2,dm(sp-3)
	/*    384 0x6ff1 */    ld r1,dm(sp-1)
	/*    385 0x3004 */    mvib r4,0
	/*    386 0x0f84 */    ge r0,r4
	/*    387 0x6ec3 */    ld r3,dm(sp-20)
	/*    388 0x6fa2 */    ld r2,dm(sp-6)
	/*    389 0x6ee7 */    ld r7,dm(sp-18)
	/*    390 0x6eb5 */    ld r5,dm(sp-21)
	/*    391 0x6fe6 */    ld r6,dm(sp-2)
	/*    392 0x7ff0 */    st r0,dm(sp-1)
	/*    393 0x2f96 */    jcr -106
	/*    394 0x0f79 */    gtu r7,r1
	/*    395 0x2f39 */    jcr 57
	/*    396 0x1a34 */    eq r6,r4
	/*    397 0x2f26 */    jcr 38
	/*    398 0x3012 */    mvib r2,1
	/*    399 0x6fe3 */    ld r3,dm(sp-2)
	/*    400 0x6f70 */    ld r0,dm(sp-9)
	/*    401 0x7ef1 */    st r1,dm(sp-17)
	/*    402 0x0e9a */    le r3,r2
	/*    403 0x2f0b */    jcr 11
	/*    404 0x6f42 */    ld r2,dm(sp-12)
	/*    405 0x2507 */    mv r0,r7
	/*    406 0x0097 */    add r2,r2,r7
	/*    407 0x2531 */    mv r3,r1
	/*    408 0x4004 */    ld r4,dm(r0)
	/*    409 0x40c5 */    ld r5,dm(r3)
	/*    410 0x4215 */    st r5,dm(r0++)
	/*    411 0x42d4 */    st r4,dm(r3++)
	/*    412 0x0e42 */    ltu r0,r2
	/*    413 0x2ff9 */    jcr -7
	/*    414 0x2e00 */    nop 
	/*    415 0x2d1e */    jr 30
	/*    416 0x0087 */    add r2,r0,r7
	/*    417 0x7ed2 */    st r2,dm(sp-19)
	/*    418 0x2501 */    mv r0,r1
	/*    419 0x4055 */    ld r5,dm(r1++)
	/*    420 0x2547 */    mv r4,r7
	/*    421 0x41d2 */    ld r2,dm(r7++)
	/*    422 0x41c3 */    ld r3,dm(r7)
	/*    423 0x4046 */    ld r6,dm(r1)
	/*    424 0x4305 */    st r5,dm(r4)
	/*    425 0x43c6 */    st r6,dm(r7)
	/*    426 0x4202 */    st r2,dm(r0)
	/*    427 0x4253 */    st r3,dm(r1++)
	/*    428 0x3022 */    mvib r2,2
	/*    429 0x01d7 */    add r7,r2,r7
	/*    430 0x6ed2 */    ld r2,dm(sp-19)
	/*    431 0x0e7a */    ltu r7,r2
	/*    432 0x41e2 */    ld r2,dm(r7--)
	/*    433 0x2fef */    jcr -17
	/*    434 0x6ef1 */    ld r1,dm(sp-17)
	/*    435 0x2c0a */    jrd 10
	/*    436 0x6ee7 */    ld r7,dm(sp-18)
	/*    437 0x6ed0 */    ld r0,dm(sp-19)
	/*    438 0x41c2 */    ld r2,dm(r7)
	/*    439 0x4046 */    ld r6,dm(r1)
	/*    440 0x40c4 */    ld r4,dm(r3)
	/*    441 0x4005 */    ld r5,dm(r0)
	/*    442 0x43c6 */    st r6,dm(r7)
	/*    443 0x4204 */    st r4,dm(r0)
	/*    444 0x4242 */    st r2,dm(r1)
	/*    445 0x42c5 */    st r5,dm(r3)
	/*    446 0x3016 */    mvib r6,1
	/*    447 0x6fa2 */    ld r2,dm(sp-6)
	/*    448 0x04ca */    sub r3,r1,r2
	/*    449 0x6f35 */    ld r5,dm(sp-13)
	/*    450 0x0057 */    add r1,r2,r7
	/*    451 0x7f33 */    st r3,dm(sp-13)
	/*    452 0x2e80 */    j TGT_Fqsort_184
	/*    453 0x00b8 */    /* MW */
.label __ll7_qsort
	/*    454 0x3003 */    mvib r3,0
	/*    455 0x6ef0 */    ld r0,dm(sp-17)
	/*    456 0x1a03 */    eq r0,r3
	/*    457 0x6f30 */    ld r0,dm(sp-13)
	/*    458 0x6fd2 */    ld r2,dm(sp-3)
	/*    459 0x7ff1 */    st r1,dm(sp-1)
	/*    460 0x7f77 */    st r7,dm(sp-9)
	/*    461 0x2e90 */    jc TGT_Fqsort_594
	/*    462 0x0252 */    /* MW */
	/*    463 0x0478 */    sub r1,r7,r0
	/*    464 0x0402 */    sub r0,r0,r2
	/*    465 0x1c01 */    min r0,r0,r1
	/*    466 0x0e83 */    le r0,r3
	/*    467 0x7f91 */    st r1,dm(sp-7)
	/*    468 0x3014 */    mvib r4,1
	/*    469 0x6fe3 */    ld r3,dm(sp-2)
	/*    470 0x2f23 */    jcr 35
	/*    471 0x0478 */    sub r1,r7,r0
	/*    472 0x0e9c */    le r3,r4
	/*    473 0x2f08 */    jcr 8
	/*    474 0x0002 */    add r0,r0,r2
	/*    475 0x4083 */    ld r3,dm(r2)
	/*    476 0x4044 */    ld r4,dm(r1)
	/*    477 0x4294 */    st r4,dm(r2++)
	/*    478 0x4253 */    st r3,dm(r1++)
	/*    479 0x0e50 */    ltu r2,r0
	/*    480 0x2ff9 */    jcr -7
	/*    481 0x2e00 */    nop 
	/*    482 0x2d15 */    jr 21
	/*    483 0x1204 */    lsr r0,r0,r4
	/*    484 0x1404 */    lsl r0,r0,r4
	/*    485 0x6f23 */    ld r3,dm(sp-14)
	/*    486 0x0003 */    add r0,r0,r3
	/*    487 0x7f80 */    st r0,dm(sp-8)
	/*    488 0x2552 */    mv r5,r2
	/*    489 0x4090 */    ld r0,dm(r2++)
	/*    490 0x2531 */    mv r3,r1
	/*    491 0x4057 */    ld r7,dm(r1++)
	/*    492 0x4084 */    ld r4,dm(r2)
	/*    493 0x4046 */    ld r6,dm(r1)
	/*    494 0x4347 */    st r7,dm(r5)
	/*    495 0x4286 */    st r6,dm(r2)
	/*    496 0x42c0 */    st r0,dm(r3)
	/*    497 0x4254 */    st r4,dm(r1++)
	/*    498 0x3020 */    mvib r0,2
	/*    499 0x0082 */    add r2,r0,r2
	/*    500 0x6f80 */    ld r0,dm(sp-8)
	/*    501 0x0e50 */    ltu r2,r0
	/*    502 0x40a0 */    ld r0,dm(r2--)
	/*    503 0x2fef */    jcr -17
	/*    504 0x6ff1 */    ld r1,dm(sp-1)
	/*    505 0x2c03 */    jrd 3
	/*    506 0x6f00 */    ld r0,dm(sp-16)
	/*    507 0x6f00 */    ld r0,dm(sp-16)
	/*    508 0x6ff1 */    ld r1,dm(sp-1)
	/*    509 0x0481 */    sub r2,r0,r1
	/*    510 0x6f51 */    ld r1,dm(sp-11)
	/*    511 0x0408 */    sub r0,r1,r0
	/*    512 0x6fa3 */    ld r3,dm(sp-6)
	/*    513 0x0403 */    sub r0,r0,r3
	/*    514 0x7ff2 */    st r2,dm(sp-1)
	/*    515 0x1c90 */    min r2,r2,r0
	/*    516 0x3000 */    mvib r0,0
	/*    517 0x0e90 */    le r2,r0
	/*    518 0x3013 */    mvib r3,1
	/*    519 0x2f26 */    jcr 38
	/*    520 0x6fe0 */    ld r0,dm(sp-2)
	/*    521 0x0e83 */    le r0,r3
	/*    522 0x044a */    sub r1,r1,r2
	/*    523 0x6f70 */    ld r0,dm(sp-9)
	/*    524 0x2f08 */    jcr 8
	/*    525 0x0082 */    add r2,r0,r2
	/*    526 0x4003 */    ld r3,dm(r0)
	/*    527 0x4044 */    ld r4,dm(r1)
	/*    528 0x4214 */    st r4,dm(r0++)
	/*    529 0x4253 */    st r3,dm(r1++)
	/*    530 0x0e42 */    ltu r0,r2
	/*    531 0x2ff9 */    jcr -7
	/*    532 0x2e00 */    nop 
	/*    533 0x2d16 */    jr 22
	/*    534 0x1313 */    lsr r4,r2,r3
	/*    535 0x2520 */    mv r2,r0
	/*    536 0x4015 */    ld r5,dm(r0++)
	/*    537 0x14e3 */    lsl r3,r4,r3
	/*    538 0x0003 */    add r0,r0,r3
	/*    539 0x7fe0 */    st r0,dm(sp-2)
	/*    540 0x2531 */    mv r3,r1
	/*    541 0x4057 */    ld r7,dm(r1++)
	/*    542 0x2552 */    mv r5,r2
	/*    543 0x4090 */    ld r0,dm(r2++)
	/*    544 0x4084 */    ld r4,dm(r2)
	/*    545 0x4046 */    ld r6,dm(r1)
	/*    546 0x4347 */    st r7,dm(r5)
	/*    547 0x4286 */    st r6,dm(r2)
	/*    548 0x42c0 */    st r0,dm(r3)
	/*    549 0x4254 */    st r4,dm(r1++)
	/*    550 0x3020 */    mvib r0,2
	/*    551 0x0082 */    add r2,r0,r2
	/*    552 0x6fe0 */    ld r0,dm(sp-2)
	/*    553 0x0e50 */    ltu r2,r0
	/*    554 0x40a0 */    ld r0,dm(r2--)
	/*    555 0x2fef */    jcr -17
	/*    556 0x6f96 */    ld r6,dm(sp-7)
	/*    557 0x2c03 */    jrd 3
	/*    558 0x6fa2 */    ld r2,dm(sp-6)
	/*    559 0x6fa2 */    ld r2,dm(sp-6)
	/*    560 0x6f96 */    ld r6,dm(sp-7)
	/*    561 0x0eb2 */    le r6,r2
	/*    562 0x3007 */    mvib r7,0
	/*    563 0x2f0b */    jcr 11
	/*    564 0x2ee0 */    doi 16,LE_Fqsort_567
	/*    565 0x0237 */    /* MW */
	/*    566 0x0010 */    /* MW */
.label LE_Fqsort_567
	/*    567 0x1910 */    ds (r6,r7),r2
	/*    568 0x6fb3 */    ld r3,dm(sp-5)
	/*    569 0x6fd0 */    ld r0,dm(sp-3)
	/*    570 0x2516 */    mv r1,r6
	/*    571 0x2e98 */    cl qsort
	/*    572 0x0000 */    /* MW */
	/*    573 0x6ff6 */    ld r6,dm(sp-1)
	/*    574 0x2c02 */    jrd 2
	/*    575 0x6fa2 */    ld r2,dm(sp-6)
	/*    576 0x6ff6 */    ld r6,dm(sp-1)
	/*    577 0x0eb2 */    le r6,r2
	/*    578 0x6f51 */    ld r1,dm(sp-11)
	/*    579 0x2f0a */    jcr 10
	/*    580 0x040e */    sub r0,r1,r6
	/*    581 0x3007 */    mvib r7,0
	/*    582 0x6fb3 */    ld r3,dm(sp-5)
	/*    583 0x2ee0 */    doi 16,LE_Fqsort_586
	/*    584 0x024a */    /* MW */
	/*    585 0x0010 */    /* MW */
.label LE_Fqsort_586
	/*    586 0x1910 */    ds (r6,r7),r2
	/*    587 0x6fcb */    ld lr,dm(sp-4)
	/*    588 0x2516 */    mv r1,r6
	/*    589 0x2e80 */    j __ll1_qsort
	/*    590 0x0001 */    /* MW */
	/*    591 0x6fcb */    ld lr,dm(sp-4)
	/*    592 0x2e80 */    j TGT_Fqsort_830
	/*    593 0x033e */    /* MW */
.label TGT_Fqsort_594
	/*    594 0x6f80 */    ld r0,dm(sp-8)
	/*    595 0x6f63 */    ld r3,dm(sp-10)
	/*    596 0x6f51 */    ld r1,dm(sp-11)
	/*    597 0x2c6d */    jrd 109
	/*    598 0x6fa4 */    ld r4,dm(sp-6)
	/*    599 0x6fd2 */    ld r2,dm(sp-3)
	/*    600 0x7f73 */    st r3,dm(sp-9)
	/*    601 0x7f83 */    st r3,dm(sp-8)
	/*    602 0x2510 */    mv r1,r0
	/*    603 0x2c50 */    jrd 80
	/*    604 0x4015 */    ld r5,dm(r0++)
	/*    605 0x0454 */    sub r1,r2,r4
	/*    606 0x041c */    sub r0,r3,r4
	/*    607 0x6f77 */    ld r7,dm(sp-9)
	/*    608 0x053c */    sub r4,r7,r4
	/*    609 0x3007 */    mvib r7,0
	/*    610 0x7f74 */    st r4,dm(sp-9)
	/*    611 0x1a2f */    eq r5,r7
	/*    612 0x2f3b */    jcr 59
	/*    613 0x3014 */    mvib r4,1
	/*    614 0x6fe7 */    ld r7,dm(sp-2)
	/*    615 0x6f95 */    ld r5,dm(sp-7)
	/*    616 0x7f60 */    st r0,dm(sp-10)
	/*    617 0x7f31 */    st r1,dm(sp-13)
	/*    618 0x0ebc */    le r7,r4
	/*    619 0x2f0c */    jcr 12
	/*    620 0x6f43 */    ld r3,dm(sp-12)
	/*    621 0x00d3 */    add r3,r2,r3
	/*    622 0x6fa4 */    ld r4,dm(sp-6)
	/*    623 0x2551 */    mv r5,r1
	/*    624 0x4087 */    ld r7,dm(r2)
	/*    625 0x4146 */    ld r6,dm(r5)
	/*    626 0x4296 */    st r6,dm(r2++)
	/*    627 0x4357 */    st r7,dm(r5++)
	/*    628 0x0e53 */    ltu r2,r3
	/*    629 0x2ff9 */    jcr -7
	/*    630 0x2e00 */    nop 
	/*    631 0x2c34 */    jrd 52
	/*    632 0x6fd2 */    ld r2,dm(sp-3)
	/*    633 0x3004 */    mvib r4,0
	/*    634 0x7f25 */    st r5,dm(sp-14)
	/*    635 0x7f14 */    st r4,dm(sp-15)
	/*    636 0x2e00 */    nop 
	/*    637 0x4047 */    ld r7,dm(r1)
	/*    638 0x4084 */    ld r4,dm(r2)
	/*    639 0x40c5 */    ld r5,dm(r3)
	/*    640 0x4006 */    ld r6,dm(r0)
	/*    641 0x4287 */    st r7,dm(r2)
	/*    642 0x42c6 */    st r6,dm(r3)
	/*    643 0x4244 */    st r4,dm(r1)
	/*    644 0x4205 */    st r5,dm(r0)
	/*    645 0x3ff4 */    mvib r4,-1
	/*    646 0x6f25 */    ld r5,dm(sp-14)
	/*    647 0x01e5 */    add r7,r4,r5
	/*    648 0x6f15 */    ld r5,dm(sp-15)
	/*    649 0x0325 */    addc r4,r4,r5
	/*    650 0x7f27 */    st r7,dm(sp-14)
	/*    651 0x3025 */    mvib r5,2
	/*    652 0x3007 */    mvib r7,0
	/*    653 0x7f14 */    st r4,dm(sp-15)
	/*    654 0x0095 */    add r2,r2,r5
	/*    655 0x004d */    add r1,r1,r5
	/*    656 0x00dd */    add r3,r3,r5
	/*    657 0x0005 */    add r0,r0,r5
	/*    658 0x0f27 */    gt r4,r7
	/*    659 0x2fe8 */    jcr -24
	/*    660 0x3004 */    mvib r4,0
	/*    661 0x6f15 */    ld r5,dm(sp-15)
	/*    662 0x1a6c */    ne r5,r4
	/*    663 0x2f03 */    jcr 3
	/*    664 0x6f24 */    ld r4,dm(sp-14)
	/*    665 0x3005 */    mvib r5,0
	/*    666 0x0f65 */    gtu r4,r5
	/*    667 0x2fe0 */    jcr -32
	/*    668 0x6f60 */    ld r0,dm(sp-10)
	/*    669 0x6fa4 */    ld r4,dm(sp-6)
	/*    670 0x6fd2 */    ld r2,dm(sp-3)
	/*    671 0x2c0c */    jrd 12
	/*    672 0x6f31 */    ld r1,dm(sp-13)
	/*    673 0x40c5 */    ld r5,dm(r3)
	/*    674 0x4047 */    ld r7,dm(r1)
	/*    675 0x4006 */    ld r6,dm(r0)
	/*    676 0x4084 */    ld r4,dm(r2)
	/*    677 0x4287 */    st r7,dm(r2)
	/*    678 0x42c6 */    st r6,dm(r3)
	/*    679 0x4244 */    st r4,dm(r1)
	/*    680 0x4205 */    st r5,dm(r0)
	/*    681 0x2e00 */    nop 
	/*    682 0x6fa4 */    ld r4,dm(sp-6)
	/*    683 0x6fd2 */    ld r2,dm(sp-3)
.label __ll8_qsort
	/*    684 0x0eca */    leu r1,r2
	/*    685 0x2521 */    mv r2,r1
	/*    686 0x2530 */    mv r3,r0
	/*    687 0x6fe5 */    ld r5,dm(sp-2)
	/*    688 0x2f0c */    jcr 12
	/*    689 0x6fb0 */    ld r0,dm(sp-5)
	/*    690 0x7f33 */    st r3,dm(sp-13)
	/*    691 0x7f62 */    st r2,dm(sp-10)
	/*    692 0x2ea0 */    clid r0
	/*    693 0x2e00 */    nop 
	/*    694 0x6f71 */    ld r1,dm(sp-9)
	/*    695 0x3001 */    mvib r1,0
	/*    696 0x0f01 */    gt r0,r1
	/*    697 0x6fa4 */    ld r4,dm(sp-6)
	/*    698 0x6f33 */    ld r3,dm(sp-13)
	/*    699 0x6f62 */    ld r2,dm(sp-10)
	/*    700 0x6fe5 */    ld r5,dm(sp-2)
	/*    701 0x2f9e */    jcr -98
	/*    702 0x6f81 */    ld r1,dm(sp-8)
	/*    703 0x00cc */    add r3,r1,r4
	/*    704 0x6ff2 */    ld r2,dm(sp-1)
	/*    705 0x0014 */    add r0,r2,r4
	/*    706 0x6f51 */    ld r1,dm(sp-11)
.label __ll9_qsort
	/*    707 0x7ff0 */    st r0,dm(sp-1)
	/*    708 0x0e41 */    ltu r0,r1
	/*    709 0x2f90 */    jcr -112
	/*    710 0x2e00 */    nop 
	/*    711 0x2c76 */    jrd 118
	/*    712 0x6fcb */    ld lr,dm(sp-4)
.label TGT_Fqsort_713
	/*    713 0x6f80 */    ld r0,dm(sp-8)
	/*    714 0x6fa4 */    ld r4,dm(sp-6)
	/*    715 0x6f63 */    ld r3,dm(sp-10)
	/*    716 0x2c6d */    jrd 109
	/*    717 0x6f51 */    ld r1,dm(sp-11)
	/*    718 0x6fd2 */    ld r2,dm(sp-3)
	/*    719 0x7f73 */    st r3,dm(sp-9)
	/*    720 0x7f83 */    st r3,dm(sp-8)
	/*    721 0x2510 */    mv r1,r0
	/*    722 0x2c50 */    jrd 80
	/*    723 0x4015 */    ld r5,dm(r0++)
	/*    724 0x0454 */    sub r1,r2,r4
	/*    725 0x041c */    sub r0,r3,r4
	/*    726 0x6f77 */    ld r7,dm(sp-9)
	/*    727 0x053c */    sub r4,r7,r4
	/*    728 0x3007 */    mvib r7,0
	/*    729 0x7f74 */    st r4,dm(sp-9)
	/*    730 0x1a2f */    eq r5,r7
	/*    731 0x2f3b */    jcr 59
	/*    732 0x3014 */    mvib r4,1
	/*    733 0x6fe7 */    ld r7,dm(sp-2)
	/*    734 0x6f95 */    ld r5,dm(sp-7)
	/*    735 0x7f61 */    st r1,dm(sp-10)
	/*    736 0x7f30 */    st r0,dm(sp-13)
	/*    737 0x0ebc */    le r7,r4
	/*    738 0x2f0c */    jcr 12
	/*    739 0x6f43 */    ld r3,dm(sp-12)
	/*    740 0x00d3 */    add r3,r2,r3
	/*    741 0x6fa4 */    ld r4,dm(sp-6)
	/*    742 0x2551 */    mv r5,r1
	/*    743 0x4087 */    ld r7,dm(r2)
	/*    744 0x4146 */    ld r6,dm(r5)
	/*    745 0x4296 */    st r6,dm(r2++)
	/*    746 0x4357 */    st r7,dm(r5++)
	/*    747 0x0e53 */    ltu r2,r3
	/*    748 0x2ff9 */    jcr -7
	/*    749 0x2e00 */    nop 
	/*    750 0x2c34 */    jrd 52
	/*    751 0x6fd2 */    ld r2,dm(sp-3)
	/*    752 0x3004 */    mvib r4,0
	/*    753 0x7f25 */    st r5,dm(sp-14)
	/*    754 0x7f14 */    st r4,dm(sp-15)
	/*    755 0x2e00 */    nop 
	/*    756 0x4047 */    ld r7,dm(r1)
	/*    757 0x4084 */    ld r4,dm(r2)
	/*    758 0x40c5 */    ld r5,dm(r3)
	/*    759 0x4006 */    ld r6,dm(r0)
	/*    760 0x4287 */    st r7,dm(r2)
	/*    761 0x42c6 */    st r6,dm(r3)
	/*    762 0x4244 */    st r4,dm(r1)
	/*    763 0x4205 */    st r5,dm(r0)
	/*    764 0x3ff4 */    mvib r4,-1
	/*    765 0x6f25 */    ld r5,dm(sp-14)
	/*    766 0x01e5 */    add r7,r4,r5
	/*    767 0x6f15 */    ld r5,dm(sp-15)
	/*    768 0x0325 */    addc r4,r4,r5
	/*    769 0x7f27 */    st r7,dm(sp-14)
	/*    770 0x3025 */    mvib r5,2
	/*    771 0x3007 */    mvib r7,0
	/*    772 0x7f14 */    st r4,dm(sp-15)
	/*    773 0x0095 */    add r2,r2,r5
	/*    774 0x004d */    add r1,r1,r5
	/*    775 0x00dd */    add r3,r3,r5
	/*    776 0x0005 */    add r0,r0,r5
	/*    777 0x0f27 */    gt r4,r7
	/*    778 0x2fe8 */    jcr -24
	/*    779 0x3004 */    mvib r4,0
	/*    780 0x6f15 */    ld r5,dm(sp-15)
	/*    781 0x1a6c */    ne r5,r4
	/*    782 0x2f03 */    jcr 3
	/*    783 0x6f24 */    ld r4,dm(sp-14)
	/*    784 0x3005 */    mvib r5,0
	/*    785 0x0f65 */    gtu r4,r5
	/*    786 0x2fe0 */    jcr -32
	/*    787 0x6f61 */    ld r1,dm(sp-10)
	/*    788 0x6fa4 */    ld r4,dm(sp-6)
	/*    789 0x6fd2 */    ld r2,dm(sp-3)
	/*    790 0x2c0c */    jrd 12
	/*    791 0x6f30 */    ld r0,dm(sp-13)
	/*    792 0x40c5 */    ld r5,dm(r3)
	/*    793 0x4047 */    ld r7,dm(r1)
	/*    794 0x4006 */    ld r6,dm(r0)
	/*    795 0x4084 */    ld r4,dm(r2)
	/*    796 0x4287 */    st r7,dm(r2)
	/*    797 0x42c6 */    st r6,dm(r3)
	/*    798 0x4244 */    st r4,dm(r1)
	/*    799 0x4205 */    st r5,dm(r0)
	/*    800 0x2e00 */    nop 
	/*    801 0x6fa4 */    ld r4,dm(sp-6)
	/*    802 0x6fd2 */    ld r2,dm(sp-3)
.label __ll2_qsort
	/*    803 0x0eca */    leu r1,r2
	/*    804 0x2530 */    mv r3,r0
	/*    805 0x2521 */    mv r2,r1
	/*    806 0x6fe5 */    ld r5,dm(sp-2)
	/*    807 0x2f0c */    jcr 12
	/*    808 0x6fb0 */    ld r0,dm(sp-5)
	/*    809 0x7f33 */    st r3,dm(sp-13)
	/*    810 0x7f62 */    st r2,dm(sp-10)
	/*    811 0x2ea0 */    clid r0
	/*    812 0x2e00 */    nop 
	/*    813 0x6f71 */    ld r1,dm(sp-9)
	/*    814 0x3001 */    mvib r1,0
	/*    815 0x0f01 */    gt r0,r1
	/*    816 0x6fa4 */    ld r4,dm(sp-6)
	/*    817 0x6f33 */    ld r3,dm(sp-13)
	/*    818 0x6f62 */    ld r2,dm(sp-10)
	/*    819 0x6fe5 */    ld r5,dm(sp-2)
	/*    820 0x2f9e */    jcr -98
	/*    821 0x6f81 */    ld r1,dm(sp-8)
	/*    822 0x00cc */    add r3,r1,r4
	/*    823 0x6ff2 */    ld r2,dm(sp-1)
	/*    824 0x0014 */    add r0,r2,r4
	/*    825 0x6f51 */    ld r1,dm(sp-11)
.label __ll3_qsort
	/*    826 0x7ff0 */    st r0,dm(sp-1)
	/*    827 0x0e41 */    ltu r0,r1
	/*    828 0x2f90 */    jcr -112
	/*    829 0x6fcb */    ld lr,dm(sp-4)
.label TGT_Fqsort_830
	/*    830 0x2ec0 */    rtd 
	/*    831 0x5e90 */    addb sp, -23
.label qsort__end
	/*    832 0x2e00 */    nop 

