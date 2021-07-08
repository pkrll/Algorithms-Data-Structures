import XCTest
@testable import Algorithms

final class BinarySearchTreeTests: XCTestCase {

    func testBinarySearchTreeInsert() {
        var list = [8, 2, 10, 1, 7, 9, 11]
        let tree = BinarySearchTree<Int>()
        for number in list {
            tree.insert(value: number)
        }
        
        var node: BinarySearchTree<Int>?
        var queue: [BinarySearchTree<Int>] = [tree]
        
        while queue.isNotEmpty {
            node = queue.dropFirst()
            
            let compareValue = list.dropFirst()
            XCTAssertEqual(compareValue, node?.value)
            
            queue.appendIfNotNil(element: node?.leftNode)
            queue.appendIfNotNil(element: node?.rightNode)
        }
    }
}
