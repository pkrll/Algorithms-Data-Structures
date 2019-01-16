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

test('LinkedList()', () => {
	let linkedList = new LinkedList();
	linkedList.append("Hello");
	linkedList.prepend("World");
	expect(linkedList.get(1)).toBe("Hello");
	expect(linkedList.get(0)).toBe("World");
	expect(linkedList.remove(1)).toEqual(true);
	expect(linkedList.get(1)).toBe(null);
});
