import XCTest
@testable import BubbleSort

final class BubbleSortTests: XCTestCase {

	func testBubbleSort() {
		var unsortedPile = [25,2,654,45,1356,3,1,65,8,17,4,245,9]
		let sortedPile = bubbleSort(unsortedPile)

		unsortedPile.sort()
		XCTAssertEqual(sortedPile, unsortedPile)
	}

	func testBubbleSortRandom() {
		var unsortedArray: [UInt32] = []

		for _ in 1...150 {
			let randomNumber = arc4random_uniform(4096)
			unsortedArray.append(randomNumber)
		}

		unsortedArray.sort()
		let sortedArray = bubbleSort(unsortedArray)
		XCTAssertEqual(sortedArray, unsortedArray)
	}

	static var allTests = [
		("testBubbleSort", testBubbleSort),
		("testBubbleSortRandom", testBubbleSortRandom),
	]
}
