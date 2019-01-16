const Node = require('./Node.js');
const mod  = (x, n) => (x % n + n) % n

class LinkedList {

	constructor() {
		this._first = null;
		this._last  = null;
		this._size  = 0;
	}

	first() {
		return (this._first) ? this._first.element : null;
	}

	last() {
		return (this._last) ? this._last.element : null;
	}

	size() {
		return this._size;
	}

	append(element) {
		let node = new Node(element);

		if (this._size > 0) {
			this._last.next = node;
			this._last = node;
		} else {
			this._last = node;
			this._first = node;
		}

		this._size += 1;
	}

	prepend(element) {
		let node = new Node(element);

		if (this._size > 0) {
			node.next = this._first;
			this._first = node;
		} else {
			this._last = node;
			this._first = node;
		}

		this._size += 1;
	}

	get(index) {
		if (this._size == 0) return null;
		if (index < 0) index = mod(index, this._size);

		let node = this._first;

		for (let counter = 0; node && counter < index; counter++) {
			node = node.next;
		}

		return (node) ? node.element : null;
	}

	remove(index) {
		if (this._size == 0) return false;
		if (index < 0) index = mod(index, this._size);

		let node = this._first;

		for (let counter = 0; node && counter < (index - 1); counter++) {
			node = node.next;
		}

		if (node) {
			this._size -= 1;

			if (index == 0) {
				this._first = this._first.next;
			} else {
				node.next = (node.next) ? node.next.next : null;
			}

			if (index == this._size) {
				this._last = (this._size > 0) ? node : null;
			}

			return true;
		}

		return false;
	}
}

module.exports = LinkedList;
