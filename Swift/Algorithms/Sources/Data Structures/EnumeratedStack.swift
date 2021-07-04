import Foundation

indirect enum Stack<T: Equatable>: Equatable {
    
    static func == (lhs: Stack<T>, rhs: Stack<T>) -> Bool {
        switch (lhs, rhs) {
        case (.empty, .empty):
            return true
        case (.element(let lhsElement, let lhsNext), .element(let rhsElement, let rhsNext)):
            return lhsElement == rhsElement && lhsNext == rhsNext
        default:
            return false
        }
    }

    case empty
    case element(_ value: T, next: Self?)
    
    var isEmpty: Bool {
        guard case .empty = self else {
            return false
        }
        
        return true
    }
    
    var size: Int {
        guard case .element(_, let next) = self else {
            return 0
        }
        
        guard let next = next else {
            return 1
        }
        
        return 1 + next.size
    }
    
    init() {
        self = .empty
    }
    
    init(initialElement element: T) {
        self = .element(element, next: nil)
    }
    
    mutating func push(_ element: T) {
        self = .element(element, next: self)
    }
    
    mutating func pop() -> T? {
        switch self {
        case .empty:
            return nil
        case .element(let element, let next):
            self = next ?? .empty
            return element
        }
    }
    
    func peek() -> T? {
        switch self {
        case .empty:
            return nil
        case .element(let element, _):
            return element
        }
    }
}
