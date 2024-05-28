
// File generated by noodle version O-2018.09#f5599cac26#190121, Tue May 28 12:03:13 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// noodle -Pc -B -Iisg +wisg -Iruntime/include -D__tct_patch__=300 -D__chess__ -D__programmers_view__ tzscale

#ifdef __chess__
#error "generated native file not intended for compilation by chess"
#endif

// Native equivalent of Chess promoted operations

#include "tzscale_iss_types.h"
#include "tzscale_chess_types.h"
#include "tzscale_inline_primitives.h"
#include "tzscale_chess_opns.h"

#ifndef CHESS_NATIVE_LINKAGE
#define CHESS_NATIVE_LINKAGE
#endif

#ifdef CHESS_NATIVE_NAMESPACE
namespace CHESS_NATIVE_NAMESPACE {
#endif

#if 0//!
namespace tzscale_primitive{
    CHESS_NATIVE_LINKAGE dint to_dint_se(int i)
    {
     return dint(i,i >> 31);
    }
} //namespace tzscale_primitive
#endif//!

#if 0//!
namespace tzscale_primitive{
    CHESS_NATIVE_LINKAGE dint to_dint_ze(int i)
    {
     return dint(i,0);
    }
} //namespace tzscale_primitive
#endif//!

#if 0//!
namespace tzscale_primitive{
    CHESS_NATIVE_LINKAGE int to_int(dint w)
    {
     return w.low;
    }
} //namespace tzscale_primitive
#endif//!

namespace tzscale_primitive{
CHESS_NATIVE_LINKAGE unsigned add(unsigned a0, unsigned a1)
{
    w32 p0 = a0;
    w32 p1 = a1;
    w32 t = add(p0, p1);
    unsigned r; r = toVBit(t).value();
    return r;
}
} //namespace tzscale_primitive

namespace tzscale_primitive{
CHESS_NATIVE_LINKAGE unsigned sub(unsigned a0, unsigned a1)
{
    w32 p0 = a0;
    w32 p1 = a1;
    w32 t = sub(p0, p1);
    unsigned r; r = toVBit(t).value();
    return r;
}
} //namespace tzscale_primitive

#if 0//!
namespace tzscale_primitive{
    CHESS_NATIVE_LINKAGE dint l_add(dint a, dint b)
    {
     dint r;
     uint1 carry; uint1 carry2;
     if (chess_manifest(a.low == 0))
      {
       r.low = b.low;
       r.high = a.high + b.high;
      }
     else
      if (chess_manifest(b.low == 0))
       {
        r.low = a.low;
        r.high = a.high + b.high;
       }
      else
       {
        r.low = add(a.low,b.low);
        r.high = add(a.high,b.high);
        r.high = r.high + (r.low < a.low);
       }
     return r;
    }
} //namespace tzscale_primitive
#endif//!

#if 0//!
namespace tzscale_primitive{
    CHESS_NATIVE_LINKAGE dint l_sub(dint a, dint b)
    {
     dint r;
     uint1 borrow; uint1 borrow2;
     if (chess_manifest(b.low == 0))
      {
       r.low = a.low;
       r.high = a.high - b.high;
      }
     else
      {
       r.low = sub(a.low,b.low);
       r.high = sub(a.high,b.high);
       r.high = r.high - (a.low < b.low);
      }
     return r;
    }
} //namespace tzscale_primitive
#endif//!

#if 0//!
namespace tzscale_primitive{
    CHESS_NATIVE_LINKAGE dint l_and(dint a, dint b)
    {
     return dint(a.low & b.low,a.high & b.high);
    }
} //namespace tzscale_primitive
#endif//!

#if 0//!
namespace tzscale_primitive{
    CHESS_NATIVE_LINKAGE dint l_or(dint a, dint b)
    {
     return dint(a.low | b.low,a.high | b.high);
    }
} //namespace tzscale_primitive
#endif//!

#if 0//!
namespace tzscale_primitive{
    CHESS_NATIVE_LINKAGE dint l_xor(dint a, dint b)
    {
     return dint(a.low ^ b.low,a.high ^ b.high);
    }
} //namespace tzscale_primitive
#endif//!

#if 0//!
namespace tzscale_primitive{
    CHESS_NATIVE_LINKAGE dint l_complement(dint a)
    {
     return dint(~a.low,~a.high);
    }
} //namespace tzscale_primitive
#endif//!

namespace tzscale_primitive{
CHESS_NATIVE_LINKAGE unsigned mulhu(unsigned a0, unsigned a1)
{
    w32 p0 = a0;
    w32 p1 = a1;
    w32 t = mulhu(p0, p1);
    unsigned r; r = toVBit(t).value();
    return r;
}
} //namespace tzscale_primitive

namespace tzscale_primitive{
CHESS_NATIVE_LINKAGE unsigned mul(unsigned a0, unsigned a1)
{
    w32 p0 = a0;
    w32 p1 = a1;
    w32 t = mul(p0, p1);
    unsigned r; r = toVBit(t).value();
    return r;
}
} //namespace tzscale_primitive

#if 0//!
namespace tzscale_primitive{
    CHESS_NATIVE_LINKAGE dint l_mul(dint a, dint b)
    {
     unsigned p1lo = 0; unsigned p1hi = 0;
     unsigned p2lo = 0; unsigned p2hi = 0;
     unsigned p3lo = 0; unsigned p3hi = 0;
     if (!chess_manifest(a.low == 0 || b.low == 0))
      p1lo = mul(a.low,b.low);
     else
      ;
     if (!chess_manifest(a.low == 0 || b.low == 0))
      p1hi = mulhu(a.low,b.low);
     else
      ;
     if (!chess_manifest(a.high == 0 || b.low == 0))
      p2lo = mul(a.high,b.low);
     else
      ;
     if (!chess_manifest(b.high == 0 || a.low == 0))
      p3lo = mul(b.high,a.low);
     else
      ;
     return dint(p1lo,p1hi + p2lo + p3lo);
    }
} //namespace tzscale_primitive
#endif//!

#if 0//!
namespace tzscale_primitive{
    CHESS_NATIVE_LINKAGE bool l_lts(dint a, dint b)
    {
     if ((int)a.high < (int)b.high)
      return true;
     else
      if (a.high == b.high)
       return a.low < b.low;
      else
       return false;
    }
} //namespace tzscale_primitive
#endif//!

#if 0//!
namespace tzscale_primitive{
    CHESS_NATIVE_LINKAGE bool l_les(dint a, dint b)
    {
     if ((int)a.high < (int)b.high)
      return true;
     else
      if (a.high == b.high)
       return a.low <= b.low;
      else
       return false;
    }
} //namespace tzscale_primitive
#endif//!

#if 0//!
namespace tzscale_primitive{
    CHESS_NATIVE_LINKAGE bool l_ltu(dint a, dint b)
    {
     if ((unsigned)a.high < (unsigned)b.high)
      return true;
     else
      if (a.high == b.high)
       return a.low < b.low;
      else
       return false;
    }
} //namespace tzscale_primitive
#endif//!

#if 0//!
namespace tzscale_primitive{
    CHESS_NATIVE_LINKAGE bool l_leu(dint a, dint b)
    {
     if ((unsigned)a.high < (unsigned)b.high)
      return true;
     else
      if (a.high == b.high)
       return a.low <= b.low;
      else
       return false;
    }
} //namespace tzscale_primitive
#endif//!

#if 0//!
namespace tzscale_primitive{
    CHESS_NATIVE_LINKAGE bool l_eq(dint a, dint b)
    {
     return a.high == b.high && a.low == b.low;
    }
} //namespace tzscale_primitive
#endif//!

#if 0//!
namespace tzscale_primitive{
    CHESS_NATIVE_LINKAGE bool l_ne(dint a, dint b)
    {
     return a.high != b.high || a.low != b.low;
    }
} //namespace tzscale_primitive
#endif//!

#if 0//!
namespace tzscale_primitive{
    CHESS_NATIVE_LINKAGE dint l_lsl(dint a, int f)
    {
     unsigned carries;
     dint r;
     if (f == 0)
      return a;
     else
      ;
     if (f < 32)
      {
       carries = a.low >> 32 - f;
       r.low = chess_dont_warn_range(a.low << f);
       r.high = chess_dont_warn_range(a.high << f) | carries;
      }
     else
      {
       carries = a.low << f - 32;
       r.low = 0;
       r.high = carries;
      }
     return r;
    }
} //namespace tzscale_primitive
#endif//!

#if 0//!
namespace tzscale_primitive{
    CHESS_NATIVE_LINKAGE dint l_asr(dint a, int f)
    {
     unsigned carries;
     dint r;
     if (f == 0)
      return a;
     else
      ;
     if (f < 32)
      {
       carries = a.high << 32 - f;
       r.low = chess_dont_warn_range(a.low >> f) | carries;
       r.high = chess_dont_warn_range((int)a.high >> f);
      }
     else
      {
       carries = (int)a.high >> f - 32;
       r.low = carries;
       r.high = (int)carries >> 31;
      }
     return r;
    }
} //namespace tzscale_primitive
#endif//!

#if 0//!
namespace tzscale_primitive{
    CHESS_NATIVE_LINKAGE dint l_lsr(dint a, int f)
    {
     unsigned carries;
     dint r;
     if (f == 0)
      return a;
     else
      ;
     if (f < 32)
      {
       carries = a.high << 32 - f;
       r.low = chess_dont_warn_range(a.low >> f) | carries;
       r.high = chess_dont_warn_range(a.high >> f);
      }
     else
      {
       carries = a.high >> f - 32;
       r.low = carries;
       r.high = 0;
      }
     return r;
    }
} //namespace tzscale_primitive
#endif//!

CHESS_NATIVE_LINKAGE int ext_mac_(int a0, int a1, int a2)
{
    tzscale_primitive::w32 p0 = a0;
    tzscale_primitive::w32 p1 = a1;
    tzscale_primitive::w32 p2 = a2;
    tzscale_primitive::w32 t = tzscale_primitive::mac(p0, p1, p2);
    int r; r = toVBit(t).value();
    return r;
}

CHESS_NATIVE_LINKAGE int operator*(v2short a0, v2short a1)
{
    tzscale_primitive::w32 p0 = toVBit(a0);
    tzscale_primitive::w32 p1 = toVBit(a1);
    tzscale_primitive::w32 t = tzscale_primitive::dotp(p0, p1);
    int r; r = toVBit(t).value();
    return r;
}

CHESS_NATIVE_LINKAGE int ext_dotp_(v2short a0, v2short a1, int a2)
{
    tzscale_primitive::w32 p0 = toVBit(a0);
    tzscale_primitive::w32 p1 = toVBit(a1);
    tzscale_primitive::w32 p2 = a2;
    tzscale_primitive::w32 t = tzscale_primitive::sdotp(p0, p1, p2);
    int r; r = toVBit(t).value();
    return r;
}


#ifdef CHESS_NATIVE_NAMESPACE
} //namespace CHESS_NATIVE_NAMESPACE
#endif