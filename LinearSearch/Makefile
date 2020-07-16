.PHONY: test

CLEAN_FILES=Swift/.build Javascript/node_modules

test: test_swift test_c test_js

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
