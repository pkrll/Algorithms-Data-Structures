import XCTest
@testable import Algorithms

final class EnumeratedStackTests: XCTestCase {
    
    func testEnumeratedStackEmpty() {
        var stack = Stack<Int>()
        XCTAssertEqual(stack, .empty)
        
        stack.push(1)
        XCTAssertNotEqual(stack, .empty)
    }
    
    func testEnumeratedStackInitialElement() {
        let stack = Stack(initialElement: 1)
        XCTAssertEqual(stack.peek(), 1)
    }
    
    func testEnumeratedStackPush() {
        var stack = Stack<Int>()
        XCTAssertEqual(stack.size, 0)
        
        stack.push(1)
        stack.push(2)
        stack.push(3)
        
        XCTAssertEqual(stack.size, 3)
        XCTAssertEqual(stack.pop(), 3)
        XCTAssertEqual(stack.pop(), 2)
        XCTAssertEqual(stack.pop(), 1)
    }
    
    func testEnumeratedStackPeek() {
        var stack = Stack<Int>()
        XCTAssertEqual(stack.peek(), nil)
        
        stack.push(1)
        XCTAssertEqual(stack.peek(), 1)
        
        stack.push(2)
        XCTAssertEqual(stack.peek(), 2)
        
        stack.push(3)
        XCTAssertEqual(stack.peek(), 3)
    }
    
    func testEnumeratedStackPop() {
        var stack = Stack<Int>()

        for number in 1...10 {
            stack.push(number)
        }
        
        XCTAssertEqual(stack.pop(), 10)
        XCTAssertEqual(stack.pop(), 9)
        
        stack.push(150)
        XCTAssertEqual(stack.pop(), 150)
        
        for number in 0..<8 {
            XCTAssertEqual(stack.pop(), 8 - number)
        }
        
        XCTAssertEqual(stack.pop(), nil)
    }
    
    func testEnumeratedStackSize() {
        var stack = Stack<Int>()
        XCTAssertEqual(stack.size, 0)
        
        stack.push(10)
        XCTAssertEqual(stack.size, 1)
        
        _ = stack.pop()
        XCTAssertEqual(stack.size, 0)
        
        let upperBound = 2345
        for number in 1...upperBound {
            stack.push(number)
            XCTAssertEqual(stack.size, number)
        }
        
        for number in 1...upperBound {
            _ = stack.pop()
            XCTAssertEqual(stack.size, upperBound - number)
        }
    }
}
