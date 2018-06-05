//
//	JumpSearch.swift
//	Created by Ardalan Samimi on 2018-06-02
//
//	Time complexity : O(√ n)
//

func jumpSearch<T: Comparable>(_ array: [T], for key: T) -> Int? {
	guard array.count > 0 else { return nil }

	let n = array.count - 1
	let m = Int(Double(n).squareRoot())
	var k = 0

	var lowerBound = 0
	var upperBound = 0

	while n > upperBound {
		lowerBound = k * m
		upperBound = (k + 1) * m

		if key < array[upperBound] {
			return linearSearch(array, for: key, from: lowerBound, to: upperBound)
		}

		k += 1
	}

	return nil
}

private func linearSearch<T: Comparable>(_ array: [T], for key: T, from: Int, to: Int) -> Int? {
	for (index, item) in array[from...to].enumerated() where item == key {
		return index + from
	}

	return nil
}
