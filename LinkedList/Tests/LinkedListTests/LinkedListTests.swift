import XCTest
@testable import LinkedList

final class LinkedListTests: XCTestCase {

	func testLinkedListPrepend() {
		let list = LinkedList<Int>()

		XCTAssertEqual(list.count, 0)

		list.prepend(1)
		XCTAssertEqual(list.first, 1)
		list.prepend(2)
		XCTAssertEqual(list.first, 2)
		list.prepend(3)
		list.prepend(4)
		list.prepend(5)
		list.prepend(6)
		XCTAssertEqual(list.first, 6)
		XCTAssertEqual(list.last, 1)

		for i in 7...100 {
			list.prepend(i)
		}

		XCTAssertEqual(list.first, 100)
		XCTAssertEqual(list.last, 1)

		let n = Int(arc4random_uniform(UInt32(100)))
		XCTAssertEqual(list[99-(n-1)], n)
	}

	func testLinkedListAppend() {
		let list = LinkedList<Int>()

		XCTAssertEqual(list.count, 0)

		list.append(1)
		XCTAssertEqual(list.last, 1)
		list.append(2)
		XCTAssertEqual(list.last, 2)
		list.append(3)
		list.append(4)
		list.append(5)
		list.append(6)
		XCTAssertEqual(list.last, 6)
		XCTAssertEqual(list.first, 1)

		for i in 7...100 {
			list.append(i)
		}

		XCTAssertEqual(list.last, 100)
		XCTAssertEqual(list.first, 1)

		let n = Int(arc4random_uniform(UInt32(100)))
		XCTAssertEqual(list[(n-1)], n)
		XCTAssertEqual(list[4], 5)

	}

	static var allTests = [
		("testLinkedListPrepend", testLinkedListPrepend),
	]
}
