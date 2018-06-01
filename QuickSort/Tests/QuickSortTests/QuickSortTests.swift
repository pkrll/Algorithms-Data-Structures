import XCTest
@testable import QuickSort

final class QuickSortTests: XCTestCase {

	static var randomUnSortedArray: [Int] = []
	static var randomSortedArray: [Int] = []

	func testQuickSort() {
		var uArray = [6,8,34,3,81,13,66]
		var sArray = naiveQuickSort(uArray)
		uArray.sort()
		XCTAssertEqual(sArray, uArray)

		uArray = [6,8]
		sArray = naiveQuickSort(uArray)
		uArray.sort()
		XCTAssertEqual(sArray, uArray)

		uArray = [1,2,3,4,5,6]
		sArray = naiveQuickSort(uArray)
		uArray.sort()
		XCTAssertEqual(sArray, uArray)

		uArray = [5,6,4,3,2,1]
		sArray = naiveQuickSort(uArray)
		uArray.sort()
		XCTAssertEqual(sArray, uArray)

		uArray = [1,2,3,4,5,6,0]
		sArray = naiveQuickSort(uArray)
		uArray.sort()
		XCTAssertEqual(sArray, uArray)
	}

	func testLomutoQuickSortRandom() {
		var lomutoSortedArray = QuickSortTests.randomUnSortedArray
		var swiftSortedArray = QuickSortTests.randomSortedArray

		swiftSortedArray.sort()
		lomutoQuickSort(&lomutoSortedArray)

		XCTAssertEqual(lomutoSortedArray, swiftSortedArray)
	}

	func testHoareQuickSortRandom() {
		var hoareSortedArray = QuickSortTests.randomUnSortedArray
		var swiftSortedArray = QuickSortTests.randomUnSortedArray

		swiftSortedArray.sort()
		hoareQuickSort(&hoareSortedArray)

		XCTAssertEqual(hoareSortedArray, swiftSortedArray)
	}

	override class func setUp() {
		let capacity = 1000000
		for key in 0..<capacity {
			let randomNumber = arc4random_uniform(UInt32(capacity))
			QuickSortTests.randomUnSortedArray.insert(Int(randomNumber), at: key)
		}

		QuickSortTests.randomSortedArray = QuickSortTests.randomUnSortedArray
		QuickSortTests.randomSortedArray.sort()
	}

	static var allTests = [
		("testQuickSort", testQuickSort),
		("testLomutoQuickSortRandom", testLomutoQuickSortRandom),
		("testHoareQuickSortRandom", testHoareQuickSortRandom),
	]
}
