//
//  SelectionSort.swift
//  Created by Ardalan Samimi on 2018-05-29.
//
//	Selection sort is an in-place sorting algorithm.
//
//  Worst-case complexity: O(n^2), where n is the number of elements
//

public func selectionSort<T: Comparable>(_ array: [T]) -> [T] {
	guard array.count > 1 else { return array }

	var array = array
	let count = array.count

	for curIndex in 0..<count - 1 {
		let current = array[curIndex]

		var position = curIndex + 1
		var smallest = array[position]

		for index in position..<array.count where smallest > array[index] {
			smallest = array[index]
			position = index
		}

		if current > smallest {
			array[curIndex] = smallest
			array[position] = current
		}

	}

	return array
}
