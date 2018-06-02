import XCTest
@testable import LinearSearch

final class LinearSearchTests: XCTestCase {

	func testLinearSearch() {
		let array = [432,34,99,13,34,78,33]
		XCTAssertEqual(linearSearch(array, for: 99), 2)
		XCTAssertEqual(linearSearch(array, for: 13), 3)
		XCTAssertEqual(linearSearch(array, for: 78), 5)
	}

	func testLinearSearchRandom() {
		var array = [Int]()
		let capacity = 1000

		for key in 0..<capacity {
			let randomNumber = arc4random_uniform(UInt32(capacity))
			array.insert(Int(randomNumber), at: key)
		}

		let key = Int(arc4random_uniform(UInt32(capacity)))
		let swiftIndex = array.index(of: key)
		let linearIndex = linearSearch(array, for: key)

		XCTAssertEqual(linearIndex, swiftIndex)
	}

	static var allTests = [
		("testLinearSearch", testLinearSearch),
		("testLinearSearchRandom", testLinearSearchRandom),
	]
}
