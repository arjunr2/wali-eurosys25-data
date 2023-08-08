CN=data/chinook.db
LS=data/query.sql
CMD=$(TIME) $(SQLITE3)
DIR=$(RESULTS)/sqlite3
SIGDIR=$(SIGRESULTS)/sqlite3

.PHONY: all docker
all:

docker:
	docker build -t sqlite3 -f sqlite3.dockerfile .

sigtest:
	for i in `seq 1 4`; do sudo taskset -c 6 $(CMD) $(CN) ".read $(LS)" $(OUT) $(SIGDIR)/sqlite3$$i.$(MODE); done
