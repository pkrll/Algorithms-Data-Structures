import Foundation

final class BinarySearchTree<T: Comparable> {
    
    private(set) var value: T?
    private(set) var leftNode: BinarySearchTree<T>?
    private(set) var rightNode: BinarySearchTree<T>?
    
    init(value: T? = nil, leftNode: BinarySearchTree<T>? = nil, rightNode: BinarySearchTree<T>? = nil) {
        self.value = value
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
    
    func insert(value newValue: T) {
        guard let value = value else {
            self.value = newValue
            return
        }
        
        if value > newValue {
            insertAtLeft(value: newValue)
        } else {
            insertAtRight(value: newValue)
        }
    }
    
    private func insertAtLeft(value: T) {
        if let leftNode = leftNode {
            leftNode.insert(value: value)
        } else {
            leftNode = .init(value: value)
        }
    }
    
    private func insertAtRight(value: T) {
        if let rightNode = rightNode {
            rightNode.insert(value: value)
        } else {
            rightNode = .init(value: value)
        }
    }
}
