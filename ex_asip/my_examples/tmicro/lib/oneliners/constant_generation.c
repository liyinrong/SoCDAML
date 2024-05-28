
// File generated by noodle version O-2018.09#f5599cac26#190121, Tue May 28 10:41:29 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// noodle -Pc -B -Iisg +wisg -Iruntime/include -D__tct_patch__=300 -D__chess__ -D__programmers_view__ tmicro

// File: constant_generation.c
// Test constant generation

extern "C" {

//-- int                        // property( 16 bit   signed )

int                 ctgen___sint_0000() { return 0; }
int                 ctgen___sint_0009() { return 9; }
int                 ctgen___sint_fff7() { return -9; }
int                 ctgen___sint_32b1() { return 12977; }
int                 ctgen___sint_b2b1() { return -19791; }

//-- unsigned                   // property( 16 bit unsigned )

unsigned            ctgen___uint_0000() { return 0; }
unsigned            ctgen___uint_0009() { return 9; }
unsigned            ctgen___uint_fff7() { return 65527U; }
unsigned            ctgen___uint_32b1() { return 12977; }
unsigned            ctgen___uint_b2b1() { return 45745U; }

//-- long                       // property( 32 bit   signed )

long                ctgen___slong_00000000() { return 0; }
long                ctgen___slong_00000009() { return 9; }
long                ctgen___slong_fffffff7() { return -9; }
long                ctgen___slong_34b3b2b1() { return 884191921; }
long                ctgen___slong_b4b3b2b1() { return -1263291727; }

//-- unsigned long              // property( 32 bit unsigned )

unsigned long       ctgen___ulong_00000000() { return 0; }
unsigned long       ctgen___ulong_00000009() { return 9; }
unsigned long       ctgen___ulong_fffffff7() { return 4294967287U; }
unsigned long       ctgen___ulong_34b3b2b1() { return 884191921; }
unsigned long       ctgen___ulong_b4b3b2b1() { return 3031675569U; }

//-- long long                  // property( 64 bit   signed )

long long           ctgen___slonglong_0000000000000000() { return 0; }
long long           ctgen___slonglong_0000000000000009() { return 9; }
long long           ctgen___slonglong_fffffffffffffff7() { return -9; }
long long           ctgen___slonglong_38b7b6b5b4b3b2b1() { return 4086936078399025841; }
long long           ctgen___slonglong_b8b7b6b5b4b3b2b1() { return -5136435958455749967; }

//-- unsigned long long         // property( 64 bit unsigned )

unsigned long long  ctgen___ulonglong_0000000000000000() { return 0; }
unsigned long long  ctgen___ulonglong_0000000000000009() { return 9; }
unsigned long long  ctgen___ulonglong_fffffffffffffff7() { return 18446744073709551607U; }
unsigned long long  ctgen___ulonglong_38b7b6b5b4b3b2b1() { return 4086936078399025841; }
unsigned long long  ctgen___ulonglong_b8b7b6b5b4b3b2b1() { return 13310308115253801649U; }



// Relocatable addresses, range determined by memory
// (Type of object is irrelevant, but must be allocatable, so using the primitive type)

extern tmicro_primitive::iword chess_storage(PM) o_PM;
void chess_storage(PM) * ctptr_PM() { return &o_PM; }

extern tmicro_primitive::word chess_storage(DM) o_DM;
void chess_storage(DM) * ctptr_DM() { return &o_DM; }


} //extern "C"  (32 functions)