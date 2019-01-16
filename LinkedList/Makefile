.PHONY: test test_js

CLEAN_FILES=Swift/.build

test: test_js test_c test_swift

test_js:
	cd Javascript && npm install && npm test

test_c:
	cd C && make test

test_swift:
	cd Swift && swift test

clean:
	rm -rf $(CLEAN_FILES)
