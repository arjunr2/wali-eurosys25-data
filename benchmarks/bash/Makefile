FL=data/forloop.sh
FB=data/fibonacci.sh
CMD=$(TIME) $(BASH)
DIR=$(RESULTS)/bash

.PHONY: all docker
all:
	$(CMD) $(FL) 25000 $(OUT) $(DIR)/fl1.$(MODE)
	$(CMD) $(FL) 50000 $(OUT) $(DIR)/fl2.$(MODE)
	$(CMD) $(FL) 75000 $(OUT) $(DIR)/fl3.$(MODE)
	$(CMD) $(FL) 100000 $(OUT) $(DIR)/fl4.$(MODE)
	$(CMD) $(FL) 125000 $(OUT) $(DIR)/fl5.$(MODE)
	$(CMD) $(FL) 150000 $(OUT) $(DIR)/fl6.$(MODE)
	$(CMD) $(FL) 175000 $(OUT) $(DIR)/fl7.$(MODE)
	$(CMD) $(FL) 200000 $(OUT) $(DIR)/fl8.$(MODE)
	$(CMD) $(FB) 10000 $(OUT) $(DIR)/fb1.$(MODE)
	$(CMD) $(FB) 20000 $(OUT) $(DIR)/fb2.$(MODE)
	$(CMD) $(FB) 30000 $(OUT) $(DIR)/fb3.$(MODE)
	$(CMD) $(FB) 40000 $(OUT) $(DIR)/fb4.$(MODE)
	$(CMD) $(FB) 50000 $(OUT) $(DIR)/fb5.$(MODE)
	$(CMD) $(FB) 60000 $(OUT) $(DIR)/fb6.$(MODE)
	$(CMD) $(FB) 70000 $(OUT) $(DIR)/fb7.$(MODE)
	$(CMD) $(FB) 80000 $(OUT) $(DIR)/fb8.$(MODE)
	$(CMD) $(FB) 90000 $(OUT) $(DIR)/fb9.$(MODE)
	$(CMD) $(FB) 100000 $(OUT) $(DIR)/fb10.$(MODE)
docker:
	docker build -t bash -f bash.dockerfile .
