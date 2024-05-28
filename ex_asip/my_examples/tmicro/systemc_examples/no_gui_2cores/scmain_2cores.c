// File generated by checkers version 12.2.5, Thu Nov 15 18:23:39 2012
// Copyright(c) 1996-2012 Target Compiler Technologies NV
// All rights reserved.
// checkers -B -v -M -ctmicro_ca_work/LNa64/tmicro_ca.ccf tmicro

// Processor: tmicro
#include "Mdl_tmicro.h"

#include "Mdl_tmicro_systemc.h"

#include "Mdl_tmicro_uicore.h"
#include "Mdl_tmicro_convert.h"
#include "Mdl_tmicro_testbench.h"

Tcl_Interp* sc_interp = 0;

SC_MODULE(Memory)
{
private:
    int ram[65536];     // integers up to 32-bit
public:
    sc_in_clk                clock;
    sc_in<bool>              ld0, st0;
    sc_in<sc_uint<16> >      a0;
    sc_in<sc_uint<16> >      d0;
    sc_out<sc_uint<16> >     q0;
    sc_in<bool>              ld1, st1;
    sc_in<sc_uint<16> >      a1;
    sc_in<sc_uint<16> >      d1;
    sc_out<sc_uint<16> >     q1;

    void prc_memory() {
 	unsigned ar0 = a0.read();
 	if (ld0.read() && ar0 < 65536)
 	    q0.write(ram[ar0]);
 	else if (st0.read() && ar0 < 65536)
 	    ram[ar0] = d0.read();
 	unsigned ar1 = a1.read();
 	if (ld1.read() && ar1 < 65536)
 	    q1.write(ram[ar1]);
 	else if (st1.read() && ar1 < 65536)
 	    ram[ar1] = d1.read();
    }

    SC_CTOR(Memory) {
	SC_METHOD(prc_memory);
	sensitive << clock.pos();
    }

    void dbg_access(AddressType addr, sc_uint<16>& val, int read)
    {
	if (read) val = ram[addr]; else ram[addr] = val;
    }
};

struct tmicro_testbench_sc_DM_PM : public tmicro_testbench_sc {

    Memory* dmp;
    Memory* pmp;

    tmicro_testbench_sc_DM_PM(Memory* idmp, Memory* ipmp) : dmp(idmp), pmp(ipmp) {}

    void dbg_access_PM(AddressType a, sc_uint<16>& v, bool read) { pmp->dbg_access(a, v, read); }

    void dbg_access_DM(AddressType a, sc_uint<16>& v, bool read) { dmp->dbg_access(a, v, read); }
};

int sc_main(int argc, char* argv[])
{
    if (argc != 3) {
	std::cerr << "Usage: tmicro_ca_sc_mi <program0> <program1>" << std::endl;
	exit(5);
    }

    Memory dm("DM");
    Memory pm("PM");
    tmicro_testbench_sc_DM_PM sctb(&dm, &pm);

    tmicro_load_program_args_sc pl_args0(argv[1]);
    pl_args0.init_pc = 1;
    pl_args0.init_sp = 1;
    pl_args0.cycle_count_breakpoints = 1;

    tmicro_load_program_args_sc pl_args1(argv[2]);
    pl_args1.init_pc = 1;
    pl_args1.init_sp = 1;
    pl_args1.cycle_count_breakpoints = 1;

    tmicro_sc iss0("iss0", &sctb, pl_args0);
    tmicro_sc iss1("iss1", &sctb, pl_args1);

    // Signals
    sc_clock clock;
    sc_signal<bool> reset;
    sc_signal<sc_uint<16> > pm_read0;
    sc_signal<sc_uint<16> > pm_addr0;
    sc_signal<bool > ctr_pm_read_ld_PM_pm_addr0;
    sc_signal<sc_uint<16> > pm_write0;
    sc_signal<bool > ctr_PM_st_pm_write_pm_addr0;
    sc_signal<sc_uint<16> > dm_read0;
    sc_signal<sc_uint<16> > dm_addr0;
    sc_signal<bool > ctr_dm_read_ld_DM_dm_addr0;
    sc_signal<sc_uint<16> > dm_write0;
    sc_signal<bool > ctr_DM_st_dm_write_dm_addr0;
    sc_signal<sc_uint<8> > ireq_inp0;
    sc_signal<sc_uint<8> > iack_out0;
    sc_signal<sc_uint<1> > halted_out0;
    sc_signal<sc_uint<1> > debug_out0;
    sc_signal<sc_uint<1> > dma_ready0;
    sc_signal<sc_uint<16> > pm_read1;
    sc_signal<sc_uint<16> > pm_addr1;
    sc_signal<bool > ctr_pm_read_ld_PM_pm_addr1;
    sc_signal<sc_uint<16> > pm_write1;
    sc_signal<bool > ctr_PM_st_pm_write_pm_addr1;
    sc_signal<sc_uint<16> > dm_read1;
    sc_signal<sc_uint<16> > dm_addr1;
    sc_signal<bool > ctr_dm_read_ld_DM_dm_addr1;
    sc_signal<sc_uint<16> > dm_write1;
    sc_signal<bool > ctr_DM_st_dm_write_dm_addr1;
    sc_signal<sc_uint<8> > ireq_inp1;
    sc_signal<sc_uint<8> > iack_out1;
    sc_signal<sc_uint<1> > halted_out1;
    sc_signal<sc_uint<1> > debug_out1;
    sc_signal<sc_uint<1> > dma_ready1;

    // Connections
    iss0.clock(clock);
    iss0.reset(reset);
    iss0.pm_read(pm_read0);
    iss0.pm_addr(pm_addr0);
    iss0.pm_ld(ctr_pm_read_ld_PM_pm_addr0);
    iss0.pm_write(pm_write0);
    iss0.pm_st(ctr_PM_st_pm_write_pm_addr0);
    iss0.dm_read(dm_read0);
    iss0.dm_addr(dm_addr0);
    iss0.dm_ld(ctr_dm_read_ld_DM_dm_addr0);
    iss0.dm_write(dm_write0);
    iss0.dm_st(ctr_DM_st_dm_write_dm_addr0);
    iss0.iack_out(iack_out0);
    iss0.halted_out(halted_out0);
    iss0.debug_out(debug_out0);
    iss0.dma_ready(dma_ready0);

    iss1.clock(clock);
    iss1.reset(reset);
    iss1.pm_read(pm_read1);
    iss1.pm_addr(pm_addr1);
    iss1.pm_ld(ctr_pm_read_ld_PM_pm_addr1);
    iss1.pm_write(pm_write1);
    iss1.pm_st(ctr_PM_st_pm_write_pm_addr1);
    iss1.dm_read(dm_read1);
    iss1.dm_addr(dm_addr1);
    iss1.dm_ld(ctr_dm_read_ld_DM_dm_addr1);
    iss1.dm_write(dm_write1);
    iss1.dm_st(ctr_DM_st_dm_write_dm_addr1);
    iss1.iack_out(iack_out1);
    iss1.halted_out(halted_out1);
    iss1.debug_out(debug_out1);
    iss1.dma_ready(dma_ready1);

    dm.clock(clock);
    dm.ld0(ctr_dm_read_ld_DM_dm_addr0);
    dm.st0(ctr_DM_st_dm_write_dm_addr0);
    dm.a0(dm_addr0);
    dm.d0(dm_write0);
    dm.q0(dm_read0);
    dm.ld1(ctr_dm_read_ld_DM_dm_addr1);
    dm.st1(ctr_DM_st_dm_write_dm_addr1);
    dm.a1(dm_addr1);
    dm.d1(dm_write1);
    dm.q1(dm_read1);

    pm.clock(clock);
    pm.ld0(ctr_pm_read_ld_PM_pm_addr0);
    pm.st0(ctr_PM_st_pm_write_pm_addr0);
    pm.a0(pm_addr0);
    pm.d0(pm_write0);
    pm.q0(pm_read0);
    pm.ld1(ctr_pm_read_ld_PM_pm_addr1);
    pm.st1(ctr_PM_st_pm_write_pm_addr1);
    pm.a1(pm_addr1);
    pm.d1(pm_write1);
    pm.q1(pm_read1);

    reset = 1;
    sc_start(sc_time(100, SC_NS));
    reset = 0;
    sc_start(sc_time(100000, SC_NS));
    return 0;
}