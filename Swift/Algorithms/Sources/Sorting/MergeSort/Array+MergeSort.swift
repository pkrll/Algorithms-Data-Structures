import Foundation

extension Array where Element: Comparable {

    mutating func mergeSort() {
        self = divide()
    }

    private func divide() -> [Element] {
        guard count > 1 else {
            return self
        }
        
        let midIndex = count / 2
        
        let lhs = Array(self[..<midIndex])
        let rhs = Array(self[midIndex...])
        
        let sortedLhs = lhs.divide()
        let sortedRhs = rhs.divide()
        
        var array: [Element] = []
        array = array.merge(sortedLhs, with: sortedRhs)
        
        return array
    }
    
    private mutating func merge(_ lhs: [Element], with rhs: [Element]) -> [Element] {
        if lhs.isEmpty && rhs.isEmpty {
            return self
        }
        
        var lhs = lhs
        var rhs = rhs
        
        if lhs.first < rhs.first {
            let element = lhs.dropFirst()
            appendIfNotNil(element: element)
        } else {
            let element = rhs.dropFirst()
            appendIfNotNil(element: element)
        }
        
        return merge(lhs, with: rhs)
    }    
}

private func <<T: Comparable>(lhs: T?, rhs: T?) -> Bool {
    guard let lhs = lhs else { return false }
    guard let rhs = rhs else { return true }
    
    return lhs < rhs
}
