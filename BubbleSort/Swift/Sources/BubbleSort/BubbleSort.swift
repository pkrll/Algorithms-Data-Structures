//
//  BubbleSort.swift
//  Created by Ardalan Samimi on 2018-05-29.
//
//	Bubble sort is a comparision-based sorting algorithm, where each
//	element is compared to an adjacent element and swapped if they're
//	out of order.
//
//  Worst-case complexity: O(n^2), where n is the number of elements
//

func bubbleSort<T: Comparable>(_ array: [T], compareUsing compare: (T, T) -> Bool = (<)) -> [T] {
	var array = array
	let count	= array.count

	for _ in 0..<count {
		var swapped = false

		for innerIndex in 0..<count - 1 {
			let a = array[innerIndex]
			let b = array[innerIndex + 1]
			if compare(b, a) {
				array[innerIndex] = b
				array[innerIndex + 1] = a

				swapped = true
			}
		}

		if !swapped { break }
	}

	return array
}
