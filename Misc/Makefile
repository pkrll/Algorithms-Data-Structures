.PHONY: test

CLEAN_FILES=ConnectedIslands/node_modules

test:
	cd ConnectedIslands && npm install && npm test

test_js:
	cd ConnectedIslands && npm install && npm test

upgrade:
	cd ConnectedIslands && ncu -u

clean:
	rm -rf $(CLEAN_FILES)
