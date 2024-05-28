
// File generated by noodle version O-2018.09#f5599cac26#190121, Tue May 28 10:27:16 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// noodle -ps -B -Iisg +wisg -Iruntime/include -D__tct_patch__=300 -D__checkers__ tmicro

#ifdef __chess__
#error "generated native file not intended for compilation by chess"
#endif

// Primitive types and functions
// used in Checkers ISS and PDG (and possibly native)

#ifndef _tmicro_iss_types_h
#define _tmicro_iss_types_h

#include "chess.h"
#include "vbit.h"

#ifdef CHESS_NATIVE_NAMESPACE
namespace CHESS_NATIVE_NAMESPACE {
#endif

namespace tmicro_primitive {

//  Primitive types (declarations)

class word;             // property( 16 bit   signed );
class addr;             // property( 16 bit unsigned );
class nint9;            // property(  9 bit   signed max=-1 );
class sbyte;            // property(  8 bit   signed );
class ubyte;            // property(  8 bit unsigned );
class uint1;            // property(  1 bit unsigned );
class uint2;            // property(  2 bit unsigned );
class uint3;            // property(  3 bit unsigned );
class uint4;            // property(  4 bit unsigned );
class iword;            // property( 16 bit unsigned );


//  Primitive types (definitions)

class word
{
public:
    typedef VBit<16, true> BitType;
    static const int bits = BitType::bits;
    static const bool isSigned = BitType::isSigned;
    BitType val;
public:
    word() = default;
    template <int B, bool S> word(const VBit<B, S>& a) : val(a) {}
    word(const VBitWrapper& a) : val(a) {}
    template <typename DataType, int E> word(const VBitVector<DataType, E>& a) : val(a) {}
public:
    // backwards compatibility api
    word(BitType::ValueType a) : val(a) {}
    BitType::ValueType& value() { return val.value(); }
    const BitType::ValueType& value() const { return val.value(); }
    void value(const BitType::ValueType& v) { val.value(v); }
    BitType::UBaseType to_unsigned() const { return val.to_unsigned(); }
    BitType::SBaseType to_signed() const { return val.to_signed(); }
    friend std::ostream& operator<<(std::ostream& os, const word& x) { os << x.val; return os; }
    friend std::istream& operator>>(std::istream& is, word& x) { is >> x.val; return is; }
public:
    word(uint1);
    word(nint9);
    word(sbyte);
    word(addr);
    word(iword);
};
inline const word::BitType& toBitType(const word& v) { return v.val; }

class addr
{
public:
    typedef VBit<16, false> BitType;
    static const int bits = BitType::bits;
    static const bool isSigned = BitType::isSigned;
    BitType val;
public:
    addr() = default;
    template <int B, bool S> addr(const VBit<B, S>& a) : val(a) {}
    addr(const VBitWrapper& a) : val(a) {}
    template <typename DataType, int E> addr(const VBitVector<DataType, E>& a) : val(a) {}
public:
    // backwards compatibility api
    addr(BitType::ValueType a) : val(a) {}
    BitType::ValueType& value() { return val.value(); }
    const BitType::ValueType& value() const { return val.value(); }
    void value(const BitType::ValueType& v) { val.value(v); }
    BitType::UBaseType to_unsigned() const { return val.to_unsigned(); }
    BitType::SBaseType to_signed() const { return val.to_signed(); }
    friend std::ostream& operator<<(std::ostream& os, const addr& x) { os << x.val; return os; }
    friend std::istream& operator>>(std::istream& is, addr& x) { is >> x.val; return is; }
public:
    addr(word);
    addr(uint4);
};
inline const addr::BitType& toBitType(const addr& v) { return v.val; }

class nint9
{
public:
    typedef VBit<9, true> BitType;
    static const int bits = BitType::bits;
    static const bool isSigned = BitType::isSigned;
    BitType val;
public:
    nint9() = default;
    template <int B, bool S> nint9(const VBit<B, S>& a) : val(a) {}
    nint9(const VBitWrapper& a) : val(a) {}
    template <typename DataType, int E> nint9(const VBitVector<DataType, E>& a) : val(a) {}
public:
    // backwards compatibility api
    nint9(BitType::ValueType a) : val(a) {}
    BitType::ValueType& value() { return val.value(); }
    const BitType::ValueType& value() const { return val.value(); }
    void value(const BitType::ValueType& v) { val.value(v); }
    BitType::UBaseType to_unsigned() const { return val.to_unsigned(); }
    BitType::SBaseType to_signed() const { return val.to_signed(); }
    friend std::ostream& operator<<(std::ostream& os, const nint9& x) { os << x.val; return os; }
    friend std::istream& operator>>(std::istream& is, nint9& x) { is >> x.val; return is; }
public:
};
inline const nint9::BitType& toBitType(const nint9& v) { return v.val; }

class sbyte
{
public:
    typedef VBit<8, true> BitType;
    static const int bits = BitType::bits;
    static const bool isSigned = BitType::isSigned;
    BitType val;
public:
    sbyte() = default;
    template <int B, bool S> sbyte(const VBit<B, S>& a) : val(a) {}
    sbyte(const VBitWrapper& a) : val(a) {}
    template <typename DataType, int E> sbyte(const VBitVector<DataType, E>& a) : val(a) {}
public:
    // backwards compatibility api
    sbyte(BitType::ValueType a) : val(a) {}
    BitType::ValueType& value() { return val.value(); }
    const BitType::ValueType& value() const { return val.value(); }
    void value(const BitType::ValueType& v) { val.value(v); }
    BitType::UBaseType to_unsigned() const { return val.to_unsigned(); }
    BitType::SBaseType to_signed() const { return val.to_signed(); }
    friend std::ostream& operator<<(std::ostream& os, const sbyte& x) { os << x.val; return os; }
    friend std::istream& operator>>(std::istream& is, sbyte& x) { is >> x.val; return is; }
public:
};
inline const sbyte::BitType& toBitType(const sbyte& v) { return v.val; }

class ubyte
{
public:
    typedef VBit<8, false> BitType;
    static const int bits = BitType::bits;
    static const bool isSigned = BitType::isSigned;
    BitType val;
public:
    ubyte() = default;
    template <int B, bool S> ubyte(const VBit<B, S>& a) : val(a) {}
    ubyte(const VBitWrapper& a) : val(a) {}
    template <typename DataType, int E> ubyte(const VBitVector<DataType, E>& a) : val(a) {}
public:
    // backwards compatibility api
    ubyte(BitType::ValueType a) : val(a) {}
    BitType::ValueType& value() { return val.value(); }
    const BitType::ValueType& value() const { return val.value(); }
    void value(const BitType::ValueType& v) { val.value(v); }
    BitType::UBaseType to_unsigned() const { return val.to_unsigned(); }
    BitType::SBaseType to_signed() const { return val.to_signed(); }
    friend std::ostream& operator<<(std::ostream& os, const ubyte& x) { os << x.val; return os; }
    friend std::istream& operator>>(std::istream& is, ubyte& x) { is >> x.val; return is; }
public:
};
inline const ubyte::BitType& toBitType(const ubyte& v) { return v.val; }

class uint1
{
public:
    typedef VBit<1, false> BitType;
    static const int bits = BitType::bits;
    static const bool isSigned = BitType::isSigned;
    BitType val;
public:
    uint1() = default;
    template <int B, bool S> uint1(const VBit<B, S>& a) : val(a) {}
    uint1(const VBitWrapper& a) : val(a) {}
    template <typename DataType, int E> uint1(const VBitVector<DataType, E>& a) : val(a) {}
public:
    // backwards compatibility api
    uint1(BitType::ValueType a) : val(a) {}
    BitType::ValueType& value() { return val.value(); }
    const BitType::ValueType& value() const { return val.value(); }
    void value(const BitType::ValueType& v) { val.value(v); }
    BitType::UBaseType to_unsigned() const { return val.to_unsigned(); }
    BitType::SBaseType to_signed() const { return val.to_signed(); }
    friend std::ostream& operator<<(std::ostream& os, const uint1& x) { os << x.val; return os; }
    friend std::istream& operator>>(std::istream& is, uint1& x) { is >> x.val; return is; }
public:
};
inline const uint1::BitType& toBitType(const uint1& v) { return v.val; }

class uint2
{
public:
    typedef VBit<2, false> BitType;
    static const int bits = BitType::bits;
    static const bool isSigned = BitType::isSigned;
    BitType val;
public:
    uint2() = default;
    template <int B, bool S> uint2(const VBit<B, S>& a) : val(a) {}
    uint2(const VBitWrapper& a) : val(a) {}
    template <typename DataType, int E> uint2(const VBitVector<DataType, E>& a) : val(a) {}
public:
    // backwards compatibility api
    uint2(BitType::ValueType a) : val(a) {}
    BitType::ValueType& value() { return val.value(); }
    const BitType::ValueType& value() const { return val.value(); }
    void value(const BitType::ValueType& v) { val.value(v); }
    BitType::UBaseType to_unsigned() const { return val.to_unsigned(); }
    BitType::SBaseType to_signed() const { return val.to_signed(); }
    friend std::ostream& operator<<(std::ostream& os, const uint2& x) { os << x.val; return os; }
    friend std::istream& operator>>(std::istream& is, uint2& x) { is >> x.val; return is; }
public:
};
inline const uint2::BitType& toBitType(const uint2& v) { return v.val; }

class uint3
{
public:
    typedef VBit<3, false> BitType;
    static const int bits = BitType::bits;
    static const bool isSigned = BitType::isSigned;
    BitType val;
public:
    uint3() = default;
    template <int B, bool S> uint3(const VBit<B, S>& a) : val(a) {}
    uint3(const VBitWrapper& a) : val(a) {}
    template <typename DataType, int E> uint3(const VBitVector<DataType, E>& a) : val(a) {}
public:
    // backwards compatibility api
    uint3(BitType::ValueType a) : val(a) {}
    BitType::ValueType& value() { return val.value(); }
    const BitType::ValueType& value() const { return val.value(); }
    void value(const BitType::ValueType& v) { val.value(v); }
    BitType::UBaseType to_unsigned() const { return val.to_unsigned(); }
    BitType::SBaseType to_signed() const { return val.to_signed(); }
    friend std::ostream& operator<<(std::ostream& os, const uint3& x) { os << x.val; return os; }
    friend std::istream& operator>>(std::istream& is, uint3& x) { is >> x.val; return is; }
public:
};
inline const uint3::BitType& toBitType(const uint3& v) { return v.val; }

class uint4
{
public:
    typedef VBit<4, false> BitType;
    static const int bits = BitType::bits;
    static const bool isSigned = BitType::isSigned;
    BitType val;
public:
    uint4() = default;
    template <int B, bool S> uint4(const VBit<B, S>& a) : val(a) {}
    uint4(const VBitWrapper& a) : val(a) {}
    template <typename DataType, int E> uint4(const VBitVector<DataType, E>& a) : val(a) {}
public:
    // backwards compatibility api
    uint4(BitType::ValueType a) : val(a) {}
    BitType::ValueType& value() { return val.value(); }
    const BitType::ValueType& value() const { return val.value(); }
    void value(const BitType::ValueType& v) { val.value(v); }
    BitType::UBaseType to_unsigned() const { return val.to_unsigned(); }
    BitType::SBaseType to_signed() const { return val.to_signed(); }
    friend std::ostream& operator<<(std::ostream& os, const uint4& x) { os << x.val; return os; }
    friend std::istream& operator>>(std::istream& is, uint4& x) { is >> x.val; return is; }
public:
};
inline const uint4::BitType& toBitType(const uint4& v) { return v.val; }

class iword
{
public:
    typedef VBit<16, false> BitType;
    static const int bits = BitType::bits;
    static const bool isSigned = BitType::isSigned;
    BitType val;
public:
    iword() = default;
    template <int B, bool S> iword(const VBit<B, S>& a) : val(a) {}
    iword(const VBitWrapper& a) : val(a) {}
    template <typename DataType, int E> iword(const VBitVector<DataType, E>& a) : val(a) {}
public:
    // backwards compatibility api
    iword(BitType::ValueType a) : val(a) {}
    BitType::ValueType& value() { return val.value(); }
    const BitType::ValueType& value() const { return val.value(); }
    void value(const BitType::ValueType& v) { val.value(v); }
    BitType::UBaseType to_unsigned() const { return val.to_unsigned(); }
    BitType::SBaseType to_signed() const { return val.to_signed(); }
    friend std::ostream& operator<<(std::ostream& os, const iword& x) { os << x.val; return os; }
    friend std::istream& operator>>(std::istream& is, iword& x) { is >> x.val; return is; }
public:
    iword(word);
};
inline const iword::BitType& toBitType(const iword& v) { return v.val; }


//  Conversions

inline word::word(uint1 a)               { val = toVBit(a); }
inline word::word(nint9 a)               { val = toVBit(a); }
inline word::word(sbyte a)               { val = toVBit(a); }
inline word::word(addr a)                { val = toVBit(a); }
inline word::word(iword a)               { val = toVBit(a); }

inline addr::addr(word a)                { val = toVBit(a); }
inline addr::addr(uint4 a)               { val = toVBit(a); }

inline iword::iword(word a)              { val = toVBit(a); }


//  Operations

checkers_import_export /*primitive*/ word add(word, word);
checkers_import_export /*primitive*/ word add(word, word, uint1 &);
checkers_import_export /*primitive*/ word addc(word, word, uint1, uint1 &);
checkers_import_export /*primitive*/ word sub(word, word, uint1 &);
checkers_import_export /*primitive*/ word subb(word, word, uint1, uint1 &);
checkers_import_export /*primitive*/ word andw(word, word);
checkers_import_export /*primitive*/ word orw(word, word);
checkers_import_export /*primitive*/ word xorw(word, word);

checkers_import_export /*primitive*/ word minw(word, word);
checkers_import_export /*primitive*/ word maxw(word, word);
checkers_import_export /*primitive*/ word select(bool, word, word);
checkers_import_export /*primitive*/ word ext_abs(word);

checkers_import_export /*primitive*/ bool lts(word, word);
checkers_import_export /*primitive*/ bool ltu(word, word);
checkers_import_export /*primitive*/ bool les(word, word);
checkers_import_export /*primitive*/ bool leu(word, word);
checkers_import_export /*primitive*/ bool gts(word, word);
checkers_import_export /*primitive*/ bool gtu(word, word);
checkers_import_export /*primitive*/ bool ges(word, word);
checkers_import_export /*primitive*/ bool geu(word, word);
checkers_import_export /*primitive*/ bool eq(word, word);
checkers_import_export /*primitive*/ bool ne(word, word);

checkers_import_export /*primitive*/ word complement(word);
checkers_import_export /*primitive*/ word extend_sign(word);

checkers_import_export /*primitive*/ word asr(word, word);
checkers_import_export /*primitive*/ word lsr(word, word);
checkers_import_export /*primitive*/ word lsl(word, word);

checkers_import_export /*primitive*/ void mulss(word, word, word &, word &);
checkers_import_export /*primitive*/ void muluu(word, word, word &, word &);
checkers_import_export /*primitive*/ void divstep(word, word, word, word &, word &);

//cntrl:  checkers_import_export /*primitive*/ void jump(sbyte);
//cntrl:  checkers_import_export /*primitive*/ void jump(addr);
//cntrl:  checkers_import_export /*primitive*/ addr jti(addr);
//cntrl:  checkers_import_export /*primitive*/ void jump(bool, sbyte);
//cntrl:  checkers_import_export /*primitive*/ void jump(bool, addr);
//cntrl:  checkers_import_export /*primitive*/ void ret(addr);
//cntrl:  checkers_import_export /*primitive*/ addr bsr(addr);
//cntrl:  checkers_import_export /*primitive*/ void hwdo(addr, addr);

checkers_import_export /*primitive*/ uint2 incr(uint2);

checkers_import_export /*primitive*/ uint2 decr(uint2);

//cntrl:  checkers_import_export /*primitive*/ void rti(addr);
//cntrl:  checkers_import_export /*primitive*/ void halt();

checkers_import_export /*primitive*/ void nop();


} //namespace tmicro_primitive
#ifdef CHESS_NATIVE_NAMESPACE
} //namespace CHESS_NATIVE_NAMESPACE
#endif

#endif /*_tmicro_iss_types_h*/