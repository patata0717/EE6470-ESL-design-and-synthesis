OBJECTS  = main.o bootstrap.o irq.o
CFLAGS   = -g3 -march=rv32ima -mabi=ilp32
CPPFLAGS += -I.
LDFLAGS  = -nostartfiles -Wl,--no-relax

VP       = $(VPPATH)/tiny32_4core
#VP_FLAGS = --intercept-syscalls --error-on-zero-traphandler=true --debug-mode
VP_FLAGS = --intercept-syscalls --error-on-zero-traphandler=true

include ../Makefile.common
