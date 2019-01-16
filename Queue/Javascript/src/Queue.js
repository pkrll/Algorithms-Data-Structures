
class Queue {

	constructor() {
		this._elements = [];
		this._size = 0;
	}

	get isEmpty() {
		return (this._size == 0);
	}

	get size() {
		return this._size;
	}

	peek() {
		if (this._size == 0) return null;
		return this._elements[0];
	}

	enqueue(element) {
		this._elements.push(element);
		this._size += 1;
	}

	dequeue() {
		if (this._size == 0) return null;
		this._size -= 1;
		return this._elements.shift();
	}

}
module.exports = Queue;
