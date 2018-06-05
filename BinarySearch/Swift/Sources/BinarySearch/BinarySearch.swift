
// 	BinarySearch.swift
// 	Created by Ardalan Samimi on 2018-06-01
//
// 	Binary search is a search algorithm for finding
// 	the index of a specific key in a sorted array,
// 	where you repeatedly divide the list in half.
//
// 	Worst-case complexity: O(log n)
//

func binarySearch<T: Comparable>(for key: T, in array: [T]) -> Int? {
	// return binarySearch(array, key: key)
	guard array.count > 0 else { return nil }

	var minimum = 0
	var maximum = array.count - 1

	while maximum >= minimum {
		let middle = (maximum + minimum) / 2

		if key > array[middle] {
			minimum = middle + 1
		} else if key < array[middle] {
			maximum = middle - 1
		} else {
			return middle
		}
	}

	return nil
}

public func binarySearch<T: Comparable>(_ a: [T], key: T) -> Int? {
    var lowerBound = 0
    var upperBound = a.count
    while lowerBound < upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound) / 2
        if a[midIndex] == key {
            return midIndex
        } else if a[midIndex] < key {
            lowerBound = midIndex + 1
        } else {
            upperBound = midIndex
        }
    }
    return nil
}
