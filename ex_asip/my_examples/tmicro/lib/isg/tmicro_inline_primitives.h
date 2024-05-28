
// File generated by pdg version O-2018.09#f5599cac26#190121, Tue May 28 10:41:30 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// pdg -P -B -Iisg +wisg -Iruntime/include -D__tct_patch__=300 -D__checkers__ tmicro

#ifndef TMICRO_INLINE_PRIMITIVES_H
#define TMICRO_INLINE_PRIMITIVES_H

#ifdef __checkers__
#include "Mdl_tmicro.h"

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

namespace tmicro_primitive {

    const int controller_module_id = 0;
    const int interrupt_io_module_id = 1;
    const int tb_irq_inp_module_id = 2;

    inline tmicro_primitive::word add(tmicro_primitive::word a, tmicro_primitive::word b) {
        return (a.val + b.val);
    }

    inline tmicro_primitive::word add(tmicro_primitive::word a, tmicro_primitive::word b, tmicro_primitive::uint1& co) {
        VBit<17, true> aa = VBit<17, true>(VBit<16, false>(a.val));
        VBit<17, true> bb = VBit<17, true>(VBit<16, false>(b.val));
        VBit<17, true> rr = (aa + bb);
        co = rr.extract(0x10u);
        return VBit<16, true>(rr.extract(0xFu, 0x0u));
    }

    inline tmicro_primitive::word addc(tmicro_primitive::word a, tmicro_primitive::word b, tmicro_primitive::uint1 ci, tmicro_primitive::uint1& co) {
        VBit<17, true> aa = VBit<17, true>(VBit<16, false>(a.val));
        VBit<17, true> bb = VBit<17, true>(VBit<16, false>(b.val));
        VBit<17, true> rr = ((aa + bb) + VBit<17, true>(ci.val));
        co = rr.extract(0x10u);
        return VBit<16, true>(rr.extract(0xFu, 0x0u));
    }

    inline tmicro_primitive::word sub(tmicro_primitive::word a, tmicro_primitive::word b, tmicro_primitive::uint1& co) {
        VBit<17, true> aa = VBit<17, true>(VBit<16, false>(a.val));
        VBit<17, true> bb = VBit<17, true>(~VBit<16, false>(b.val));
        VBit<17, true> rr = ((aa + bb) + VBit<17, true>(0x1));
        co = rr.extract(0x10u);
        return VBit<16, true>(rr.extract(0xFu, 0x0u));
    }

    inline tmicro_primitive::word subb(tmicro_primitive::word a, tmicro_primitive::word b, tmicro_primitive::uint1 ci, tmicro_primitive::uint1& co) {
        VBit<17, true> aa = VBit<17, true>(VBit<16, false>(a.val));
        VBit<17, true> bb = VBit<17, true>(~VBit<16, false>(b.val));
        VBit<17, true> rr = ((aa + bb) + VBit<17, true>(ci.val));
        co = rr.extract(0x10u);
        return VBit<16, true>(rr.extract(0xFu, 0x0u));
    }

    inline tmicro_primitive::word andw(tmicro_primitive::word a, tmicro_primitive::word b) {
        return (a.val & b.val);
    }

    inline tmicro_primitive::word orw(tmicro_primitive::word a, tmicro_primitive::word b) {
        return (a.val | b.val);
    }

    inline tmicro_primitive::word xorw(tmicro_primitive::word a, tmicro_primitive::word b) {
        return (a.val ^ b.val);
    }

    inline tmicro_primitive::word minw(tmicro_primitive::word a, tmicro_primitive::word b) {
        if ((a.val < b.val)) {
            return a;
        } else {
            return b;
        }
    }

    inline tmicro_primitive::word maxw(tmicro_primitive::word a, tmicro_primitive::word b) {
        if ((a.val > b.val)) {
            return a;
        } else {
            return b;
        }
    }

    inline tmicro_primitive::word select(bool c, tmicro_primitive::word a, tmicro_primitive::word b) {
        if (c) {
            return a;
        } else {
            return b;
        }
    }

    inline tmicro_primitive::word ext_abs(tmicro_primitive::word a) {
        VBit<16, true> aa = VBit<16, true>(a.val);
        if ((aa < 0x0)) {
            aa = VBit<16, true>((~VBit<16, false>(a.val) + VBit<16, false>(0x1u)));
        }
        return aa;
    }

    inline bool lts(tmicro_primitive::word a, tmicro_primitive::word b) {
        if ((a.val < b.val)) {
            return 0x1u;
        } else {
            return 0x0u;
        }
    }

    inline bool ltu(tmicro_primitive::word a, tmicro_primitive::word b) {
        if ((VBit<16, false>(a.val) < VBit<16, false>(b.val))) {
            return 0x1u;
        } else {
            return 0x0u;
        }
    }

    inline bool les(tmicro_primitive::word a, tmicro_primitive::word b) {
        if ((a.val <= b.val)) {
            return 0x1u;
        } else {
            return 0x0u;
        }
    }

    inline bool leu(tmicro_primitive::word a, tmicro_primitive::word b) {
        if ((VBit<16, false>(a.val) <= VBit<16, false>(b.val))) {
            return 0x1u;
        } else {
            return 0x0u;
        }
    }

    inline bool gts(tmicro_primitive::word a, tmicro_primitive::word b) {
        if ((a.val > b.val)) {
            return 0x1u;
        } else {
            return 0x0u;
        }
    }

    inline bool gtu(tmicro_primitive::word a, tmicro_primitive::word b) {
        if ((VBit<16, false>(a.val) > VBit<16, false>(b.val))) {
            return 0x1u;
        } else {
            return 0x0u;
        }
    }

    inline bool ges(tmicro_primitive::word a, tmicro_primitive::word b) {
        if ((a.val >= b.val)) {
            return 0x1u;
        } else {
            return 0x0u;
        }
    }

    inline bool geu(tmicro_primitive::word a, tmicro_primitive::word b) {
        if ((VBit<16, false>(a.val) >= VBit<16, false>(b.val))) {
            return 0x1u;
        } else {
            return 0x0u;
        }
    }

    inline bool eq(tmicro_primitive::word a, tmicro_primitive::word b) {
        if ((a.val == b.val)) {
            return 0x1u;
        } else {
            return 0x0u;
        }
    }

    inline bool ne(tmicro_primitive::word a, tmicro_primitive::word b) {
        if ((a.val != b.val)) {
            return 0x1u;
        } else {
            return 0x0u;
        }
    }

    inline tmicro_primitive::word complement(tmicro_primitive::word a) {
        return ~a.val;
    }

    inline tmicro_primitive::word extend_sign(tmicro_primitive::word a) {
        if ((a.val < 0x0)) {
            return -0x1;
        } else {
            return 0x0;
        }
    }

    inline tmicro_primitive::word asr(tmicro_primitive::word a, tmicro_primitive::word f) {
        return (a.val >> VBit<4, false>(VBit<4, true>(f.val.extract(0x3u, 0x0u))));
    }

    inline tmicro_primitive::word lsr(tmicro_primitive::word a, tmicro_primitive::word f) {
        return tmicro_primitive::word((VBit<16, false>(a.val) >> VBit<4, false>(VBit<4, true>(f.val.extract(0x3u, 0x0u)))));
    }

    inline tmicro_primitive::word lsl(tmicro_primitive::word a, tmicro_primitive::word f) {
        return tmicro_primitive::word((VBit<16, false>(a.val) << VBit<4, false>(VBit<4, true>(f.val.extract(0x3u, 0x0u)))));
    }

    inline void mulss(tmicro_primitive::word a, tmicro_primitive::word b, tmicro_primitive::word& rl, tmicro_primitive::word& rh) {
        VBit<32, true> p = (a.val * b.val);
        rl = VBit<16, true>(p.extract(0xFu, 0x0u));
        rh = VBit<16, true>(p.extract(0x1Fu, 0x10u));
    }

    inline void muluu(tmicro_primitive::word a, tmicro_primitive::word b, tmicro_primitive::word& rl, tmicro_primitive::word& rh) {
        VBit<32, true> p = VBit<32, true>((VBit<16, false>(a.val) * VBit<16, false>(b.val)));
        rl = VBit<16, true>(p.extract(0xFu, 0x0u));
        rh = VBit<16, true>(p.extract(0x1Fu, 0x10u));
    }

    inline void divstep(tmicro_primitive::word a, tmicro_primitive::word q, tmicro_primitive::word m, tmicro_primitive::word& new_q, tmicro_primitive::word& new_m) {
        VBit<32, false> mq = VBit<32, false>(concat(m.val, q.val));
        mq = (mq << 0x1u);
        if ((VBit<16, false>(mq.extract(0x1Fu, 0x10u)) >= VBit<16, false>(a.val))) {
            mq.deposit((VBit<16, false>(mq.extract(0x1Fu, 0x10u)) - VBit<16, false>(a.val)), 0x1Fu, 0x10u);
            mq.deposit(0x1u, 0x0u);
        }
        new_q = tmicro_primitive::word(VBit<16, false>(mq.extract(0xFu, 0x0u))).val;
        new_m = tmicro_primitive::word(VBit<16, false>(mq.extract(0x1Fu, 0x10u))).val;
    }

    inline void nop() {
    }

    inline tmicro_primitive::uint2 incr(tmicro_primitive::uint2 a) {
        return (a.val + VBit<2, false>(0x1u));
    }

    inline tmicro_primitive::uint2 decr(tmicro_primitive::uint2 a) {
        return (a.val - VBit<2, false>(0x1u));
    }

    inline void halt() {
    }

#ifdef __checkers__
    class interrupt_io {
    public:
        interrupt_io(tmicro* p) : mdl(p) {}

#ifdef __checkers__
        void process_result() {
            mdl->interrupt_io__reg_ireq0.assign(1, mdl->ireq_inp.read());
            mdl->interrupt_io__reg_ireq1.assign(1, mdl->interrupt_io__reg_ireq0.pdgValue());
            mdl->interrupt_io__ireq.write(tmicro_primitive::ubyte((mdl->interrupt_io__reg_ipend.pdgValue().val | (mdl->interrupt_io__reg_ireq0.pdgValue().val & ~mdl->interrupt_io__reg_ireq1.pdgValue().val))));
            mdl->ireq_pcu_inp.write(mdl->interrupt_io__ireq.read());
        }

#endif // __checkers__

#ifdef __checkers__
        void process_request() {
            VBit<8, false> t;
            if (mdl->in_wait_state()) {
                t = 0x0u;
            } else {
                t = mdl->iack_pcu_out.read().val;
            }
            tmicro_primitive::ubyte iack = t;
            mdl->iack_out.write(iack);
            mdl->interrupt_io__reg_ipend.assign(1, tmicro_primitive::ubyte((mdl->interrupt_io__ireq.read().val & ~iack.val)));
        }

#endif // __checkers__

#ifdef __checkers__
        void update_status() {
            mdl->interrupt_io__reg_ireq0.update(1);
            mdl->interrupt_io__reg_ireq1.update(1);
            mdl->interrupt_io__reg_ipend.update(1);
        }

#endif // __checkers__

#ifdef __checkers__
        void clear_update() {
            mdl->interrupt_io__reg_ireq0.clear_update();
            mdl->interrupt_io__reg_ireq1.clear_update();
            mdl->interrupt_io__reg_ipend.clear_update();
        }

#endif // __checkers__

    private:
        tmicro* mdl;
    };

    class tb_irq_inp {
    public:
        tb_irq_inp(tmicro* p) : mdl(p) {}

#ifdef __checkers__
        void process_result() {
            mdl->ireq_inp.write(mdl->tb_irq_inp__toggle.pdgValue());
        }

#endif // __checkers__

#ifdef __checkers__
        void process_request() {
            mdl->tb_irq_inp__toggle.assign(2, tmicro_primitive::ubyte((mdl->tb_irq_inp__toggle.pdgValue().val ^ VBit<8, false>(0x4u))));
        }

#endif // __checkers__

#ifdef __checkers__
        void update_status() {
            mdl->tb_irq_inp__toggle.update(2);
        }

#endif // __checkers__

#ifdef __checkers__
        void clear_update() {
            mdl->tb_irq_inp__toggle.clear_update();
        }

#endif // __checkers__

    private:
        tmicro* mdl;
    };

#endif // __checkers__

} // namespace tmicro_primitive
#endif
