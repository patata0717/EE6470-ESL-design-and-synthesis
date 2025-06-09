// mc_main.cpp  (corrected)
#include <cstdlib>
#include <ctime>
#include <memory>
#include <iomanip>
#include <iostream>

#include "core/common/real_clint.h"
#include "elf_loader.h"
#include "debug_memory.h"
#include "iss.h"
#include "mem.h"
#include "memory.h"
#include "fe310_plic.h"
#include "syscall.h"
#include "platform/common/options.h"

#include "gdb-mc/gdb_server.h"
#include "gdb-mc/gdb_runner.h"

#include "dma.h"
#include "PE_Add1.h"

#include <boost/io/ios_state.hpp>
#include <boost/program_options.hpp>
#include <iomanip>
#include <iostream>

using namespace rv32;
namespace po = boost::program_options;

struct TinyOptions : public Options {
public:
    typedef unsigned int addr_t;

    addr_t mem_size         = 1024 * 1024 * 32;  // 32 MB RAM
    addr_t mem_start_addr   = 0x00000000;
    addr_t mem_end_addr     = mem_start_addr + mem_size - 1;
    addr_t clint_start_addr = 0x02000000;
    addr_t clint_end_addr   = 0x0200ffff;
    addr_t sys_start_addr   = 0x02010000;
    addr_t sys_end_addr     = 0x020103ff;
    addr_t dma_start_addr   = 0x70000000;
    addr_t dma_end_addr     = 0x7000FFFF;
    addr_t plic_start_addr  = 0x0C000000;
    addr_t plic_end_addr    = 0x0C0FFFFF;
    static constexpr addr_t PE_BASE   = 0x74000000;
    static constexpr addr_t PE_STRIDE = 0x40;  // 64 bytes

    bool quiet = false;
    bool use_E_base_isa = false;

    TinyOptions(void) {
        add_options()
            ("quiet",            po::bool_switch(&quiet),            "do not output register values on exit")
            ("memory-start",     po::value<unsigned int>(&mem_start_addr), "set memory start address")
            ("memory-size",      po::value<unsigned int>(&mem_size),       "set memory size")
            ("use-E-base-isa",   po::bool_switch(&use_E_base_isa),   "use the E integer base ISA");
    }

    void parse(int argc, char **argv) override {
        Options::parse(argc, argv);
        mem_end_addr = mem_start_addr + mem_size - 1;
    }
};

int sc_main(int argc, char **argv) {
    TinyOptions opt;
    opt.parse(argc, argv);

    std::srand(std::time(nullptr));

    tlm::tlm_global_quantum::instance().set(sc_core::sc_time(opt.tlm_global_quantum, sc_core::SC_NS));

	ISS core(0, opt.use_E_base_isa);
    MMU mmu(core);
    CombinedMemoryInterface core_mem_if("MemoryInterface0", core, &mmu);
    SimpleMemory mem("RAM", opt.mem_size);
    ELFLoader loader(opt.input_program.c_str());
    SyscallHandler sys("Sys");
    DebugMemoryInterface dbg_if("DbgIF");

	std::vector<clint_interrupt_target*> clint_targets {&core};
	RealCLINT clint("CLINT", clint_targets);

	std::shared_ptr<BusLock> bus_lock = std::make_shared<BusLock>();
	core_mem_if.bus_lock = bus_lock;
	instr_memory_if *instr_mem_if = &core_mem_if;
	data_memory_if *data_mem_if = &core_mem_if;

    FE310_PLIC<1, 64, 96, 32> plic("PLIC");
    SimpleDMA dma("SimpleDMA", 4);
    if (opt.intercept_syscalls) {
        core.sys = &sys;
    }

    loader.load_executable_image(mem, mem.size, opt.mem_start_addr);
	core.init(instr_mem_if, data_mem_if, &clint, loader.get_entrypoint(), rv32_align_address(opt.mem_end_addr));
    sys.init(mem.data, opt.mem_start_addr, loader.get_heap_addr());
    sys.register_core(&core);
    core.error_on_zero_traphandler = opt.error_on_zero_traphandler;
    SimpleBus<3, 9> bus("Bus");

    // ── Set up address windows (bus.ports[i] = [low..high]) ────────
    bus.ports[0] = new PortMapping(opt.mem_start_addr, opt.mem_end_addr);       // DRAM
    bus.ports[1] = new PortMapping(opt.clint_start_addr, opt.clint_end_addr);   // CLINT
    bus.ports[2] = new PortMapping(opt.sys_start_addr,   opt.sys_end_addr);     // SYS
    bus.ports[3] = new PortMapping(opt.dma_start_addr,   opt.dma_end_addr);     // DMA
    bus.ports[4] = new PortMapping(opt.plic_start_addr,  opt.plic_end_addr);    // PLIC

    bus.ports[5] = new PortMapping(TinyOptions::PE_BASE + 0x00, TinyOptions::PE_BASE + 0x3F);  // PE0
    bus.ports[6] = new PortMapping(TinyOptions::PE_BASE + 0x40, TinyOptions::PE_BASE + 0x7F);  // PE1
    bus.ports[7] = new PortMapping(TinyOptions::PE_BASE + 0x80, TinyOptions::PE_BASE + 0xBF);  // PE2
    bus.ports[8] = new PortMapping(TinyOptions::PE_BASE + 0xC0, TinyOptions::PE_BASE + 0xFF);  // PE3

    // 15) Instantiate four PEs, each with its own IRQ (4,5,6,7)
    PE_Add1 pe0("PE0", 4);
    PE_Add1 pe1("PE1", 5);
    PE_Add1 pe2("PE2", 6);
    PE_Add1 pe3("PE3", 7);

    // ── Bind initiator sockets → bus.tsocks[j] ────────────────────
    core_mem_if.isock.bind(bus.tsocks[0]);    // IF0 → DRAM, CLINT, SYS, DMA, PLIC
    dbg_if.isock.bind(bus.tsocks[2]);         // DBG_IF → SYS

	PeripheralWriteConnector dma_connector("SimpleDMA-Connector");
	dma_connector.isock.bind(bus.tsocks[1]); // DMA connector → DMA
    dma.isock.bind(dma_connector.tsock);            // DMA → DRAM
	dma_connector.bus_lock = bus_lock;

    // ── Bind target sockets → bus.isocks[i] ────────────────────
    bus.isocks[0].bind(mem.tsock);            // DRAM target
    bus.isocks[1].bind(clint.tsock);          // CLINT target
    bus.isocks[2].bind(sys.tsock);            // SYS  target
    bus.isocks[3].bind(dma.tsock);            // DMA  target
    bus.isocks[4].bind(plic.tsock);           // PLIC target
    bus.isocks[5].bind(pe0.tsock);            // PE0 registers
    bus.isocks[6].bind(pe1.tsock);            // PE1 registers
    bus.isocks[7].bind(pe2.tsock);            // PE2 registers
    bus.isocks[8].bind(pe3.tsock);            // PE3 registers

    // ── Hook up interrupt lines ──────────────────────────────
    plic.target_harts[0]  = &core;            // PLIC  → hart 0
    dma.plic = &plic;                         // DMA → PLIC
    pe0.plic = &plic;                         // PE0 → PLIC(irq=4)
    pe1.plic = &plic;                         // PE1 → PLIC(irq=5)
    pe2.plic = &plic;                         // PE2 → PLIC(irq=6)
    pe3.plic = &plic;                         // PE3 → PLIC(irq=7)

    // ── Instruction tracing? ──────────────────────────────────
    core.trace = opt.trace_mode;

    // ── GDB or direct runner ──────────────────────────────────
    std::vector<debug_target_if *> threads;
    threads.push_back(&core);

    if (opt.use_debug_runner) {
        auto gdb = new GDBServer("GDB", threads, &dbg_if, opt.debug_port);
        new GDBServerRunner("Run0", gdb, &core);
    } else {
        new DirectCoreRunner(core);
    }

    if (opt.quiet)
        sc_core::sc_report_handler::set_verbosity_level(sc_core::SC_NONE);

    // ── Finally start simulation ───────────────────────────────
    sc_core::sc_start();

    if (!opt.quiet) {
        core.show();
    }

    return 0;
}
