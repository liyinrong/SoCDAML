
// File generated by pdg version O-2018.09#f5599cac26#190121, Tue May 28 12:03:21 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// pdg -P -B -Iisg +wisg -Iruntime/include -D__tct_patch__=300 -D__checkers__ tzscale

#ifndef TZSCALE_INLINE_PRIMITIVES_H
#define TZSCALE_INLINE_PRIMITIVES_H

#ifdef __checkers__
#include "Mdl_tzscale.h"

#include "checkers_errors.h"
#endif // __checkers__

#include <sstream>

#include <iostream>
#include <cstdlib>
#ifndef PDG_NATIVE_HANDLE_ERR
#define PDG_NATIVE_HANDLE_ERR(msg, loc) \
  std::cerr << "An error occurred: " << msg << " at: " << loc << std::endl; \
  std::cerr << "Exiting.." << std::endl; \
  exit(1);
#endif

#ifndef PDG_NATIVE_HANDLE_WRN
#define PDG_NATIVE_HANDLE_WRN(msg, loc) \
  std::cerr << "Warning: " << msg << " at: " << loc << std::endl;
#endif

namespace tzscale_primitive {

    const int controller_module_id = 0;
    const int div_module_id = 1;
    const int dm_in_module_id = 2;

    inline tzscale_primitive::w32 add(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        return (a.val + b.val);
    }

    inline tzscale_primitive::w32 sub(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        VBit<33, false> aa = VBit<33, false>(VBit<32, false>(a.val));
        VBit<33, false> bb = VBit<33, false>(VBit<32, false>(b.val));
        VBit<33, false> rr = (aa - bb);
        return tzscale_primitive::w32(VBit<32, false>(rr.extract(0x1Fu, 0x0u)));
    }

    inline tzscale_primitive::w32 mul(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        return tzscale_primitive::w32((a.val * b.val));
    }

    inline tzscale_primitive::w32 mac(tzscale_primitive::w32 a, tzscale_primitive::w32 b, tzscale_primitive::w32 c) {
        return tzscale_primitive::w32((VBit<64, true>(c.val) + (a.val * b.val)));
    }

    inline tzscale_primitive::w32 dotp(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        VBit<16, true> a0 = VBit<16, true>(a.val.extract(0xFu, 0x0u));
        VBit<16, true> a1 = VBit<16, true>(a.val.extract(0x1Fu, 0x10u));
        VBit<16, true> b0 = VBit<16, true>(b.val.extract(0xFu, 0x0u));
        VBit<16, true> b1 = VBit<16, true>(b.val.extract(0x1Fu, 0x10u));
        VBit<32, true> ab0 = (a0 * b0);
        VBit<32, true> ab1 = (a1 * b1);
        VBit<32, true> p = (ab0 + ab1);
        return p;
    }

    inline tzscale_primitive::w32 sdotp(tzscale_primitive::w32 a, tzscale_primitive::w32 b, tzscale_primitive::w32 c) {
        VBit<32, true> p = dotp(a, b).val;
        VBit<32, true> s = (c.val + p);
        return s;
    }

    inline tzscale_primitive::w32 mulh(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        VBit<64, true> p = (a.val * b.val);
        return VBit<32, true>(p.extract(0x3Fu, 0x20u));
    }

    inline tzscale_primitive::w32 mulhsu(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        VBit<64, true> p = (a.val * VBit<32, false>(b.val));
        return VBit<32, true>(p.extract(0x3Fu, 0x20u));
    }

    inline tzscale_primitive::w32 mulhu(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        VBit<64, true> p = VBit<64, true>((VBit<32, false>(a.val) * VBit<32, false>(b.val)));
        return VBit<32, true>(p.extract(0x3Fu, 0x20u));
    }

    inline tzscale_primitive::w32 band(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        return (a.val & b.val);
    }

    inline tzscale_primitive::w32 bor(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        return (a.val | b.val);
    }

    inline tzscale_primitive::w32 bxor(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        return (a.val ^ b.val);
    }

    inline tzscale_primitive::w32 slt(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        return tzscale_primitive::w32((a.val < b.val));
    }

    inline bool eq(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        return (a.val == b.val);
    }

    inline bool ne(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        return (a.val != b.val);
    }

    inline bool lt(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        return (a.val < b.val);
    }

    inline bool ge(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        return (a.val >= b.val);
    }

    inline bool ltu(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        return (VBit<32, false>(a.val) < VBit<32, false>(b.val));
    }

    inline bool geu(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        return (VBit<32, false>(a.val) >= VBit<32, false>(b.val));
    }

    inline tzscale_primitive::w32 sltu(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        return tzscale_primitive::w32((VBit<32, false>(a.val) < VBit<32, false>(b.val)));
    }

    inline tzscale_primitive::w32 sra(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        return (a.val >> VBit<5, false>(VBit<5, true>(b.val.extract(0x4u, 0x0u))));
    }

    inline tzscale_primitive::w32 sll(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        return tzscale_primitive::w32((VBit<32, false>(a.val) << VBit<5, false>(VBit<5, true>(b.val.extract(0x4u, 0x0u)))));
    }

    inline tzscale_primitive::w32 srl(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        return tzscale_primitive::w32((VBit<32, false>(a.val) >> VBit<5, false>(VBit<5, true>(b.val.extract(0x4u, 0x0u)))));
    }

    inline tzscale_primitive::w32 extend_sign(tzscale_primitive::w08 a) {
        return tzscale_primitive::w32(a.val);
    }

    inline tzscale_primitive::w32 extend_zero(tzscale_primitive::w08 a) {
        return tzscale_primitive::w32(VBit<8, false>(a.val));
    }

    inline tzscale_primitive::w32 extend_sign(tzscale_primitive::w16 a) {
        return tzscale_primitive::w32(a.val);
    }

    inline tzscale_primitive::w32 extend_zero(tzscale_primitive::w16 a) {
        return tzscale_primitive::w32(VBit<16, false>(a.val));
    }

    inline tzscale_primitive::w08 extract_w08(tzscale_primitive::w32 a) {
        return VBit<8, true>(a.val.extract(0x7u, 0x0u));
    }

    inline tzscale_primitive::w16 extract_w16(tzscale_primitive::w32 a) {
        return VBit<16, true>(a.val.extract(0xFu, 0x0u));
    }

    inline void nop() {
    }

    inline tzscale_primitive::w32 divs(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        return (a.val / b.val);
    }

    inline tzscale_primitive::w32 rems(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        return (a.val % b.val);
    }

    inline tzscale_primitive::w32 divu(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        return tzscale_primitive::w32((VBit<32, false>(a.val) / VBit<32, false>(b.val)));
    }

    inline tzscale_primitive::w32 remu(tzscale_primitive::w32 a, tzscale_primitive::w32 b) {
        return tzscale_primitive::w32((VBit<32, false>(a.val) % VBit<32, false>(b.val)));
    }

    inline VBit<64, false> div_step(VBit<64, false> pa, VBit<32, false> b) {
        VBit<64, false> new_pa = (pa << 0x1u);
        VBit<33, false> diff = (VBit<33, false>(VBit<32, false>(new_pa.extract(0x3Fu, 0x20u))) - VBit<33, false>(b));
        if ((diff.extract(0x20u) == 0x0u)) {
            new_pa.deposit(VBit<32, false>(diff), 0x3Fu, 0x20u);
            new_pa.deposit(0x1u, 0x0u);
        }
        return new_pa;
    }

    inline tzscale_primitive::w32 div_clb(tzscale_primitive::w32 a) {
        VBit<5, false> r;
        tzscale_primitive::w32 tmp = a.val;
        if ((VBit<32, true>(tmp.val.extract(0x1Fu, 0x0u)) == 0x0)) {
            r = 0x1Fu;
        } else if ((VBit<31, true>(tmp.val.extract(0x1Fu, 0x1u)) == 0x0)) {
            r = 0x1Eu;
        } else if ((VBit<30, true>(tmp.val.extract(0x1Fu, 0x2u)) == 0x0)) {
            r = 0x1Du;
        } else if ((VBit<29, true>(tmp.val.extract(0x1Fu, 0x3u)) == 0x0)) {
            r = 0x1Cu;
        } else if ((VBit<28, true>(tmp.val.extract(0x1Fu, 0x4u)) == 0x0)) {
            r = 0x1Bu;
        } else if ((VBit<27, true>(tmp.val.extract(0x1Fu, 0x5u)) == 0x0)) {
            r = 0x1Au;
        } else if ((VBit<26, true>(tmp.val.extract(0x1Fu, 0x6u)) == 0x0)) {
            r = 0x19u;
        } else if ((VBit<25, true>(tmp.val.extract(0x1Fu, 0x7u)) == 0x0)) {
            r = 0x18u;
        } else if ((VBit<24, true>(tmp.val.extract(0x1Fu, 0x8u)) == 0x0)) {
            r = 0x17u;
        } else if ((VBit<23, true>(tmp.val.extract(0x1Fu, 0x9u)) == 0x0)) {
            r = 0x16u;
        } else if ((VBit<22, true>(tmp.val.extract(0x1Fu, 0xAu)) == 0x0)) {
            r = 0x15u;
        } else if ((VBit<21, true>(tmp.val.extract(0x1Fu, 0xBu)) == 0x0)) {
            r = 0x14u;
        } else if ((VBit<20, true>(tmp.val.extract(0x1Fu, 0xCu)) == 0x0)) {
            r = 0x13u;
        } else if ((VBit<19, true>(tmp.val.extract(0x1Fu, 0xDu)) == 0x0)) {
            r = 0x12u;
        } else if ((VBit<18, true>(tmp.val.extract(0x1Fu, 0xEu)) == 0x0)) {
            r = 0x11u;
        } else if ((VBit<17, true>(tmp.val.extract(0x1Fu, 0xFu)) == 0x0)) {
            r = 0x10u;
        } else if ((VBit<16, true>(tmp.val.extract(0x1Fu, 0x10u)) == 0x0)) {
            r = 0xFu;
        } else if ((VBit<15, true>(tmp.val.extract(0x1Fu, 0x11u)) == 0x0)) {
            r = 0xEu;
        } else if ((VBit<14, true>(tmp.val.extract(0x1Fu, 0x12u)) == 0x0)) {
            r = 0xDu;
        } else if ((VBit<13, true>(tmp.val.extract(0x1Fu, 0x13u)) == 0x0)) {
            r = 0xCu;
        } else if ((VBit<12, true>(tmp.val.extract(0x1Fu, 0x14u)) == 0x0)) {
            r = 0xBu;
        } else if ((VBit<11, true>(tmp.val.extract(0x1Fu, 0x15u)) == 0x0)) {
            r = 0xAu;
        } else if ((VBit<10, true>(tmp.val.extract(0x1Fu, 0x16u)) == 0x0)) {
            r = 0x9u;
        } else if ((VBit<9, true>(tmp.val.extract(0x1Fu, 0x17u)) == 0x0)) {
            r = 0x8u;
        } else if ((VBit<8, true>(tmp.val.extract(0x1Fu, 0x18u)) == 0x0)) {
            r = 0x7u;
        } else if ((VBit<7, true>(tmp.val.extract(0x1Fu, 0x19u)) == 0x0)) {
            r = 0x6u;
        } else if ((VBit<6, true>(tmp.val.extract(0x1Fu, 0x1Au)) == 0x0)) {
            r = 0x5u;
        } else if ((VBit<5, true>(tmp.val.extract(0x1Fu, 0x1Bu)) == 0x0)) {
            r = 0x4u;
        } else if ((VBit<4, true>(tmp.val.extract(0x1Fu, 0x1Cu)) == 0x0)) {
            r = 0x3u;
        } else if ((VBit<3, true>(tmp.val.extract(0x1Fu, 0x1Du)) == 0x0)) {
            r = 0x2u;
        } else if ((VBit<2, true>(tmp.val.extract(0x1Fu, 0x1Eu)) == 0x0)) {
            r = 0x1u;
        } else {
            r = 0x0u;
        }
        return tzscale_primitive::w32(r);
    }

#ifdef __checkers__
    class div {
    public:
        div(tzscale* p) : mdl(p) {}
        void process();

#ifdef __checkers__
        void update_status() {
            mdl->div__B.update(1);
            mdl->div__PA.update(1);
            mdl->div__Q_addr_reg.update(1);
            mdl->div__cnt.update(1);
            mdl->div__is_div.update(1);
            mdl->div__is_neg_div.update(1);
            mdl->div__is_neg_rem.update(1);
            mdl->R.update(1);
        }

#endif // __checkers__

#ifdef __checkers__
        void clear_update() {
            mdl->div__B.clear_update();
            mdl->div__PA.clear_update();
            mdl->div__Q_addr_reg.clear_update();
            mdl->div__cnt.clear_update();
            mdl->div__is_div.clear_update();
            mdl->div__is_neg_div.clear_update();
            mdl->div__is_neg_rem.clear_update();
            mdl->R.clear_update();
        }

#endif // __checkers__

    private:
        tzscale* mdl;
    };

    class dm_in {
    public:
        dm_in(tzscale* p) : mdl(p) {}
        void process_result();
        void process_request();

#ifdef __checkers__
        void update_status() {
            mdl->dm_in__col_ff.update(2);
            mdl->dm_in__ld_dmb_ff.update(2);
            mdl->dm_in__ld_dmh_ff.update(2);
            mdl->dm_in__ld_dmw_ff.update(2);
        }

#endif // __checkers__

#ifdef __checkers__
        void clear_update() {
            mdl->dm_in__col_ff.clear_update();
            mdl->dm_in__ld_dmb_ff.clear_update();
            mdl->dm_in__ld_dmh_ff.clear_update();
            mdl->dm_in__ld_dmw_ff.clear_update();
        }

#endif // __checkers__

        void dbg_access_DMb(unsigned a, tzscale_primitive::w08& val, bool read) {
            VBit<2, false> col = VBit<2, false>(VBit<32, false>(a).extract(0x1u, 0x0u));
            VBit<1, false> bnk = VBit<32, false>(a).extract(0x2u);
            VBit<21, false> row = VBit<21, false>(VBit<32, false>(a).extract(0x17u, 0x3u));
            tzscale_primitive::uint8 v = tzscale_primitive::uint8(val.val).val;
            switch ((bnk).to_unsigned()){
                case 0:
                    {
                        dbg_access_DM0((row).to_unsigned(), (col).to_unsigned(), v, read);
                        break;
                    }
                case 1:
                    {
                        dbg_access_DM1((row).to_unsigned(), (col).to_unsigned(), v, read);
                        break;
                    }
            }
            val = tzscale_primitive::w08(v.val).val;
        }

        void dbg_access_DM0(AddressType dbg_addr, VectorIndexType dbg_elem, tzscale_primitive::uint8& dbg_val, bool dbg_read);

        void dbg_access_DM1(AddressType dbg_addr, VectorIndexType dbg_elem, tzscale_primitive::uint8& dbg_val, bool dbg_read);

    private:
        tzscale* mdl;
    };

#endif // __checkers__

} // namespace tzscale_primitive
#endif
