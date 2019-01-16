.PHONY: test test_swift test_c clean

CLEAN_FILES=Swift/.build

test: test_swift test_c

test_swift:
	cd Swift && swift test

test_c:
	cd C && make test

clean:
	rm -rf $(CLEAN_FILES)
	cd C && make clean
