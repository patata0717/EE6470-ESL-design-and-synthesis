## Final project—0/1 Knapsack by parallel branch and bound

## Part1: HLS

### How to run

source stratus.sh

make sim_B for behavior simulation

make sim_{target}_V for HLS

make help to see available targets

we offer testcase for item size 4, 20, 30, 35, 100

If you want to change test case, modify tb.cc "stimulus_XX.dat", and modify define.h "const int MAX_ITEMS = XX"

## Part2: riscv-vp

We offer knapsack 1 PE to 4 PE

If system is build, simply go for make sim in sw/knapsack_Ncore

modify Makefile, uncomment the commented line for enable riscv-gcc-gdb.

For gdb debug, open 2 terminals, one type

$ riscv-none-elf-gdb main

GDB interface pop up

$ target remote localhost:5005

Listen to port 5005

$ GDB operation, like set break point, next, continue...

For changing test case, modify sw/knapsack_Ncore/main.c: filepath=stimulus_XX.dat

For adjust PE delay to observe multi core result, modify vp/src/platform/tiny32_Ncore/PE_Add1.cpp:wait(XXX)

XXX is suitable for 100000, should not exceed 150000, if exceed 150000, it is not guaranteed to pass all testcase, if exceed 200000, it will certainly failed.

### Build VP

$ rm -rf vp/build

build $>  cmake ..

go to the platform we want to build

cd build/src/platform/tiny32_Ncore/

$ make install
