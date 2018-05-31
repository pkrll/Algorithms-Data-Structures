import XCTest
@testable import SelectionSort

final class SelectionSortTests: XCTestCase {

	func testSelectionSort() {
		var unsortedPile = [25,2,654,45,1356,3,1,65,8,17,4,245,9]
		let sortedPile = selectionSort(unsortedPile)

		unsortedPile.sort()
		XCTAssertEqual(sortedPile, unsortedPile)
	}

	func testSelectionSortRandom() {
		var unsortedArray: [UInt32] = []

		for _ in 1...2000 {
			let randomNumber = arc4random_uniform(4096)
			unsortedArray.append(randomNumber)
		}

		unsortedArray.sort()
		let sortedArray = selectionSort(unsortedArray)
		XCTAssertEqual(sortedArray, unsortedArray)
	}


	static var allTests = [
		("testSelectionSort", testSelectionSort),
		("testSelectionSortRandom", testSelectionSortRandom),
	]
}
