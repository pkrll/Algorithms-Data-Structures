.PHONY: test

CLEAN_FILES=Swift/.build

test:
	cd Swift && swift test
	cd Javascript && npm install && npm test

clean:
	rm -rf $(CLEAN_FILES)
	cd Java && make clean
	cd Python && make clean
