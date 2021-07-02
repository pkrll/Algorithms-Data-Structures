import Foundation

extension Array where Element: Comparable {
    
    mutating func insertionSortIteratively() {
        var index = 0
        
        while index < count {
            index += 1
            
            while index > 0 && index < count && self[index] < self[index - 1] {
                swapAt(index, index - 1)
                index -= 1
            }
        }
    }
}
