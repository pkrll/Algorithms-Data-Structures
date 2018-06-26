.PHONY: test

CLEAN_FILES=Swift/.build

test:
	cd Swift && swift test
	cd Javascript && npm test

clean:
	rm -rf $(CLEAN_FILES)
