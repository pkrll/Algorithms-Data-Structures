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

	insert(element, index) {
		if (index < 0) index = mod(index, this._size + 1) || 0;

		let new_node = new Node(element);
		let cur_node = this._first;

		for (let counter = 0; cur_node && counter < (index - 1); counter++) {
			cur_node = cur_node.next;
		}

		if (cur_node) {
			new_node.next = cur_node.next;
			cur_node.next = new_node;
		}

		if (index == 0)          this._first = new_node;
		if (index == this._size) this._last  = new_node;

		this._size += 1;
	}

	append(element) {
		this.insert(element, -1);
	}

	prepend(element) {
		this.insert(element, 0);
	}

	get(index) {
		let node = this._getNode(index);
		return (node) ? node.element : null;
	}

	remove(index) {
		if (this._size == 0) return false;

		let node = this._getNode(index - 1)

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

	_getNode(index) {
		if (this._size == 0) return null;
		if (index < 0) index = mod(index, this._size);

		let node = this._first;

		for (let counter = 0; node && counter < index; counter++) {
			node = node.next;
		}

		return node;
	}
}

module.exports = LinkedList;
