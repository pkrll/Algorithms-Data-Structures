.PHONY: test

CLEAN_FILES=Swift/.build

test:
	cd Swift && swift test
	cd C && make test

clean:
	rm -rf $(CLEAN_FILES)
