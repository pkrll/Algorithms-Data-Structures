.PHONY: test

CLEAN_FILES=C/bin/* c/obj/* Swift/.build

test:
	cd Swift && swift test
	cd C && make test

clean:
	rm -rf $(CLEAN_FILES)
	cd C && make clean
