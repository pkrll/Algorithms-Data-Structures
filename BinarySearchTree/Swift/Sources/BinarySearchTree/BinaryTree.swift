//
//  BinarySearchTree.swift
//  BinarySearchTree
//
//  Created by Ardalan Samimi on 2019-01-12.
//

class BinarySearchTree<K: Comparable, T> {

	private(set) var root: Node<K, T>?

	var size: Int {
		return self.size(self.root)
	}

	var depth: Int {
		return self.depth(self.root)
	}

	var keys: [K] {
		return self.keys(self.root)
	}

	var elements: [T] {
		return self.elements(self.root)
	}

	var isBalanced: Bool {
		return self.isBalanced(self.root)
	}

	func minimum() -> T? {
		guard let node = self.minimum(self.root) else { return nil }
		return node.element
	}

	func maximum() -> T? {
		guard let node = self.maximum(self.root) else { return nil }
		return node.element
	}

	func insert(_ element: T, forKey key: K) {
		if size == 0 {
			self.root = Node(withElement: element, forKey: key)
		} else {
			let node = Node(withElement: element, forKey: key)
			self.insert(node, withRoot: self.root!)
		}
	}

	func findElement(withKey key: K) -> T? {
		var node = self.root

		while node != nil {
			if node!.key > key {
				node = node!.leftNode
			} else if node!.key < key {
				node = node!.rightNode
			} else {
				return node!.element
			}
		}

		return nil
	}

	func remove(_ key: K) {
		if size == 0 { return }
		self.root = self.remove(key, self.root)
	}

	func balance() {
		let size = self.size
		let keys = self.keys
		let elements = self.elements

		self.root = nil

		self.balance(elements, withKeys: keys, startingAt: 0, endingAt: size - 1)
	}

	private func balance(_ elements: [T], withKeys keys: [K], startingAt start: Int, endingAt end: Int) {
		if start <= end {
			let middle = (start + end) / 2

			self.insert(elements[middle], forKey: keys[middle])

			self.balance(elements, withKeys: keys, startingAt: start, endingAt: middle - 1)
			self.balance(elements, withKeys: keys, startingAt: middle + 1, endingAt: end)
		}
	}

	private func keys(_ root: Node<K, T>?) -> [K] {
		guard let node = root else { return [] }

		var keys = [K]()
		keys += self.keys(node.leftNode)
		keys += [node.key]
		keys += self.keys(node.rightNode)

		return keys
	}

	private func elements(_ root: Node<K, T>?) -> [T] {
		guard let node = root else { return [] }

		var elements = [T]()
		elements += self.elements(node.leftNode)
		elements += [node.element]
		elements += self.elements(node.rightNode)

		return elements
	}

	private func remove(_ key: K, _ root: Node<K, T>?) -> Node<K, T>? {
		guard let node = root else { return nil }

		if node.key > key {
			node.leftNode = self.remove(key, node.leftNode)
		} else if node.key < key {
			node.rightNode = self.remove(key, node.rightNode)
		} else {
			if node.leftNode  == nil { return node.rightNode }
			if node.rightNode == nil { return node.leftNode }

			self.replace(node, with: self.minimum(node.rightNode)!)
		}

		return node
	}

	private func replace(_ oldNode: Node<K, T>, with newNode: Node<K, T>) {
		oldNode.element = newNode.element
		oldNode.key = newNode.key
		oldNode.rightNode = self.remove(oldNode.key, oldNode.rightNode)
	}

	private func insert(_ node: Node<K, T>, withRoot root: Node<K, T>) {
		if root.key > node.key {
			if let leftNode = root.leftNode {
				self.insert(node, withRoot: leftNode)
			} else {
				root.leftNode = node
			}
		} else {
			if let rightNode = root.rightNode {
				self.insert(node, withRoot: rightNode)
			} else {
				root.rightNode = node
			}
		}
	}

	private func deleteMinimum(_ node: Node<K, T>) -> Node<K, T>? {
		guard let leftNode = node.leftNode else {
			return node.rightNode
		}

		node.leftNode = self.deleteMinimum(leftNode)

		return node
	}

	private func deleteMaximum(_ node: Node<K, T>) -> Node<K, T>? {
		guard let rightNode = node.rightNode else {
			return node.leftNode
		}

		node.rightNode = self.deleteMaximum(rightNode)

		return node
	}

	private func minimum(_ root: Node<K, T>?) -> Node<K, T>? {
		var node = root

		while node?.leftNode != nil {
			node = node?.leftNode
		}

		return node
	}

	private func maximum(_ root: Node<K, T>?) -> Node<K, T>? {
		var node = root

		while node?.rightNode != nil {
			node = node?.rightNode
		}

		return node
	}

	private func size(_ root: Node<K, T>?) -> Int {
		guard let node = root else {
			return 0
		}

		return 1 + self.size(node.leftNode) + self.size(node.rightNode)
	}

	private func depth(_ root: Node<K, T>?) -> Int {
		guard let node = root else { return 0 }

		let depthLeft = self.depth(node.leftNode) + 1
		let depthRight = self.depth(node.rightNode) + 1

		return depthLeft > depthRight ? depthLeft : depthRight
	}

	private func isBalanced(_ root: Node<K, T>?) -> Bool {
		guard let node = root else { return true }

		let leftTree = self.isBalanced(node.leftNode)
		let rightTree = self.isBalanced(node.rightNode)
		let height = abs(self.depth(node.leftNode) - self.depth(node.rightNode))

		return leftTree && rightTree && height <= 1
	}

}
