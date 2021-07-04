import Foundation

extension Array where Element: Comparable {
    mutating func selectionSortIteratively() {
        for index in 0..<count {
            let startIndex = index + 1
            var selectedIndex = index
            
            for index in startIndex..<count {
                if self[selectedIndex] > self[index] {
                    selectedIndex = index
                }
            }
            
            swapAt(selectedIndex, index)
        }
    }
}
