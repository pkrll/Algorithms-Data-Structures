//
//  SubsetSum.swift
//  SubsetSum
//
//  Created by Ardalan Samimi on 2019-01-14.
//

func subsetSum(_ sum: Int, fromSums sums: [Int]) -> Bool {
	let numberOfElements = sums.count
	let cols = Array(repeating: false, count: sum + 1)
	var matrix = Array(repeating: cols, count: numberOfElements + 1)

	for row in 0...numberOfElements {
		matrix[row][0] = true
	}

	for row in 1...numberOfElements {
		for col in 1...sum {
			if col < sums[row - 1] {
				matrix[row][col] = matrix[row - 1][col]
			} else {
				matrix[row][col] = matrix[row - 1][col] || matrix[row - 1][col - sums[row - 1]]
			}
		}
	}

	return matrix[numberOfElements][sum]
}
