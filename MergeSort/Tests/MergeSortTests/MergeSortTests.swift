import XCTest
@testable import MergeSort

final class MergeSortTests: XCTestCase {

	func testMergeSort() {
		let array = [6,8,34,3,81,13]
		XCTAssertEqual(mergeSort(array, compareUsing: <), [3,6,8,13,34,81])

	}

	func testMergeSortRandom() {
		let capacity = 197
		var array = Array<Int>(repeating: 0, count: capacity)

		for key in 1...capacity {
			let randomNumber = arc4random_uniform(UInt32(capacity))
			array.insert(key, at: Int(randomNumber))
		}

		let sortedArray = mergeSort(array)
		array.sort()
		XCTAssertEqual(sortedArray, array)
	}

	static var allTests = [
		("testMergeSort", testMergeSort),
		("testMergeSortRandom", testMergeSortRandom)
	]
}
