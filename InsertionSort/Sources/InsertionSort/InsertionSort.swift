//
//  InsertionSort.swift
//  Created by Ardalan Samimi on 2018-05-29.
//
//  Insertion sort is an in-place sorting algorithm, which compares
//  each element in sequence and puts it in its proper place in the
//  sorted list.
//
//  Worst-case complexity: O(n^2), where n is the number of elements
//

public func insertionSort<T: Comparable>(_ array: [T], compareUsing compare: (T, T) -> Bool = (<)) -> [T] {
	var array = array
	let count = array.count

	for curIndex in 1..<count {
		var subIndex = curIndex
		let current  = array[curIndex]

		while subIndex > 0 && compare(current, array[subIndex - 1]) {
			array[subIndex] = array[subIndex - 1]
			subIndex -= 1
		}

		array[subIndex] = current
	}

	return array
}
