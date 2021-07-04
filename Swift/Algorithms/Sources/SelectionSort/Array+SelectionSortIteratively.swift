import Foundation

extension Array where Element: Comparable {
    mutating func selectionSortIteratively() {
        for index in 0..<count {
            let indexOfFirstUnsortedElement = index + 1
            var indexOfSmallestElement = index
            
            for index in indexOfFirstUnsortedElement..<count {
                if self[indexOfSmallestElement] > self[index] {
                    indexOfSmallestElement = index
                }
            }
            
            swapAt(indexOfSmallestElement, index)
        }
    }
}
