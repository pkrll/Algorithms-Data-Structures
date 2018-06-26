.PHONY: test

CLEAN_FILES=Swift/.build

test:
	cd Swift && swift test
	cd C && make test
	cd Javascript && npm install && npm test

clean:
	rm -rf $(CLEAN_FILES)
