import Foundation

extension Array where Element: Comparable {
    
    private var isNotEmpty: Bool { !isEmpty }
    
    dynamic
    func binarySearch(for element: Element) -> Int? {
        binarySearch(for: element, startIndex: 0, endIndex: count - 1)
    }
    
    dynamic
    fileprivate func binarySearch(for element: Element, startIndex: Int, endIndex: Int) -> Int? {
        guard isNotEmpty else {
            return nil
        }
        
        guard startIndex <= endIndex else {
            return nil
        }
        
        let difference = startIndex + endIndex
        let middleIndex = difference / 2
        let middleValue = self[middleIndex]
        
        if middleValue > element {
            return binarySearch(for: element, startIndex: startIndex, endIndex: middleIndex - 1)
        } else if middleValue < element {
            return binarySearch(for: element, startIndex: middleIndex + 1, endIndex: endIndex)
        } else if middleValue == element {
            return middleIndex
        }

        return nil
    }
    
    @_dynamicReplacement(for: binarySearch(for:startIndex:endIndex:))
    func _replacing_binarySearch(for element: Element, startIndex: Int, endIndex: Int) -> Int? {
        RecursionAnalyzer.didEnterFunction()
        return binarySearch(for: element, startIndex: startIndex, endIndex: endIndex)
    }
}
