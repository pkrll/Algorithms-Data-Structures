//
//  QuickSort.swift
//  Created by Ardalan Samimi on 2018-05-29.
//
//	QuickSort is a sorting algorithm where an unsorted array is first
//	partitioned into two lists, one holding values less than a pivot
//	and the other one higher than a pivot.
//
//  Worst-case complexity: O(n^2), where n is the number of elements
//

public func naiveQuickSort<T: Comparable>(_ array: [T]) -> [T] {
	guard array.count > 1 else { return array }

	let (less, greater) = naivePartition(array, atLow: 0, high: array.count - 2)

	return naiveQuickSort(less) + naiveQuickSort(greater)
}

private func naivePartition<T: Comparable>(_ array: [T], atLow low: Int, high: Int) -> ([T], [T]) {
	guard array.count > 1 else { return (array, []) }
	var array = array
	let count = array.count - 1
	let pivot = array[count]

	var low = low
	var high = high

	while low < high {
		if array[low] <= pivot {
			low += 1
		} else {
			if array[high] >= pivot {
				high -= 1
			} else {
				let lowElement = array[low]
				array[low] = array[high]
				array[high] = lowElement
			}
		}
	}

	if pivot < array[low] {
		array[count] = array[low]
		array[low] = pivot
	}

	let leftSubArray  = Array(array[0...low])
	let rightSubArray = Array(array[(low + 1)...])

	return (leftSubArray, rightSubArray)
}

func lomutoQuickSort<T: Comparable>(_ array: inout [T], low: Int? = nil, high: Int? = nil) {
	guard let low = low, let high = high else {
		lomutoQuickSort(&array, low: 0, high: array.count - 1)
		return
	}

	if low < high {
		let p = lomutoPartition(&array, low: low, high: high)

		lomutoQuickSort(&array, low: low, high: p - 1)
		lomutoQuickSort(&array, low: p + 1, high: high)
	}
}

private func lomutoPartition<T: Comparable>(_ array: inout [T], low: Int, high: Int) -> Int {
	let pivot = array[high]
	var index = low

	for current in low..<high {
		if array[current] <= pivot {
			let element = array[current]
			array[current] = array[index]
			array[index] = element
			index += 1
		}
	}

	let element = array[high]
	array[high] = array[index]
	array[index] = element

	return index
}

func hoareQuickSort<T: Comparable>(_ array: inout [T], low: Int? = nil, high: Int? = nil) {
	guard let low = low, let high = high else {
		hoareQuickSort(&array, low: 0, high: array.count - 1)
		return
	}

	if low < high {
		let p = hoarePartition(&array, low: low, high: high)

		hoareQuickSort(&array, low: low, high: p)
		hoareQuickSort(&array, low: p + 1, high: high)
	}
}

private func hoarePartition<T: Comparable>(_ array: inout [T], low: Int, high: Int) -> Int {
	let pivot = array[low]

	var leftIndex  = low - 1
	var rightIndex = high + 1

	while true {
		repeat {
			leftIndex += 1
		} while array[leftIndex] < pivot

		repeat {
			rightIndex -= 1
		} while array[rightIndex] > pivot

		if leftIndex >= rightIndex {
			return rightIndex
		} else {
			let element = array[leftIndex]
			array[leftIndex] = array[rightIndex]
			array[rightIndex] = element
		}
	}
}
