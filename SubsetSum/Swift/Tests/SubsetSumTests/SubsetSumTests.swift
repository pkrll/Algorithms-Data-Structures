import XCTest
@testable import SubsetSum

final class SubsetSumTests: XCTestCase {

	func testSubsetSum() {
		let sums = [2, 32, 234, 35, 12332, 1, 7, 56]

		XCTAssertTrue(subsetSum(42, fromSums: sums))
		XCTAssertTrue(subsetSum(34, fromSums: sums))
		XCTAssertTrue(subsetSum(74, fromSums: sums))
		XCTAssertTrue(subsetSum(75, fromSums: sums))
		XCTAssertTrue(subsetSum(234, fromSums: sums))
		XCTAssertTrue(subsetSum(299, fromSums: sums))
		XCTAssertFalse(subsetSum(60, fromSums: sums))
		XCTAssertFalse(subsetSum(61, fromSums: sums))
		XCTAssertFalse(subsetSum(11, fromSums: sums))
		XCTAssertTrue(subsetSum(9, fromSums: [3, 34, 4, 12, 5, 2]))
	}

	func testSubsetSumEven() {
		var sums = [Int]()

		for item in 1...100 {
			sums.append(item * 2)
		}

		XCTAssertFalse(subsetSum(303, fromSums: sums))
		XCTAssertTrue(subsetSum(302, fromSums: sums))
	}

	static var allTests = [
		("testSubsetSum", testSubsetSum),
		("testSubsetSumEven", testSubsetSumEven)
	]
}
