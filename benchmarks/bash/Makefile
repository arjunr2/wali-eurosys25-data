FL=data/forloop.sh
FB=data/fibonacci.sh
CMD=$(TIME) $(BASH)
DIR=$(RESULTS)/bash

.PHONY: all docker
all:
	$(CMD) $(FL) 1000 $(OUT) $(DIR)/fl1k.$(MODE)
	$(CMD) $(FL) 2000 $(OUT) $(DIR)/fl2k.$(MODE)
	$(CMD) $(FL) 5000 $(OUT) $(DIR)/fl5k.$(MODE)
	$(CMD) $(FL) 10000 $(OUT) $(DIR)/fl10k.$(MODE)
	$(CMD) $(FL) 20000 $(OUT) $(DIR)/fl20k.$(MODE)
	$(CMD) $(FL) 50000 $(OUT) $(DIR)/fl50k.$(MODE)
	$(CMD) $(FL) 100000 $(OUT) $(DIR)/fl100k.$(MODE)
	$(CMD) $(FL) 200000 $(OUT) $(DIR)/fl200k.$(MODE)
	$(CMD) $(FL) 500000 $(OUT) $(DIR)/fl500k.$(MODE)
	$(CMD) $(FB) 500 $(OUT) $(DIR)/fb500.$(MODE)
	$(CMD) $(FB) 1000 $(OUT) $(DIR)/fb1k.$(MODE)
	$(CMD) $(FB) 2000 $(OUT) $(DIR)/fb2k.$(MODE)
	$(CMD) $(FB) 5000 $(OUT) $(DIR)/fb5k.$(MODE)
	$(CMD) $(FB) 10000 $(OUT) $(DIR)/fb10k.$(MODE)
	$(CMD) $(FB) 20000 $(OUT) $(DIR)/fb20k.$(MODE)
	$(CMD) $(FB) 50000 $(OUT) $(DIR)/fb50k.$(MODE)
	$(CMD) $(FB) 100000 $(OUT) $(DIR)/fb100k.$(MODE)
	$(CMD) $(FB) 200000 $(OUT) $(DIR)/fb200k.$(MODE)
docker:
	docker build -t bash -f bash.dockerfile .
