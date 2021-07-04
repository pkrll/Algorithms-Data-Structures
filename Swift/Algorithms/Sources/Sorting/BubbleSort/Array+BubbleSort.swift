import Foundation

extension Array where Element: Comparable {
    
    mutating func bubbleSort() {
        bubbleSort(index: 0, firstSortedIndex: count)
    }
    
    dynamic
    fileprivate mutating func bubbleSort(index: Int, firstSortedIndex: Int) {
        guard firstSortedIndex > 0 else {
            return
        }
        
        let index = index == count ? 0 : index
        compareAndSwap(index: 0, endIndex: firstSortedIndex - 1)
        bubbleSort(index: index + 1, firstSortedIndex: firstSortedIndex - 1)
    }
    
    dynamic
    fileprivate mutating func compareAndSwap(index: Int, endIndex: Int) {
        guard index < endIndex else {
            return
        }
        
        let current = self[index]
        let next = self[index + 1]
        
        if current > next {
            swapAt(index, index + 1)
        }
        
        compareAndSwap(index: index + 1, endIndex: endIndex)
    }
    
    @_dynamicReplacement(for: bubbleSort(index:firstSortedIndex:))
    mutating func _replacing_bubbleSort(index: Int, firstSortedIndex: Int) {
        RecursionAnalyzer.didEnterFunction()
        bubbleSort(index: index, firstSortedIndex: firstSortedIndex)
    }
    
    @_dynamicReplacement(for: compareAndSwap(index:endIndex:))
    mutating func _replacing_compareAndSwap(index: Int, endIndex: Int) {
        RecursionAnalyzer.didEnterFunction()
        compareAndSwap(index: index, endIndex: endIndex)
    }
}
