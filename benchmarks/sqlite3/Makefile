CN=data/chinook.db
LS=data/query.sql
CMD=$(TIME) $(SQLITE3)
DIR=$(RESULTS)/sqlite3
SIGDIR=$(SIGRESULTS)/sqlite3
Q=".read data/query.sql"

.PHONY: all docker
all:
	$(TIME) $(SQLITE) data/50.db $(Q) $(OUT) $(DIR)/50.$(MODE)
	$(TIME) $(SQLITE) data/100.db $(Q) $(OUT) $(DIR)/100.$(MODE)
	$(TIME) $(SQLITE) data/150.db $(Q) $(OUT) $(DIR)/150.$(MODE)
	$(TIME) $(SQLITE) data/200.db $(Q) $(OUT) $(DIR)/200.$(MODE)
	$(TIME) $(SQLITE) data/250.db $(Q) $(OUT) $(DIR)/250.$(MODE)
	$(TIME) $(SQLITE) data/300.db $(Q) $(OUT) $(DIR)/300.$(MODE)
	$(TIME) $(SQLITE) data/350.db $(Q) $(OUT) $(DIR)/350.$(MODE)
	$(TIME) $(SQLITE) data/400.db $(Q) $(OUT) $(DIR)/400.$(MODE)
	$(TIME) $(SQLITE) data/450.db $(Q) $(OUT) $(DIR)/450.$(MODE)
	$(TIME) $(SQLITE) data/500.db $(Q) $(OUT) $(DIR)/500.$(MODE)
	$(TIME) $(SQLITE) data/550.db $(Q) $(OUT) $(DIR)/550.$(MODE)
	$(TIME) $(SQLITE) data/600.db $(Q) $(OUT) $(DIR)/600.$(MODE)
	$(TIME) $(SQLITE) data/650.db $(Q) $(OUT) $(DIR)/650.$(MODE)
	$(TIME) $(SQLITE) data/700.db $(Q) $(OUT) $(DIR)/700.$(MODE)
	$(TIME) $(SQLITE) data/750.db $(Q) $(OUT) $(DIR)/750.$(MODE)
	$(TIME) $(SQLITE) data/800.db $(Q) $(OUT) $(DIR)/800.$(MODE)
	$(TIME) $(SQLITE) data/850.db $(Q) $(OUT) $(DIR)/850.$(MODE)
	$(TIME) $(SQLITE) data/900.db $(Q) $(OUT) $(DIR)/900.$(MODE)
	$(TIME) $(SQLITE) data/950.db $(Q) $(OUT) $(DIR)/950.$(MODE)
	$(TIME) $(SQLITE) data/1000.db $(Q) $(OUT) $(DIR)/1000.$(MODE)

docker:
	cp ../../btime btime
	docker build -t sqlite3 -f sqlite3.dockerfile .
	docker build -t sqlite3-btime -f sqlite3.btime.dockerfile .

sigtest:
	for i in `seq 1 4`; do sudo taskset -c 6 $(CMD) $(CN) ".read $(LS)" $(OUT) $(SIGDIR)/sqlite3$$i.$(MODE); done
