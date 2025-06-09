# RISC-V based Virtual Prototype (VP)

<p align="center">
  <img src="./img/riscv-vp_logo.png" alt="RISC-V based Virtual Prototype (VP)" width="250"/>
</p>

### Key features of our VP:

 - RV32GC and RV64GC core support (i.e. RV32IMAFDC and RV64IMAFDC)
 - Implemented in SystemC TLM-2.0
 - SW debug capabilities (GDB RSP interface) with Eclipse
 - Virtual Breadboard GUI (interactive IO) featuring C++ and Lua modeled digital devices (separate repository)
 - FreeRTOS, RIOT, Zephyr, Linux support
 - Generic and configurable bus
 - CLINT and PLIC-based interrupt controller + additional peripherals
 - Instruction-based timing model + annotated TLM 2.0 transaction delays
 - Peripherals, e.g. display, flash controller, preliminary ethernet
 - Example configuration for the SiFive HiFive1 (currently only Rev. A) board available
 - Support for simulation of multi-core platforms
 - Machine-, Supervisor- and User-mode (including user traps) privilege levels and CSRs
 - Virtual memory support (Sv32, Sv39, Sv48)


For related information, e.g. verification, please visit https://www.informatik.uni-bremen.de/agra/projects/risc-v/ or contact <riscv@informatik.uni-bremen.de>. 
We accept pull requests and in general contributions are very welcome.
If you are using the RISC-V VP in a scientific paper, please cite https://doi.org/10.1016/j.sysarc.2020.101756. For the Virtual Breadboard GUI, please refer to https://www.mdpi.com/2079-9268/12/4/52.


In the following we provide build instructions and how to compile and run software on the VP.


#### 1) Build requirements

Mainly the usual build tools and boost is required:

On Ubuntu 20, install these:
```bash
sudo apt-get install autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo libgoogle-perftools-dev libtool patchutils bc zlib1g-dev libexpat-dev libboost-iostreams-dev libboost-program-options-dev libboost-log-dev qt5-default
```

On Fedora, following actions are required:
```bash
sudo dnf install autoconf automake curl libmpc-devel mpfr-devel gmp-devel gawk bison flex texinfo gperf libtool patchutils bc zlib-devel expat-devel cmake boost-devel qt5-qtbase qt5-qtbase-devel
sudo dnf groupinstall "C Development Tools and Libraries"
#optional debuginfo
sudo dnf debuginfo-install boost-iostreams boost-program-options boost-regex bzip2-libs glibc libgcc libicu libstdc++ zlib
```

#### 2) Build this RISC-V Virtual Prototype:


Check out all submodules (`git submodule update --init --recursive`), and type `make all`. This script does the following for you:

>
>i) in *vp/dependencies* folder (will download and compile SystemC, and build a local version of the softfloat library):
>
>```bash
>./build_systemc_233.sh
>./build_softfloat.sh
>```
>
>
>ii) in *vp* folder (requires the *boost* C++ library):
> 
>```bash
>mkdir build
>cd build
>cmake ..
>make install
>```

#### 3) Building the interactive environment GUI (`vp-breadboard`)

The GUI for interacting with the VP has moved to [https://github.com/agra-uni-bremen/virtual-breadboard](https://github.com/agra-uni-bremen/virtual-breadboard).

#### 3) Building SW examples using the GNU toolchain

##### Requirements

In order to test the software examples, a configured RISC-V GNU toolchain is required in your `$PATH`.
Several standard packages are required to build the toolchain.
For more information on prerequisites for the RISC-V GNU toolchain visit https://github.com/riscv/riscv-gnu-toolchain.
With the packages installed, the toolchain can be build as follows:

```bash
# in some source folder
git clone https://github.com/riscv/riscv-gnu-toolchain.git
cd riscv-gnu-toolchain
git submodule update --init --recursive # this may take a while
./configure --prefix=$(pwd)/../riscv-gnu-toolchain-dist-rv32imac-ilp32 --with-arch=rv32imac --with-abi=ilp32
make -j$(nproc)
```

If wanted, move the `riscv-gnu-toolchain-dist-rv32imac-ilp32` folder to your `/opt/` folder and add it to your path in your `~/.bashrc`
(e.g. `PATH=$PATH:/opt/riscv-gnu-toolchain-dist-rv32imac-ilp32/bin`)

##### Running the examples

In *sw*:

```bash
cd simple-sensor    # can be replaced with different example
make                # (requires RISC-V GNU toolchain in PATH)
make sim            # (requires *riscv-vp*, i.e. *vp/build/bin/riscv-vp*, executable in PATH)
```

Please note, if *make* is called without the *install* argument in step 2, then the *riscv-vp* executable is available in *vp/build/src/platform/basic/riscv-vp*.



This will also copy the VP binaries into the *vp/build/bin* folder.

#### Alternative Setup: Docker

Instead of compiling the riscv-vp manually, a `Dockerfile` is also
provided which eases this process. In order to build a Docker image from
this file run the following command:

	$ docker build -t riscv-vp .

Afterwards, start a new Docker container using:

	$ docker run --rm -it riscv-vp

Within this Docker container, the riscv-vp source tree is available in
`/home/riscv-vp/riscv-vp/`. A RISC-V cross compiler toolchain is also
part of the container. As such, it is possible to compile and run any of
the examples from the `./sw` subdirectory in this container. For
example:

	$ cd /home/riscv-vp/riscv-vp/sw/basic-c/
	$ make
	$ make sim

#### FAQ

**Q:** How do I exit the VP?

**A:** All VPs use the input TTY in raw mode and forward all control
characters to the guest. For this reason, one cannot use Ctrl-c to exit
the VP. Instead, press Ctrl-a to enter command mode and press Ctrl-x to
exit the VP.

**Q:** How do I emit a Ctrl-a control character?

**A:** Enter control mode using Ctrl-a and press Ctrl-a again to send a
literal Ctrl-a control character to the guest.

#### Acknowledgements:

This work was supported in part by the German Federal Ministry of Education and Research (BMBF) within the project CONFIRM under contract no. 16ES0565 and within the project SATiSFy under contract no. 16KIS0821K and within the project VerSys under contract no. 01IW19001 and within the project Scale4Edge under contract no. 16ME0127, and by the University of Bremen’s graduate school SyDe, funded by the German Excellence Initiative.
