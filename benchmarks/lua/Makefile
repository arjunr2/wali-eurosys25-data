BT=data/binarytrees.lua
MT=data/merkletrees.lua
NB=data/nbody.lua
SN=data/spectral-norm.lua
CMD=$(TIME) $(LUA)
DIR=$(RESULTS)/lua

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
	$(CMD) $(NB) 2000 $(OUT) $(DIR)/nb2k.$(MODE)
	$(CMD) $(NB) 5000 $(OUT) $(DIR)/nb5k.$(MODE)
	$(CMD) $(NB) 10000 $(OUT) $(DIR)/nb10k.$(MODE)
	$(CMD) $(NB) 20000 $(OUT) $(DIR)/nb20k.$(MODE)
	$(CMD) $(NB) 50000 $(OUT) $(DIR)/nb50k.$(MODE)
	$(CMD) $(NB) 100000 $(OUT) $(DIR)/nb100k.$(MODE)
	$(CMD) $(NB) 200000 $(OUT) $(DIR)/nb200k.$(MODE)
	$(CMD) $(NB) 500000 $(OUT) $(DIR)/nb500k.$(MODE)
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
	docker build -t lua -f lua.dockerfile .
