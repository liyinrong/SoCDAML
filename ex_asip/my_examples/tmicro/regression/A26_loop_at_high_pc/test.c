/*
-- Test hardware loop instructions located at high PC value.
-- Copyright (c) 2014-2016 Synopsys, Inc. This Synopsys processor model 
-- captures an ASIP Designer Design Technique. The model and all associated 
-- documentation are proprietary to Synopsys, Inc. and may only be used 
-- pursuant to the terms and conditions of a written license agreement with 
-- Synopsys, Inc.  All other use, reproduction, modification, or distribution 
-- of the Synopsys processor model or the associated  documentation is 
-- strictly prohibited. 
*/




#ifdef __chess__
assembly void test_doi() chess_storage(PM:0xfff0)
{
    asm_begin
    asm_text
	mvib r0,10 
	mvib r1,1 
	mvib r2,2 
	mvib r3,3 
	mvib r4,4 
	nop
	nop
        // loop of size 2 with count of 3
	doi 3,Laa
	add r0,r0,r1
	add r0,r0,r2
.chess_report __sint    // 13, 16, 19
.eol
Laa:	nop
        rt
    asm_end
}
#else
inline void test_doi() 
{
        chess_message( "// test_doi()" );
	chess_report(13);
	chess_report(16);
	chess_report(19);
}
#endif

#ifdef __chess__
assembly void test_do() chess_storage(PM:0x6666) clobbers_not(LR)
{
    asm_begin
    asm_text
	mvib r0,10 
	mvib r1,1 
	mvib r2,2 
	mvib r3,3 
	mvib r4,4 
	mvib r5,3 
	nop
	nop
        // loop of size 3 with count of 3
	do r5,Lba
        add r0,r0,r1    // delay slot
	add r0,r0,r2
.chess_report __sint    // 13, 15, 17
        nop             // avoid .chess_report breakpoint on .eol
.eol
Lba:	nop
	add r0,r0,r4
	nop
        // loop of size 1 with count of 3
	do r5,Lbb
        add r0,r0,r3    // delay slot
.eol
Lbb:	add r0,r0,r1
.chess_report __sint    // 27
	nop
	mvib r5,1 
	nop
        // loop of size 1 with count of 1
	do r5,Lbc
        add r0,r0,r3    // delay slot
.eol
Lbc:	add r0,r0,r1
.chess_report __sint    // 31
	nop
	add r0,r0,r4
.chess_report __sint    // 35
        nop
        rt
    asm_end
}
#else
inline void test_do() 
{
        chess_message( "// test_do()" );
	chess_report(13);
	chess_report(15);
	chess_report(17);
	chess_report(27);
	chess_report(31);
	chess_report(35);
}
#endif

#ifdef __chess__
assembly void test_nested_doi() chess_storage(PM:0xa000)clobbers_not(LR)
{
    asm_begin
    asm_text
	mvib r0,10 
	mvib r1,1 
	mvib r2,2 
	mvib r3,3 
	mvib r4,4 
	nop
	nop
        // outer loop with count of 3
	doi 3,Lcb
	add r0,r0,r1
        // inner loop with count of 1
        doi 2,Lca
	add r0,r0,r1
    	add r0,r0,r2
.chess_report __sint    //  14,17, 25,28, 36,39
        nop             // avoid .chess_report breakpoint on .eol
.eol
Lca:	nop
	add r0,r0,r4
.chess_report __sint    //  21, 32, 43
        nop             // avoid .chess_report breakpoint on .eol
.eol
Lcb:	nop
	add r0,r0,r4
.chess_report __sint    // 47
	nop
	mvib r0,100 
        // outer loop with count of 1
	doi 1,Lcd
        // inner loop with count of 1
        doi 1,Lcc
.eol
Lcc:	add r0,r0,r4
.eol
Lcd:    add r0,r0,r1
.chess_report __sint    // 105
     	nop
	add r0,r0,r4
.chess_report __sint    // 109
        nop
        rt
    asm_end
}
#else
inline void test_nested_doi() 
{
        chess_message( "// test_nested_doi()" );
	chess_report(14);
	chess_report(17);
	chess_report(21);
	chess_report(25);
	chess_report(28);
	chess_report(32);
	chess_report(36);
	chess_report(39);
	chess_report(43);
	chess_report(47);
	chess_report(105);
	chess_report(109);
}
#endif

#ifdef __chess__
assembly void test_nested_do() chess_storage(PM:0xcdef) clobbers_not(LR)
{
    asm_begin
    asm_text
	mvib r0,10 
	mvib r1,1 
	mvib r2,2 
	mvib r3,3 
	mvib r4,4 
	mvib r5,2 
	mvib r6,3 
	nop
	nop
        // outer loop with count of 2
	do r5,Ldb
        add r0,r0,r1    // delay slot
        // inner loop with count of 3
        do r6,Lda
        add r0,r0,r1    // delay slot
    	add r0,r0,r2
.chess_report __sint    // 14,16,18 25,27,29
        nop             // avoid .chess_report breakpoint on .eol
.eol
Lda:	nop
	add r0,r0,r4
.chess_report __sint    // 22, 33
        nop             // avoid .chess_report breakpoint on .eol
.eol
Ldb:	nop
	add r0,r0,r4
.chess_report __sint    // 37
	nop
	mvib r5,1 
	mvib r6,1 
	mvib r0,100 
        // outer loop with count of 1
	do r5,Ldd
	add r0,r0,r4    // delay slot
        // inner loop with count of 1
        do r6,Ldc
        add r0,r0,r4    // delay slot
.eol
Ldc:    add r0,r0,r1
.eol
Ldd:    add r0,r0,r1
.chess_report __sint    // 110
     	nop
	add r0,r0,r4
.chess_report __sint    // 114
        nop
        rt
    asm_end
}
#else
inline void test_nested_do() 
{
        chess_message( "// test_nested_do()" );
	chess_report(14);
	chess_report(16);
	chess_report(18);
	chess_report(22);
	chess_report(25);
	chess_report(27);
	chess_report(29);
	chess_report(33);
	chess_report(37);
	chess_report(110);
	chess_report(114);
}
#endif


int main()
{
    test_doi();
    test_do();
    test_nested_doi();
    test_nested_do();
    return 0;
}
