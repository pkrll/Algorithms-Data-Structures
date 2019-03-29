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
	@for dir in $(SUB_DIRS) ; do \
		$(MAKE) -C $$dir clean ; \
	done
	@echo "Files cleaned..."
