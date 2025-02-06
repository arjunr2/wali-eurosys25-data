CMD=$(TIME) $(PAHO)
DIR=$(RESULTS)/paho-bench
SIGDIR=$(SIGRESULTS)/paho-bench

.PHONY: all docker
all:

docker:
	cp ../../btime btime
	docker build -t paho-bench -f paho-bench.dockerfile .

sigtest:
	for i in `seq 1 4`; do $(CMD) --pub=topic --sub=topic --iterations=500 --interval=1000 --qos=0 $(OUT) $(SIGDIR)/paho-bench$$i.$(MODE); done

build-aot:
	$(WAMRC) --enable-multi-thread -o paho-bench$(SIGPREFIX).aot paho-bench.wasm
