import XCTest
@testable import LinkedList

final class LinkedListTests: XCTestCase {

	let list: LinkedList<Int>

	func testLinkedListPrepend() {
		XCTAssertEqual(self.list.count, 0)

		self.list.prepend(1)
		XCTAssertEqual(self.list.first, 1)
		self.list.prepend(2)
		XCTAssertEqual(self.list.first, 2)
		self.list.prepend(3)
		self.list.prepend(4)
		self.list.prepend(5)
		self.list.prepend(6)
		XCTAssertEqual(self.list.first, 6)
		XCTAssertEqual(self.list.last, 1)

		for i in 7...100 {
			self.list.prepend(i)
		}

		XCTAssertEqual(self.list.first, 100)
		XCTAssertEqual(self.list.last, 1)

		let n = Int(arc4random_uniform(UInt32(100)))
		XCTAssertEqual(self.list[99-(n-1)], n)
	}

	func testLinkedListAppend() {
		XCTAssertEqual(self.list.count, 0)

		self.list.append(1)
		XCTAssertEqual(self.list.last, 1)
		self.list.append(2)
		XCTAssertEqual(self.list.last, 2)
		self.list.append(3)
		self.list.append(4)
		self.list.append(5)
		self.list.append(6)
		XCTAssertEqual(self.list.last, 6)
		XCTAssertEqual(self.list.first, 1)

		for i in 7...100 {
			self.list.append(i)
		}

		XCTAssertEqual(self.list.last, 100)
		XCTAssertEqual(self.list.first, 1)

		let n = Int(arc4random_uniform(UInt32(100)))
		XCTAssertEqual(self.list[(n-1)], n)
		XCTAssertEqual(self.list[4], 5)
	}

	func testLinkedListInsert() {
		let self.list = LinkedList<Int>()
	}

	override func setUp() {
		self.self.list = LinkedList<Int>()
	}

	static var allTests = [
		("testLinkedListPrepend", testLinkedListPrepend),
		("testLinkedListAppend", testLinkedListAppend),
	]
}
