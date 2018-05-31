import XCTest
@testable import InsertionSort

final class InsertionSortTests: XCTestCase {

	func testInsertionSort() {
		var unsortedPile = [25,2,654,45,1356,3,1,65,8,17,4,245,9]
		let sortedPile = insertionSort(unsortedPile)

		unsortedPile.sort()
		XCTAssertEqual(sortedPile, unsortedPile)
	}

	func testInsertionSortRandom() {
		var unsortedArray: [UInt32] = []

		for _ in 1...150 {
			let randomNumber = arc4random_uniform(4096)
			unsortedArray.append(randomNumber)
		}

		unsortedArray.sort()
		let sortedArray = insertionSort(unsortedArray)
		XCTAssertEqual(sortedArray, unsortedArray)
	}

	static var allTests = [
		("testInsertionSort", testInsertionSort),
		("testInsertionSortRandom", testInsertionSortRandom),
	]
}
