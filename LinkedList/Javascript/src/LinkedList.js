const Node = require('./Node.js');

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
		let counter = 0;
		let node = this._first;

		while (node && counter < index) {
			node = node.next;
			counter += 1;
		}

		return (node) ? node.element : null;
	}

	remove(index) {
		let counter = 0;
		let node = this._first;

		while (node && counter < (index - 1)) {
			node = node.next;
			counter += 1;
		}

		if (node && node.next) {
			node.next = node.next.next
			this._size -= 1;

			return true;
		}

		return false;
	}
}

module.exports = LinkedList;
