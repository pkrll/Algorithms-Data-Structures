.PHONY: test

test:
	cd Swift && swift test
	cd C && make test

clean:
	rm -rf C/bin/*
	rm -rf C/obj/*
	rm -rf Swift/.build
