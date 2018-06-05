import XCTest
@testable import JumpSearch

final class JumpSearchTests: XCTestCase {

	func testJumpSearch() {
		let array = [0,1,2,3,4,5,6,7,8,9,10]
		XCTAssertEqual(jumpSearch(array, for: 5), 5)

		let primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
		XCTAssertEqual(jumpSearch(primes, for: 67), 18)
		XCTAssertEqual(jumpSearch(primes, for: 79), 21)
		XCTAssertEqual(jumpSearch(primes, for: 73), 20)
	}

	func testJumpSearchRandom() {
		var array = [Int]()
		let capacity = 1000

		for key in 0..<capacity {
			array.append(key)
		}

		let key = Int(arc4random_uniform(UInt32(capacity)))
		let jumpIndex = jumpSearch(array, for: key)
		XCTAssertEqual(jumpIndex, key)
	}


	static var allTests = [
		("testJumpSearch", testJumpSearch),
		("testJumpSearchRandom", testJumpSearchRandom),
	]
}
