
public class LinkedList<T: Equatable> {

	private var head: Node<T>? = nil
	private var tail: Node<T>? = nil
	private var size: Int = 0

	public var count: Int {
		return self.size
	}

	public var first: T? {
		return self.head?.data
	}

	public var last: T? {
		return self.tail?.data
	}

	public subscript(index: Int) -> T? {
		get {
			return self.element(at: index)
		}
		set {
			if let data = newValue {
				self.insert(data, at: index)
			}
		}
	}

	public func toString() {
		var node = self.head

		while node != nil {
			print("\(node!.data)", terminator: ", ")
			node = node?.next
		}

		print("")
	}

	public func prepend(_ data: T) {
		let node = Node(data, next: self.head)
		self.size += 1

		guard self.head != nil else {
			self.head = node
			self.tail = node
			return
		}

		self.head = node
	}

	public func append(_ data: T) {
		let node = Node(data)
		self.size += 1

		guard let tail = self.tail else {
			self.head = node
			self.tail = node
			return
		}

		tail.next = node
		self.tail = node
	}

	public func insert(_ data: T, at index: Int) {
		let index = self.adjustIndex(index)

		guard index < self.size else {
			self.append(data)
			return
		}

		guard index > 0 else {
			self.prepend(data)
			return
		}

		var node = self.head
		var prev = self.head

		for _ in 0..<index {
			prev = node
			node = node?.next
		}

		prev?.next = Node(data, next: prev?.next)
		self.size += 1
	}

	public func remove(_ data: T) -> Bool {
		guard self.size > 0 else {
			return false
		}

		var current = self.head

		guard current?.data != data else {
			self.head = current?.next
			current?.next = nil
			self.size -= 1
			return true
		}

		while let next = current?.next {
			if next.data == data {
				current?.next = next.next
				next.next = nil
				self.size -= 1

				return true
			}

			current = current?.next
		}

		return false
	}

	public func removeAll() {
		self.head = nil
		self.tail = nil
		self.size = 0
	}

	public func element(at index: Int) -> T? {
		let index = self.adjustIndex(index)

		guard index < self.size else {
			return nil
		}

		var node = self.head

		for _ in 0..<index {
			node = node?.next
		}

		return node?.data
	}

	public func contains(element: T) -> Bool {
		var node = self.head

		while node != nil {
			if node!.data == element {
				return true
			}

			node = node?.next
		}

		return false
	}

	private func adjustIndex(_ index: Int) -> Int {
		if index < 0 {
			return 1 + index + self.size
		}

		return index
	}

}

fileprivate class Node<T: Equatable> {

	fileprivate let data: T
	fileprivate var next: Node<T>?
	fileprivate var prev: Node<T>?

	init(_ data: T, next: Node<T>? = nil) {
		self.data = data
		self.next = next
	}

}
