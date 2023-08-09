BT=data/binarytrees.lua
MT=data/merkletrees.lua
NB=data/nbody.lua
SN=data/spectral-norm.lua
CMD=$(TIME) $(LUA)
DIR=$(RESULTS)/lua
SIGDIR=$(SIGRESULTS)/lua

.PHONY: all docker
all:
	$(CMD) $(BT) 9 $(OUT) $(DIR)/bt9.$(MODE)
	$(CMD) $(BT) 10 $(OUT) $(DIR)/bt10.$(MODE)
	$(CMD) $(BT) 11 $(OUT) $(DIR)/bt11.$(MODE)
	$(CMD) $(BT) 12 $(OUT) $(DIR)/bt12.$(MODE)
	$(CMD) $(BT) 13 $(OUT) $(DIR)/bt13.$(MODE)
	$(CMD) $(BT) 14 $(OUT) $(DIR)/bt14.$(MODE)
	$(CMD) $(BT) 15 $(OUT) $(DIR)/bt15.$(MODE)
	$(CMD) $(BT) 16 $(OUT) $(DIR)/bt16.$(MODE)
	$(CMD) $(MT) 7 $(OUT) $(DIR)/mt7.$(MODE)
	$(CMD) $(MT) 8 $(OUT) $(DIR)/mt8.$(MODE)
	$(CMD) $(MT) 9 $(OUT) $(DIR)/mt9.$(MODE)
	$(CMD) $(MT) 10 $(OUT) $(DIR)/mt10.$(MODE)
	$(CMD) $(MT) 11 $(OUT) $(DIR)/mt11.$(MODE)
	$(CMD) $(MT) 12 $(OUT) $(DIR)/mt12.$(MODE)
	$(CMD) $(MT) 13 $(OUT) $(DIR)/mt13.$(MODE)
	$(CMD) $(MT) 14 $(OUT) $(DIR)/mt14.$(MODE)
	$(CMD) $(NB) 50000 $(OUT) $(DIR)/nb1.$(MODE)
	$(CMD) $(NB) 100000 $(OUT) $(DIR)/nb2.$(MODE)
	$(CMD) $(NB) 150000 $(OUT) $(DIR)/nb3.$(MODE)
	$(CMD) $(NB) 200000 $(OUT) $(DIR)/nb4.$(MODE)
	$(CMD) $(NB) 250000 $(OUT) $(DIR)/nb5.$(MODE)
	$(CMD) $(NB) 300000 $(OUT) $(DIR)/nb6.$(MODE)
	$(CMD) $(NB) 350000 $(OUT) $(DIR)/nb7.$(MODE)
	$(CMD) $(NB) 400000 $(OUT) $(DIR)/nb8.$(MODE)
	$(CMD) $(NB) 450000 $(OUT) $(DIR)/nb9.$(MODE)
	$(CMD) $(NB) 500000 $(OUT) $(DIR)/nb10.$(MODE)
	$(CMD) $(SN) 100 $(OUT) $(DIR)/sn100.$(MODE)
	$(CMD) $(SN) 200 $(OUT) $(DIR)/sn200.$(MODE)
	$(CMD) $(SN) 300 $(OUT) $(DIR)/sn300.$(MODE)
	$(CMD) $(SN) 400 $(OUT) $(DIR)/sn400.$(MODE)
	$(CMD) $(SN) 500 $(OUT) $(DIR)/sn500.$(MODE)
	$(CMD) $(SN) 600 $(OUT) $(DIR)/sn600.$(MODE)
	$(CMD) $(SN) 700 $(OUT) $(DIR)/sn700.$(MODE)
	$(CMD) $(SN) 800 $(OUT) $(DIR)/sn800.$(MODE)
	$(CMD) $(SN) 900 $(OUT) $(DIR)/sn900.$(MODE)
	$(CMD) $(SN) 1000 $(OUT) $(DIR)/sn1000.$(MODE)

docker:
	cp ../../btime btime
	docker build -t lua -f lua.dockerfile .

sigtest:
	for i in `seq 1 4`; do sudo taskset -c 6 $(CMD) $(BT) 14 $(OUT) $(SIGDIR)/lua$$i.$(MODE); done
