CN=data/chinook.db
LS=data/query.sql
CMD=$(TIME) $(SQLITE3)
DIR=$(RESULTS)/sqlite3
SIGDIR=$(SIGRESULTS)/sqlite3
Q=".read data/query.sql"

.PHONY: all docker
all:
	$(CMD) data/50.db $(Q) $(OUT) $(DIR)/50.$(MODE)
	$(CMD) data/100.db $(Q) $(OUT) $(DIR)/100.$(MODE)
	$(CMD) data/150.db $(Q) $(OUT) $(DIR)/150.$(MODE)
	$(CMD) data/200.db $(Q) $(OUT) $(DIR)/200.$(MODE)
	$(CMD) data/250.db $(Q) $(OUT) $(DIR)/250.$(MODE)
	$(CMD) data/300.db $(Q) $(OUT) $(DIR)/300.$(MODE)
	$(CMD) data/350.db $(Q) $(OUT) $(DIR)/350.$(MODE)
	$(CMD) data/400.db $(Q) $(OUT) $(DIR)/400.$(MODE)
	$(CMD) data/450.db $(Q) $(OUT) $(DIR)/450.$(MODE)
	$(CMD) data/500.db $(Q) $(OUT) $(DIR)/500.$(MODE)
	$(CMD) data/550.db $(Q) $(OUT) $(DIR)/550.$(MODE)
	$(CMD) data/600.db $(Q) $(OUT) $(DIR)/600.$(MODE)
	$(CMD) data/650.db $(Q) $(OUT) $(DIR)/650.$(MODE)
	$(CMD) data/700.db $(Q) $(OUT) $(DIR)/700.$(MODE)
	$(CMD) data/750.db $(Q) $(OUT) $(DIR)/750.$(MODE)
	$(CMD) data/800.db $(Q) $(OUT) $(DIR)/800.$(MODE)
	$(CMD) data/850.db $(Q) $(OUT) $(DIR)/850.$(MODE)
	$(CMD) data/900.db $(Q) $(OUT) $(DIR)/900.$(MODE)
	$(CMD) data/950.db $(Q) $(OUT) $(DIR)/950.$(MODE)
	$(CMD) data/1000.db $(Q) $(OUT) $(DIR)/1000.$(MODE)

docker:
	cp ../../btime btime
	docker build -t sqlite3 -f sqlite3.dockerfile .
	docker build -t sqlite3-btime -f sqlite3.btime.dockerfile .

sigtest:
	for i in `seq 1 4`; do sudo taskset -c 6 $(CMD) data/400.db $(Q) $(OUT) $(SIGDIR)/sqlite3$$i.$(MODE); done

build-aot:
	$(WAMRC) --enable-multi-thread -o sqlite3$(SIGPREFIX).aot sqlite3.wasm
