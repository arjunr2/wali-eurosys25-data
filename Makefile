BENCHMARKS=$(shell pwd)/benchmarks
IWASM=$(shell pwd)/iwasm
QEMU=$(shell pwd)/qemu-x86_64
export TIME=$(shell pwd)/btime
export OUT=>
export RESULTS=$(shell pwd)/results
export SIGRESULTS=$(shell pwd)/sigresults
export WAMRC=$(shell pwd)/wamrc/wamrc


ifeq ($(MODE),native)
	export LUA=$(BENCHMARKS)/lua/lua
	export BASH=$(BENCHMARKS)/bash/bash
	export SQLITE3=$(BENCHMARKS)/sqlite3/sqlite3
else ifeq ($(MODE),docker)
	export LUA=docker run lua
	export BASH=docker run bash
	export SQLITE3=docker run sqlite3
else ifeq ($(MODE),docker-inner)
	export LUA=docker run lua-btime ./lua
	export BASH=docker run bash-btime ./bash
	export SQLITE3=docker run sqlite3-btime ./sqlite3
	export TIME=
else ifeq ($(MODE),wali)
	export LUA=$(IWASM) $(BENCHMARKS)/lua/lua.aot
	export BASH=$(IWASM) $(BENCHMARKS)/bash/bash.aot
	export SQLITE3=$(IWASM) $(BENCHMARKS)/sqlite3/sqlite3.aot
else ifeq ($(MODE),qemu)
	export LUA=$(QEMU) $(BENCHMARKS)/lua/lua
	export BASH=$(QEMU) $(BENCHMARKS)/bash/bash
	export SQLITE3=$(QEMU) $(BENCHMARKS)/sqlite3/sqlite3
else ifeq ($(MODE),signone)
	export LUA=$(IWASM) $(BENCHMARKS)/lua/lua.signone.aot
	export BASH=$(IWASM) $(BENCHMARKS)/bash/bash.signone.aot
	export SQLITE3=$(IWASM) $(BENCHMARKS)/sqlite3/sqlite3.signone.aot
	export PAHO=$(IWASM) $(BENCHMARKS)/paho-bench/paho-bench.signone.aot
	export WAMRC=$(shell pwd)/wamrc/wamrc.no-sigpoll
else ifeq ($(MODE),sigall)
	export LUA=$(IWASM) $(BENCHMARKS)/lua/lua.sigall.aot
	export BASH=$(IWASM) $(BENCHMARKS)/bash/bash.sigall.aot
	export SQLITE3=$(IWASM) $(BENCHMARKS)/sqlite3/sqlite3.sigall.aot
	export PAHO=$(IWASM) $(BENCHMARKS)/paho-bench/paho-bench.sigall.aot
	export WAMRC=$(shell pwd)/wamrc/wamrc.all-sigpoll
else ifeq ($(MODE),sigloop)
	export LUA=$(IWASM) $(BENCHMARKS)/lua/lua.aot
	export BASH=$(IWASM) $(BENCHMARKS)/bash/bash.aot
	export SQLITE3=$(IWASM) $(BENCHMARKS)/sqlite3/sqlite3.aot
	export PAHO=$(IWASM) $(BENCHMARKS)/paho-bench/paho-bench.aot
	export WAMRC=$(shell pwd)/wamrc/wamrc.loop-sigpoll
else ifeq ($(MODE),sigfunc)
	export LUA=$(IWASM) $(BENCHMARKS)/lua/lua.sigfunc.aot
	export BASH=$(IWASM) $(BENCHMARKS)/bash/bash.sigfunc.aot
	export SQLITE3=$(IWASM) $(BENCHMARKS)/sqlite3/sqlite3.sigfunc.aot
	export PAHO=$(IWASM) $(BENCHMARKS)/paho-bench/paho-bench.sigfunc.aot
	export WAMRC=$(shell pwd)/wamrc/wamrc.func-sigpoll
endif

all: dir lua bash sqlite3

build-aot:
	make -C benchmarks/bash build-aot &
	make -C benchmarks/lua build-aot &
	make -C benchmarks/sqlite3 build-aot &
	make -C benchmarks/paho-bench build-aot &

dir:
	mkdir -p results

lua:
	mkdir -p results/lua
	make -C benchmarks/lua

bash:
	mkdir -p results/bash
	make -C benchmarks/bash

sqlite3:
	mkdir -p results/sqlite3
	make -C benchmarks/sqlite3

btime: btime.c
	gcc btime.c -lm -o btime

docker:
	make -C benchmarks/lua docker
	make -C benchmarks/bash docker
	make -C benchmarks/sqlite3 docker

sigdir:
	mkdir -p sigresults

sigtest: sigdir
	mkdir -p sigresults/bash sigresults/lua sigresults/sqlite3 sigresults/paho-bench
	make -C benchmarks/bash sigtest
	make -C benchmarks/lua sigtest
	make -C benchmarks/sqlite3 sigtest
	make -C benchmarks/paho-bench sigtest
