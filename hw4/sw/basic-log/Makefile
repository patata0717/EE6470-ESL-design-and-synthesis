all : main.cpp
	riscv-none-elf-g++ -std=c++14 main.cpp -g -o main -march=rv32ima -mabi=ilp32

sim: all
	~/ee6470/riscv-vp/vp/build/bin/riscv-vp-log --intercept-syscalls --error-on-zero-traphandler=true main

clean:
	rm -f main

