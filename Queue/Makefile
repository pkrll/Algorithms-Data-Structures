.PHONY: test

CLEAN_FILES=Swift/.build

test: test_swift test_c test_js

test_js:
	cd Javascript && npm install && npm test

test_c:
	cd C && make test

test_swift:
	cd Swift && swift test

clean:
	rm -rf $(CLEAN_FILES)
