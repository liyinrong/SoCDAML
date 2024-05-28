
// File generated by noodle version O-2018.09#f5599cac26#190121, Tue May 28 10:41:29 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// noodle -Pc -B -Iisg +wisg -Iruntime/include -D__tct_patch__=300 -D__chess__ -D__programmers_view__ tmicro

// File: simple_function.c
// Test empty function (return only) and simple function call (without arguments)
// (requires spilling of the link register)

extern "C" {

void empty_function() { }

void simple_function_call()
{
    empty_function();  // nested call
    empty_function();  // tail call (may be replaced by jump)
}

void indirect_function_call(void (*fnptr)())
{
    fnptr();  // nested call
    fnptr();  // tail call (may be replaced by indirect jump)
}


} //extern "C"  (3 functions)