import Foundation

extension Array where Element: Comparable {
    
    enum SortingTechnique {
        case inPlace
        case outOfPlace
    }
    
    @discardableResult
    mutating func insertionSort(using technique: SortingTechnique) -> Self {
        switch technique {
        case .inPlace:
            insertionSortInPlace(index: 1)
        case .outOfPlace:
            return Self.insertionSortOutOfPlace(self, index: 0)
        }
        
        return self
    }
    
    dynamic
    fileprivate mutating func insertionSortInPlace(index: Int) {
        guard index < count else {
            return
        }
        
        guard index > 0 else {
            insertionSortInPlace(index: index + 1)
            return
        }
        
        let currentValue = self[index]
        let previousValue = self[index - 1]
        
        guard currentValue < previousValue else {
            insertionSortInPlace(index: index + 1)
            return
        }
        
        self[index] = previousValue
        self[index - 1] = currentValue
        insertionSortInPlace(index: index - 1)
    }

    fileprivate static func insertionSortOutOfPlace(_ array: Self, index: Int) -> Self {
        array
    }
    
    @_dynamicReplacement(for: insertionSortInPlace(index:))
    mutating func _replacing_insertionSortInPlace(index: Int) {
        RecursionAnalyzer.didEnterFunction()
        insertionSortInPlace(index: index)
    }
}
