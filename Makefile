.PHONY: all test clean clean_builds

## FOLDERS & FILES ##
SUB_DIRS = $(patsubst %/, %, $(wildcard */))
BLD_DIRS = $(shell find . -type d -name .build)
OBJ_DIRS = $(patsubst %/, %/*, $(wildcard */C/obj/))

all:
	@echo "No rule chosen. Aborting."

test: $(SUB_DIRS)

.PHONY: $(SUB_DIRS)
$(SUB_DIRS):
	$(MAKE) -C $@

clean:
	@echo "Cleaning files..."
	@for dir in $(SUB_DIRS) ; do \
		rm -rf $$dir/C/obj/* ; \
		rm -rf $$dir/Swift/.build ; \
	done
