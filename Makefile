BENCHMARKS=$(shell pwd)/benchmarks
IWASM=$(shell pwd)/iwasm
QEMU=$(shell pwd)/qemu-x86_64

ifeq ($(MODE),native)
	export LUA=$(BENCHMARKS)/lua/lua
	export BASH=$(BENCHMARKS)/bash/bash
else ifeq ($(MODE),docker)
	export LUA=docker run lua
	export BASH=docker run bash
else ifeq ($(MODE),wali)
	export LUA=$(IWASM) $(BENCHMARKS)/lua/lua.aot
	export BASH=$(IWASM) $(BENCHMARKS)/bash/bash.aot
else ifeq ($(MODE),qemu)
	export LUA=$(QEMU) $(BENCHMARKS)/lua/lua
	export BASH=$(QEMU) $(BENCHMARKS)/bash/bash
endif

export TIME=$(shell pwd)/btime
export OUT=>
export RESULTS=$(shell pwd)/results

all: dir lua bash

dir:
	mkdir -p results

lua:
	mkdir -p results/lua
	make -C benchmarks/lua

bash:
	mkdir -p results/bash
	make -C benchmarks/bash

btime: btime.c
	gcc btime.c -lm -o btime

docker:
	make -C benchmarks/lua docker
	make -C benchmarks/bash docker
