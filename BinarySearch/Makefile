.PHONY: test

CLEAN_FILES=Swift/.build

test: test_swift test_js test_c

test_c:
	cd C && make test

test_js:
	cd Javascript && npm install && npm test

test_swift:
	cd Swift && swift test

upgrade:
	cd Javascript && ncu -u

clean:
	rm -rf $(CLEAN_FILES)
	cd C && make clean
