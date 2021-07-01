import Foundation

extension Array where Element: Comparable {
    
    func binarySearchIteratively(for value: Element) -> Int? {
        var startIndex = 0
        var endIndex = count - 1
        
        while endIndex >= startIndex {
            let middleIndex = (startIndex + endIndex) / 2
            let middleValue = self[middleIndex]
            
            if middleValue > value {
                endIndex = middleIndex - 1
            } else if middleValue < value {
                startIndex = middleIndex + 1
            } else if middleValue == value {
                return middleIndex
            }
        }
        
        return nil
    }
}
