const LinkedList = require('../src/LinkedList.js');

test('LinkedList append', () => {
	let linkedList = new LinkedList();
	expect(linkedList.size()).toBe(0);

	linkedList.append("Hello");
	expect(linkedList.size()).toBe(1);
	expect(linkedList.last()).toBe("Hello");
	linkedList.append("World");
	expect(linkedList.size()).toBe(2);
	expect(linkedList.last()).toBe("World");
	linkedList.append("Foo");
	expect(linkedList.size()).toBe(3);
	expect(linkedList.last()).toBe("Foo");
	linkedList.append("Bar");
	expect(linkedList.size()).toBe(4);
	expect(linkedList.last()).toBe("Bar");

	linkedList = new LinkedList();
	expect(linkedList.size()).toBe(0);

	for (let i = 1; i <= 25; i++) {
		linkedList.append(i);
		expect(linkedList.size()).toBe(i);
		expect(linkedList.last()).toBe(i);
	}
});

test('LinkedList prepend', () => {
	let linkedList = new LinkedList();
	expect(linkedList.size()).toBe(0);

	for (let i = 1; i <= 50; i++) {
		linkedList.prepend(i);
		expect(linkedList.size()).toBe(i);
		expect(linkedList.first()).toBe(i);
	}

	linkedList = new LinkedList();
	linkedList.append("Bar");
	linkedList.append("Foo");
	expect(linkedList.first()).toBe("Bar");

	linkedList.prepend("World");
	expect(linkedList.first()).toBe("World");
});

test('LinkedList get', () => {
	let linkedList = new LinkedList();

	for (let i = 0; i < 50; i++) {
		linkedList.append(i);
	}

	expect(linkedList.get(32)).toBe(32);
	expect(linkedList.get(16)).toBe(16);

	expect(linkedList.get(-1)).toBe(49);
	expect(linkedList.get(-50)).toBe(0);
	expect(linkedList.get(-100)).toBe(0);
	expect(linkedList.get(-101)).toBe(49);

	linkedList.remove(25);
	expect(linkedList.get(25)).toBe(26);
});

test('LinkedList remove', () => {
	let linkedList = new LinkedList();

	for (let i = 0; i < 100; i++) {
		linkedList.append(i);
	}

	expect(linkedList.size()).toBe(100);

	linkedList.remove(50);
	linkedList.remove(50);
	expect(linkedList.size()).toBe(98);

	for (let i = 97; i >= 0; i--) {
		expect(linkedList.remove(i)).toBe(true);
	}
	expect(linkedList.size()).toBe(0);
});

test('LinkedList insert', () => {
	let linkedList = new LinkedList();

	linkedList.append("Hello");
	linkedList.append("World");

	linkedList.insert("Foo", -1);

	expect(linkedList.last()).toBe("Foo");
	linkedList.insert("Bar", 0);
	expect(linkedList.first()).toBe("Bar");

	linkedList.insert("Baz", 2);
	expect(linkedList.get(2)).toBe("Baz");
	expect(linkedList.get(3)).toBe("World");
});
