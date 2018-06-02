import XCTest
@testable import LinkedList

final class LinkedListTests: XCTestCase {

	var list: LinkedList<Int>!

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
	}

	func testLinkedListInsert() {
		XCTAssertEqual(self.list.count, 0)

		self.list.insert(0, at: 0)
		self.list.insert(1, at: 0)
		XCTAssertEqual(self.list.first, 1)
		self.list.insert(2, at: 0)
		XCTAssertEqual(self.list.first, 2)
		self.list.insert(3, at: 1)
		XCTAssertEqual(self.list[1], 3)
		self.list.insert(4, at: 5)
		XCTAssertEqual(self.list.last, 4)

		for i in 5...100 {
			list.insert(i, at: i)
		}

		XCTAssertEqual(self.list.count, 101)
		XCTAssertEqual(self.list[55], 55)
		let n = Int(arc4random_uniform(UInt32(99)))
		XCTAssertEqual(self.list[n], n)

		self.list.insert(101, at: -5)
		XCTAssertEqual(self.list[97], 101)

		self.list.insert(122, at: -1)
		XCTAssertEqual(self.list.last, 122)
	}

	func testLinkedListRemove() {
		XCTAssertEqual(self.list.count, 0)

		for i in 0..<100 {
			list.append(i)
		}

		XCTAssertTrue(self.list.remove(10))
		XCTAssertEqual(self.list.count, 99)
		XCTAssertEqual(self.list[10], 11)

		XCTAssertFalse(self.list.remove(101))
		XCTAssertFalse(self.list.remove(10))
		XCTAssertTrue(self.list.remove(0))
		XCTAssertEqual(self.list.count, 98)
	}

	func testLinkedListContains() {
		XCTAssertFalse(self.list.contains(element: 0))
		list.append(0)
		XCTAssertTrue(self.list.contains(element: 0))

		list.append(1)
		XCTAssertTrue(self.list.contains(element: 1))

		for i in 0..<100 {
			list.append(i)
		}

		XCTAssertTrue(self.list.contains(element: 14))
	}

	override func setUp() {
		self.list = LinkedList<Int>()
	}

	static var allTests = [
		("testLinkedListPrepend", testLinkedListPrepend),
		("testLinkedListAppend", testLinkedListAppend),
		("testLinkedListInsert", testLinkedListInsert),
		("testLinkedListRemove", testLinkedListRemove),
		("testLinkedListContains", testLinkedListContains),
	]
}
