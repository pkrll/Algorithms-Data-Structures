import Foundation

extension Array where Element: Comparable {
    
    mutating func bubbleSortIteratively() {
        for index in 0..<count {
            let lastSortedIndex = count - index - 1
            
            for key in 0..<lastSortedIndex {
                if self[key] > self[key + 1] {
                    swapAt(key, key + 1)
                }
            }
        }
    }
}
