import XCTest
@testable import BinarySearchTree

final class BinarySearchTreeTests: XCTestCase {

	func testInsert() {
		let tree = BinarySearchTree<Int, String>()

		tree.insert("Hello World!", forKey: 15)
		XCTAssertEqual(tree.size, 1)
		tree.insert("Foo", forKey: 2)
		XCTAssertEqual(tree.size, 2)

		tree.insert("Bar", forKey: 4)

		XCTAssertEqual(tree.root!.element, "Hello World!")
		XCTAssertEqual(tree.root!.leftNode!.element, "Foo")
		XCTAssertEqual(tree.root!.leftNode!.rightNode!.element, "Bar")

		XCTAssertEqual(tree.findElement(withKey: 4), "Bar")

		tree.insert("Baz", forKey: 3)
		tree.insert("Zab", forKey: 1)

		tree.remove(2)
		XCTAssertEqual(tree.root!.leftNode!.element, "Baz")

		XCTAssertEqual(tree.size, 4)
		tree.remove(15)
	}

	static var allTests = [
		("testInsert", testInsert)
	]
}
