import Foundation

final class LinkedList<Element> {
    
    private final class Node<Element> {
        
        static func new(_ element: Element) -> Node<Element> {
            Node(element: element, next: nil)
        }
        
        var element: Element
        var next: Node<Element>?
        
        init(element: Element, next: Node<Element>?) {
            self.element = element
            self.next = next
        }
    }
    
    private(set) var count: Int = 0
    
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    subscript(index: Int) -> Element? {
        get { element(atIndex: index) }
        set {
            if let value = newValue {
                insert(element: value, atIndex: index)
            } else {
                remove(atIndex: index)
            }
        }
    }
    
    func insert(element: Element) {
        let newNode = Node(element: element, next: nil)
        tail?.next = newNode
        tail = newNode
        
        if count == 0 {
            head = newNode
        }
        
        count += 1
    }
    
    func insert(element: Element, atIndex index: Int) {
        guard index < count else {
            fatalError("Index out of bounds.")
        }
        
        var node = head
        let adjustedIndex = index == 0 ? index : index - 1
        
        for _ in 0..<adjustedIndex {
            node = node?.next
        }
        
        let newNode = Node(element: element, next: node?.next)
        node?.next = newNode
        tail = node?.next
        
        if index == 0 {
            head = newNode
        }
        
        count += 1
    }
    
    func remove(atIndex index: Int) {
        guard index < count else {
            fatalError("Index out of bounds.")
        }
        
        var node = head
        let adjustedIndex = index == 0 ? index : index - 1
        
        for _ in 0..<adjustedIndex {
            node = node?.next
        }
        
        node?.next = node?.next?.next

        if index == 0 { head = head?.next }
        if index == count - 1 { tail = head }
        
        count -= 1
    }
    
    func element(atIndex index: Int) -> Element? {
        guard index < count else {
            return nil
        }
        
        var node = head
        
        guard index > 0 else {
            return node?.element
        }
        
        for _ in 0..<index {
            node = node?.next
        }
        
        return node?.element
    }
}
