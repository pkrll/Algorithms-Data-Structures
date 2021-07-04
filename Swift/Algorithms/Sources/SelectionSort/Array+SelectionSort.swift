import Foundation

extension Array where Element: Comparable {
    
    mutating func selectionSort() {
        guard count > 1 else {
            return
        }
        
        selectionSort(currentIndex: 0, selectedIndex: 1)
    }
    
    private mutating func selectionSort(currentIndex: Int, selectedIndex: Int) {
        guard currentIndex < count - 1 else {
            return
        }
        
        if self[currentIndex] > self[selectedIndex] {
            swapAt(currentIndex, selectedIndex)
        }
        
        var currentIndex = currentIndex
        var selectedIndex = selectedIndex
        let hasReachedEnd = selectedIndex == count - 1
        
        if hasReachedEnd {
            currentIndex += 1
            selectedIndex = currentIndex + 1
        } else {
            selectedIndex += 1
        }

        selectionSort(currentIndex: currentIndex, selectedIndex: selectedIndex)
    }
    
}
