// tiny32_4core
#include <cstdlib>
#include <ctime>

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

	addr_t mem_size         = 1024 * 1024 * 32;  // 32 MB ram, to place it before the CLINT and run the base examples (assume
	                                     // memory start at zero) without modifications
	addr_t mem_start_addr   = 0x00000000;
	addr_t mem_end_addr     = mem_start_addr + mem_size - 1;
	addr_t clint_start_addr = 0x02000000;
	addr_t clint_end_addr   = 0x0200ffff;
	addr_t sys_start_addr   = 0x02010000;
	addr_t sys_end_addr     = 0x020103ff;
    addr_t dma_start_addr   = 0x70000000;
    addr_t dma_end_addr     = 0x7000FFFF;
    addr_t plic_start_addr  = 0x0C000000;
    addr_t plic_end_addr    = 0x0C2FFFFF;
	addr_t pe0_start_addr   = 0x74000000;
	addr_t pe0_end_addr     = 0x7400000F;
    addr_t pe1_start_addr   = 0x74000010;
    addr_t pe1_end_addr     = 0x7400001F;
	addr_t pe2_start_addr   = 0x74000020;
	addr_t pe2_end_addr     = 0x7400002F;
	addr_t pe3_start_addr   = 0x74000030;
	addr_t pe3_end_addr     = 0x7400003F;

	bool quiet = false;
	bool use_E_base_isa = false;

	TinyOptions(void) {
		// clang-format off
		add_options()
			("quiet", po::bool_switch(&quiet), "do not output register values on exit")
			("memory-start", po::value<unsigned int>(&mem_start_addr), "set memory start address")
			("memory-size", po::value<unsigned int>(&mem_size), "set memory size")
			("use-E-base-isa", po::bool_switch(&use_E_base_isa), "use the E instead of the I integer base ISA");
        	// clang-format on
        }

	void parse(int argc, char **argv) override {
		Options::parse(argc, argv);
		mem_end_addr = mem_start_addr + mem_size - 1;
	}
};

int sc_main(int argc, char **argv) {
	TinyOptions opt;
	opt.parse(argc, argv);

	std::srand(std::time(nullptr));  // use current time as seed for random generator

	tlm::tlm_global_quantum::instance().set(sc_core::sc_time(/*opt.tlm_global_quantum*/10, sc_core::SC_NS));

	ISS core(0, opt.use_E_base_isa);
    MMU mmu(core);
    PE_Add1 pe0("PE0", 5);
    PE_Add1 pe1("PE1", 6);
    PE_Add1 pe2("PE2", 7);
    PE_Add1 pe3("PE3", 8);
	CombinedMemoryInterface core_mem_if("MemoryInterface0", core, &mmu);
	SimpleMemory mem("SimpleMemory", opt.mem_size);
	ELFLoader loader(opt.input_program.c_str());
	SimpleBus<3, 9> bus("SimpleBus");
	SyscallHandler sys("SyscallHandler");
	DebugMemoryInterface dbg_if("DebugMemoryInterface");

	std::vector<clint_interrupt_target*> clint_targets {&core};
	RealCLINT clint("CLINT", clint_targets);

	MemoryDMI dmi = MemoryDMI::create_start_size_mapping(mem.data, opt.mem_start_addr, mem.size);
	InstrMemoryProxy instr_mem(dmi, core);

	std::shared_ptr<BusLock> bus_lock = std::make_shared<BusLock>();
	core_mem_if.bus_lock = bus_lock;

	instr_memory_if *instr_mem_if = &core_mem_if;
	data_memory_if *data_mem_if = &core_mem_if;
	if (opt.use_instr_dmi)
		instr_mem_if = &instr_mem;
	if (opt.use_data_dmi) {
		core_mem_if.dmi_ranges.emplace_back(dmi);
	}

	loader.load_executable_image(mem, mem.size, opt.mem_start_addr);
	core.init(instr_mem_if, data_mem_if, &clint, loader.get_entrypoint(), rv32_align_address(opt.mem_end_addr));
	sys.init(mem.data, opt.mem_start_addr, loader.get_heap_addr());
	sys.register_core(&core);

    FE310_PLIC<1, 64, 96, 32> plic("PLIC");
    SimpleDMA dma("SimpleDMA", 4);
	if (opt.intercept_syscalls)
		core.sys = &sys;
	core.error_on_zero_traphandler = opt.error_on_zero_traphandler;

	// setup port mapping
	bus.ports[0] = new PortMapping(opt.mem_start_addr, opt.mem_end_addr);
	bus.ports[1] = new PortMapping(opt.clint_start_addr, opt.clint_end_addr);
	bus.ports[2] = new PortMapping(opt.sys_start_addr, opt.sys_end_addr);
    bus.ports[3] = new PortMapping(opt.dma_start_addr,   opt.dma_end_addr);     // DMA
    bus.ports[4] = new PortMapping(opt.plic_start_addr,  opt.plic_end_addr);    // PLIC
    bus.ports[5] = new PortMapping(opt.pe0_start_addr, opt.pe0_end_addr);  // PE0
    bus.ports[6] = new PortMapping(opt.pe1_start_addr, opt.pe1_end_addr);  // PE1
    bus.ports[7] = new PortMapping(opt.pe2_start_addr, opt.pe2_end_addr);  // PE2
    bus.ports[8] = new PortMapping(opt.pe3_start_addr, opt.pe3_end_addr);  // PE3

	// connect TLM sockets
	core_mem_if.isock.bind(bus.tsocks[0]);
    dbg_if.isock.bind(bus.tsocks[2]);         // DBG_IF → SYS

	PeripheralWriteConnector dma_connector("SimpleDMA-Connector");
	dma_connector.isock.bind(bus.tsocks[1]); // DMA connector → DMA
    dma.isock.bind(dma_connector.tsock);            // DMA → DRAM
	dma_connector.bus_lock = bus_lock;

	bus.isocks[0].bind(mem.tsock);
	bus.isocks[1].bind(clint.tsock);
	bus.isocks[2].bind(sys.tsock);
    bus.isocks[3].bind(dma.tsock);            // DMA  target
    bus.isocks[4].bind(plic.tsock);           // PLIC target
    bus.isocks[5].bind(pe0.tsock);            // PE0 registers
    bus.isocks[6].bind(pe1.tsock);            // PE1 registers
    bus.isocks[7].bind(pe2.tsock);            // PE2 registers
    bus.isocks[8].bind(pe3.tsock);            // PE3 registers

    plic.target_harts[0]  = &core;            // PLIC  → hart 0
    dma.plic = &plic;                         // DMA → PLIC
    pe0.plic = &plic;                         // PE0 → PLIC(irq=4)
    pe1.plic = &plic;                         // PE1 → PLIC(irq=5)
    pe2.plic = &plic;                         // PE2 → PLIC(irq=6)
    pe3.plic = &plic;                         // PE3 → PLIC(irq=7)

	// switch for printing instructions
	core.trace = opt.trace_mode;

	std::vector<debug_target_if *> threads;
	threads.push_back(&core);

	if (opt.use_debug_runner) {
		auto server = new GDBServer("GDBServer", threads, &dbg_if, opt.debug_port);
		new GDBServerRunner("GDBRunner", server, &core);
	} else {
		new DirectCoreRunner(core);
	}

	if (opt.quiet)
		 sc_core::sc_report_handler::set_verbosity_level(sc_core::SC_NONE);

	sc_core::sc_start();

	if (!opt.quiet) {
		core.show();
	}

	return 0;
}
