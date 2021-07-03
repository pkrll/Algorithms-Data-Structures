import Foundation

extension Array where Element: Comparable {
    
    mutating func quickSort() {
        quickSort(low: 0, high: count - 1)
    }
    
    mutating private func quickSort(low: Int, high: Int) {
        guard low < high else {
            return
        }
        
        let partition = partition(low: low, high: high)
        quickSort(low: low, high: partition - 1)
        quickSort(low: partition + 1, high: high)
    }
    
    private mutating func partition(low: Int, high: Int) -> Int {
        guard low < high else {
            return low
        }

        if self[low] > self[high] {
            swapAt(low, high - 1)
            swapAt(high - 1, high)
            
            return partition(low: low, high: high - 1)
        }
        
        return partition(low: low + 1, high: high)
    }
    
}
