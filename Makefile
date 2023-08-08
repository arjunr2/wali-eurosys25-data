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
else ifeq ($(MODE),signone)
	export LUA=$(IWASM) $(BENCHMARKS)/lua/lua.signone.aot
	export BASH=$(IWASM) $(BENCHMARKS)/bash/bash.signone.aot
	export SQLITE3=$(IWASM) $(BENCHMARKS)/sqlite3/sqlite3.signone.aot
	export PAHO=$(IWASM) $(BENCHMARKS)/paho-bench/paho-bench.signone.aot
else ifeq ($(MODE),sigall)
	export LUA=$(IWASM) $(BENCHMARKS)/lua/lua.sigall.aot
	export BASH=$(IWASM) $(BENCHMARKS)/bash/bash.sigall.aot
	export SQLITE3=$(IWASM) $(BENCHMARKS)/sqlite3/sqlite3.sigall.aot
	export PAHO=$(IWASM) $(BENCHMARKS)/paho-bench/paho-bench.sigall.aot
else ifeq ($(MODE),sigloop)
	export LUA=$(IWASM) $(BENCHMARKS)/lua/lua.aot
	export BASH=$(IWASM) $(BENCHMARKS)/bash/bash.aot
	export SQLITE3=$(IWASM) $(BENCHMARKS)/sqlite3/sqlite3.aot
	export PAHO=$(IWASM) $(BENCHMARKS)/paho-bench/paho-bench.aot
else ifeq ($(MODE),sigfunc)
	export LUA=$(IWASM) $(BENCHMARKS)/lua/lua.sigfunc.aot
	export BASH=$(IWASM) $(BENCHMARKS)/bash/bash.sigfunc.aot
	export SQLITE3=$(IWASM) $(BENCHMARKS)/sqlite3/sqlite3.sigfunc.aot
	export PAHO=$(IWASM) $(BENCHMARKS)/paho-bench/paho-bench.sigfunc.aot
endif

export TIME=$(shell pwd)/btime
export OUT=>
export RESULTS=$(shell pwd)/results
export SIGRESULTS=$(shell pwd)/sigresults

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


sigdir:
	mkdir -p sigresults

sigtest: sigdir
	mkdir -p sigresults/bash sigresults/lua sigresults/sqlite3 sigresults/paho-bench
	make -C benchmarks/bash sigtest
	make -C benchmarks/lua sigtest
	make -C benchmarks/sqlite3 sigtest
	make -C benchmarks/paho-bench sigtest
