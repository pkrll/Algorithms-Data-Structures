//
//  BinarySearchTree.swift
//  BinarySearchTree
//
//  Created by Ardalan Samimi on 2019-01-12.
//

class BinarySearchTree<K: Comparable, T> {

	private(set) var root: Node<K, T>?
	private(set) var size: Int = 0

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

		self.size += 1
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

			self.size -= 1
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

}
