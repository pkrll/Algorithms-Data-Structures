import Foundation

extension Array where Element: Comparable {
    
    mutating func bubbleSortIteratively() {
        var index = 0
        var lastSortedIndex = count - 1
        
        while index < count {
            for key in 0..<lastSortedIndex {
                if self[key] > self[key + 1] {
                    swapAt(key, key + 1)
                }
            }
            lastSortedIndex -= 1
            index += 1
        }
    }
}
