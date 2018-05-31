.PHONY: all test clean clean_builds

## FOLDERS & FILES ##
SUB_DIRS = $(patsubst %/, %, $(wildcard */))
BLD_DIRS = $(shell find . -type d -name .build)

all:
	@echo "No rule chosen. Aborting."

test: $(SUB_DIRS)

.PHONY: $(SUB_DIRS)
$(SUB_DIRS):
	cd $@ && swift test

clean: clean_builds

clean_builds: $(BLD_DIRS)
ifneq ($(BLD_DIRS), )
	rm -rf $^
endif
