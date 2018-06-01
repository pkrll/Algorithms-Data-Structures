import XCTest
@testable import MergeSort

final class MergeSortTests: XCTestCase {

	func testMergeSort() {
		let array = [6,8,34,3,81,13]
		XCTAssertEqual(mergeSort(array, compareUsing: <), [3,6,8,13,34,81])
	}

	func testMergeSortRandom() {
		let capacity = 1000000
		var array = [Int]()

		for key in 0..<capacity {
			let randomNumber = arc4random_uniform(UInt32(capacity))
			array.insert(Int(randomNumber), at: key)
		}
		print("Sorting...")
		let sortedArray = mergeSort(array)
		array.sort()
		XCTAssertEqual(sortedArray, array)
	}

	static var allTests = [
		("testMergeSort", testMergeSort),
		("testMergeSortRandom", testMergeSortRandom)
	]
}
