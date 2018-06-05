//
//	LinearSearch.swift
//	Created by Ardalan Samimi on 2018-06-02
//
//
//
//	Worst case-complexity: O(n), where n is the number of items.

func linearSearch<T: Comparable>(_ array: [T], for key: T) -> Int? {
	for (index, item) in array.enumerated() {
		if item == key {
			return index
		}
	}

	return nil
}
