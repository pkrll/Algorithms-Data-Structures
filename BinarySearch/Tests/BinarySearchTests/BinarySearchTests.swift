import XCTest
@testable import BinarySearch

final class BinarySearchTests: XCTestCase {

	static var values = [Int]()
	static var primes = [Int]()
	static var largeRandomArray = [Int]()
	static var randomElement = 0

	func testBinarySearch() {
		let values = BinarySearchTests.values
		let primes = BinarySearchTests.primes
		var key: Int!

		key = binarySearch(for: 6, in: values)
		XCTAssertEqual(key, 5)
		key = binarySearch(for: 67, in: primes)
		XCTAssertEqual(key, 18)
		key = binarySearch(for: 79, in: primes)
		XCTAssertEqual(key, 21)
		key = binarySearch(for: 73, in: primes)
		XCTAssertEqual(key, 20)
	}

	func testBinarySearchRandom() {
		let randomElement	= BinarySearchTests.randomElement
		let largeRandomArray = BinarySearchTests.largeRandomArray
		let appleKey  = largeRandomArray.index(of: randomElement)
		let binaryKey =	binarySearch(for: randomElement, in: largeRandomArray)

		XCTAssertEqual(binaryKey, appleKey)
	}

	override class func setUp() {
		BinarySearchTests.values = [1,2,3,4,5,6,7,9,10]
		BinarySearchTests.primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]

		let capacity = 1000000

		for i in 0..<capacity {
			BinarySearchTests.largeRandomArray.append(i)
		}

		print("Large random array created. Now sorting...")

		BinarySearchTests.largeRandomArray.sort()
		BinarySearchTests.randomElement = Int(arc4random_uniform(UInt32(capacity)))
	}

	static var allTests = [
		("testBinarySearch", testBinarySearch),
		("testBinarySearchRandom", testBinarySearchRandom),
	]
}
