//
//  Stack.swift
//  Created by Ardalan Samimi on 2018-05-29.
//

import Foundation

public struct Stack<T> {

	private var data: [T] = []

	public var isEmpty: Bool {
		return self.data.isEmpty
	}

	public var count: Int {
		return self.data.count
	}

	public var top: T? {
		return self.data.last
	}

	public mutating func push(_ value: T) {
		self.data.append(value)
	}

	public mutating func pop() -> T? {
		return self.data.popLast()
	}

}
