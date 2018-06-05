import XCTest
@testable import Queue

final class QueueTests: XCTestCase {

	func testIsEmpty() {
		var queue = Queue<Int>()

		XCTAssertTrue(queue.isEmpty)
		XCTAssertEqual(queue.count, 0)
		XCTAssertEqual(queue.front, nil)

		queue.enqueue(1)

		XCTAssertFalse(queue.isEmpty)
	}

	func testEnqueue() {
		var queue = Queue<Int>()

		XCTAssertTrue(queue.isEmpty)
		XCTAssertEqual(queue.count, 0)
		XCTAssertEqual(queue.front, nil)

		queue.enqueue(1)

		XCTAssertFalse(queue.isEmpty)
		XCTAssertEqual(queue.count, 1)
		XCTAssertEqual(queue.front, 1)

		queue.enqueue(2)
		queue.enqueue(3)
		queue.enqueue(4)

		XCTAssertFalse(queue.isEmpty)
		XCTAssertEqual(queue.count, 4)
		XCTAssertEqual(queue.front, 1)
	}

	func testDequeue() {
		var queue = Queue<Int>()

		XCTAssertTrue(queue.isEmpty)
		XCTAssertEqual(queue.count, 0)
		XCTAssertEqual(queue.front, nil)

		queue.enqueue(1)
		queue.enqueue(2)
		queue.enqueue(3)
		queue.enqueue(4)

		XCTAssertFalse(queue.isEmpty)
		XCTAssertEqual(queue.count, 4)
		XCTAssertEqual(queue.front, 1)

		var item = queue.dequeue()
		XCTAssertEqual(item, 1)
		XCTAssertEqual(queue.count, 3)
		XCTAssertEqual(queue.front, 2)

		queue.enqueue(1)
		XCTAssertEqual(queue.count, 4)
		XCTAssertEqual(queue.front, 2)

		_ = queue.dequeue()
		_ = queue.dequeue()
		item = queue.dequeue()

		XCTAssertEqual(item, 4)
		XCTAssertEqual(queue.count, 1)
		XCTAssertEqual(queue.front, 1)

		_ = queue.dequeue()
		XCTAssertEqual(queue.count, 0)
		XCTAssertEqual(queue.front, nil)
	}

	func testMassiveDequeue() {
		var queue = Queue<Int>()

		let x = 1000000
		for i in 1...x {
			queue.enqueue(i)
		}

		XCTAssertEqual(queue.count, x)

		for _ in 1...x {
			_ = queue.dequeue()
		}

		XCTAssertEqual(queue.count, 0)
	}


	static var allTests = [
		("testIsEmpty", testIsEmpty),
		("testEnqueue", testEnqueue),
		("testDequeue", testDequeue),
		("testMassiveDequeue", testMassiveDequeue),
	]
}
