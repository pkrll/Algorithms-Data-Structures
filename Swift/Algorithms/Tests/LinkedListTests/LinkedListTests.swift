import XCTest
@testable import Algorithms

final class LinkedListTests: XCTestCase {
    
    func testLinkedListInsertElement() {
        let linkedList = LinkedList<Int>()
        for number in 0..<10 {
            linkedList.insert(element: number)
        }
        
        for index in 0..<linkedList.count {
            XCTAssertEqual(linkedList.element(atIndex: index), index)
        }
    }

    func testLinkedListInsertElementAtIndex() {
        let linkedList = LinkedList<Double>()
        for number in 0..<10 {
            linkedList.insert(element: Double(number))
        }
        
        linkedList.insert(element: 5.5, atIndex: 6)
        linkedList.insert(element: 2.5, atIndex: 3)
        linkedList.insert(element: 6.5, atIndex: 9)
        
        XCTAssertEqual(linkedList.count, 13)
        XCTAssertEqual(linkedList.element(atIndex: 7), 5.5)
        XCTAssertEqual(linkedList.element(atIndex: 3), 2.5)
        XCTAssertEqual(linkedList.element(atIndex: 9), 6.5)
    }
    
    func testLinkedListRemoveElementAtIndex() {
        let linkedList = LinkedList<Double>()
        for number in 0..<10 {
            linkedList.insert(element: Double(number))
        }
        
        XCTAssertEqual(linkedList.count, 10)
        
        linkedList.remove(atIndex: 5)
        XCTAssertEqual(linkedList.count, 9)
        XCTAssertEqual(linkedList.element(atIndex: 5), 6)
    }
}
