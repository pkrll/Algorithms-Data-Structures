const Queue = require('../src/Queue.js');

test('Queue: Peek', () => {
	let queue = new Queue();
	expect(queue.isEmpty).toBe(true);

	queue.enqueue("Hello World!");
  expect(queue.peek()).toBe("Hello World!");

	queue.enqueue("Goodbye World!");
  expect(queue.peek()).toBe("Hello World!");

	_ = queue.dequeue();
	expect(queue.peek()).toBe("Goodbye World!");
});

test('Queue: enqueue', () => {
	let queue = new Queue();
	expect(queue.isEmpty).toBe(true);

	for (let i = 0; i < 10; i++) {
		queue.enqueue(i);
	}

	expect(queue.size).toBe(10);
	expect(queue.peek()).toBe(0);

	_ = queue.dequeue();
	expect(queue.peek()).toBe(1);

	_ = queue.dequeue();
	queue.enqueue(1);
	expect(queue.peek()).toBe(2);
});

test('Queue: dequeue', () => {
	let queue = new Queue();
	expect(queue.isEmpty).toBe(true);

	for (let i = 0; i < 10; i++) {
		queue.enqueue(i);
	}

	expect(queue.size).toBe(10);

	for (let i = 0; i < 10; i++) {
		expect(queue.dequeue()).toBe(i);
	}

	expect(queue.size).toBe(0);
});
