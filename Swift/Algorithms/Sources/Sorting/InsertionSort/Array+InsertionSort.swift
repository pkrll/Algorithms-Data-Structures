import Foundation

extension Array where Element: Comparable {
    
    dynamic
    mutating func insertionSort(index: Int = 1) {
        guard index < count else {
            return
        }
        
        guard index > 0 else {
            insertionSort(index: index + 1)
            return
        }
        
        let currentValue = self[index]
        let previousValue = self[index - 1]
        
        guard currentValue < previousValue else {
            insertionSort(index: index + 1)
            return
        }
        
        self[index] = previousValue
        self[index - 1] = currentValue
        insertionSort(index: index - 1)
    }
    
    @_dynamicReplacement(for: insertionSort(index:))
    mutating func _replacing_insertionSort(index: Int) {
        RecursionAnalyzer.didEnterFunction()
        insertionSort(index: index)
    }
}
