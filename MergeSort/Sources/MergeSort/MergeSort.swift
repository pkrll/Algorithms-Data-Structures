//
//  MergeSort.swift
//  Created by Ardalan Samimi on 2018-05-29.
//
//	Merge sort is a divide and conquer-sorting algorithm where an unsorted
//	array is first divded by half until each element is atomic, after which
//	it starts to merge the elements into a sorted list.
//
//  Worst-case complexity: O(n log n), where n is the number of elements.
//

func mergeSort<T: Comparable>(_ array: [T], compareUsing compare: (T, T) -> Bool = (<)) -> [T] {
	guard array.count > 1 else { return array }

	let middle = array.count / 2

	let lSide = mergeSort(Array(array[0..<middle]), compareUsing: compare)
	let rSide = mergeSort(Array(array[middle...]), compareUsing: compare)

	return merge(lSide, with: rSide, compareUsing: compare)
}

fileprivate func merge<T: Comparable>(_ array: [T], with anotherArray: [T], compareUsing compare: (T, T) -> Bool) -> [T] {
	var leftIndex = 0
	var leftArray = array

	var rightIndex = 0
	var rightArray = anotherArray

	var sortedArray = [T]()

	while leftIndex < leftArray.count && rightIndex < rightArray.count {
		if compare(leftArray[leftIndex], rightArray[rightIndex]) {
			sortedArray.append(leftArray[leftIndex])
			leftIndex += 1
		} else {
			sortedArray.append(rightArray[rightIndex])
			rightIndex += 1
		}
	}

	while leftIndex < leftArray.count {
		sortedArray.append(leftArray[leftIndex])
		leftIndex += 1
	}

	while rightIndex < rightArray.count {
		sortedArray.append(rightArray[rightIndex])
		rightIndex += 1
	}

	return sortedArray

}
