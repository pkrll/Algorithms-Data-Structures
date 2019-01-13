import XCTest
@testable import BinarySearchTree

final class BinarySearchTreeTests: XCTestCase {

	func testSize() {
		let tree = BinarySearchTree<Int, Int>()
		for index in 1...100 {
			tree.insert(index, forKey: index)
		}

		XCTAssertEqual(tree.size, 100)

		tree.insert(101, forKey: 101)
		XCTAssertEqual(tree.size, 101)

		tree.remove(50)
		XCTAssertEqual(tree.size, 100)

		let bTree = BinarySearchTree<Int, Int>()

		bTree.insert(40, forKey: 40)
		bTree.insert(20, forKey: 20)
		bTree.insert(30, forKey: 30)
		bTree.insert(25, forKey: 25)
		bTree.insert(50, forKey: 50)
		bTree.insert(44, forKey: 44)
		bTree.insert(60, forKey: 60)

		XCTAssertEqual(bTree.size, 7)
	}

	func testInsert() {
		var tree = BinarySearchTree<Int, String>()

		for index in 0..<1000 {
			tree.insert("\(index)", forKey: index)
		}

		XCTAssertEqual(tree.size, 1000)

		XCTAssertEqual(tree.findElement(withKey: 0), "0")
		XCTAssertEqual(tree.findElement(withKey: 200), "200")

		tree.remove(10)

		tree.insert("1000", forKey: 1000)
		tree.insert("1001", forKey: 1001)
		XCTAssertEqual(tree.size, 1001)
		XCTAssertEqual(tree.findElement(withKey: 600), "600")

		tree = BinarySearchTree<Int, String>()

		tree.insert("10", forKey: 10)
		tree.insert("5", forKey: 5)
		tree.insert("15", forKey: 15)
		tree.insert("8", forKey: 8)

		XCTAssertEqual(tree.size, 4)
		tree.remove(10)
		tree.remove(5)
		tree.remove(15)
		tree.remove(8)

		tree.insert("10", forKey: 10)
		XCTAssertEqual(tree.size, 1)
	}

	func testFindElement() {
		let tree = BinarySearchTree<Int, String>()

		tree.insert("Foo", forKey: 50)
		var element = tree.findElement(withKey: 50)
		XCTAssertEqual(element, "Foo")

		tree.insert("40", forKey: 40)
		tree.insert("20", forKey: 20)
		tree.insert("30", forKey: 30)
		tree.insert("25", forKey: 25)
		tree.insert("50", forKey: 50)
		tree.insert("45", forKey: 45)
		tree.insert("60", forKey: 60)

		element = tree.findElement(withKey: 30)
		XCTAssertEqual(element, "30")
		element = tree.findElement(withKey: 150)
		XCTAssertEqual(element, nil)

		tree.remove(30)
		element = tree.findElement(withKey: 30)
		XCTAssertEqual(element, nil)
	}

	func testRemove() {
		let tree = BinarySearchTree<Int, String>()

		tree.insert("Foo", forKey: 0)
		XCTAssertEqual(tree.size, 1)

		tree.remove(0)
		XCTAssertEqual(tree.size, 0)

		for index in 0..<100 {
			tree.insert("\(index)", forKey: index)
		}

		XCTAssertEqual(tree.size, 100)

		for index in 0..<90 {
			tree.remove(index)
			// XCTAssertEqual(tree.size, 100 - index - 1)
		}

		let bTree = BinarySearchTree<Int, Int>()

		bTree.insert(40, forKey: 40)
		bTree.insert(20, forKey: 20)
		bTree.insert(30, forKey: 30)
		bTree.insert(45, forKey: 45)
		bTree.insert(50, forKey: 50)
		bTree.insert(47, forKey: 47)
		bTree.insert(60, forKey: 60)

		bTree.remove(40)
		XCTAssertEqual(bTree.size, 6)

		bTree.remove(20)
		bTree.remove(50)
		bTree.remove(60)
		XCTAssertEqual(bTree.size, 3)
	}

	static var allTests = [
		("testSize", testSize),
		("testInsert", testInsert),
		("testFindElement", testFindElement),
		("testRemove", testRemove)
	]
}
