//
//  Node.swift
//  BinaryTree
//
//  Created by Ardalan Samimi on 2018-01-12.
//

class Node<K: Comparable, T> {

	var key: K
	var element: T
	var parent: Node<K, T>?
	var leftNode: Node<K, T>?
	var rightNode: Node<K, T>?

	init(withElement element: T, forKey key: K) {
		self.key = key
		self.element = element
	}

}
