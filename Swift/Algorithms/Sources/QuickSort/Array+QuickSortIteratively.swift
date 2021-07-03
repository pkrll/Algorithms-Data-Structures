import Foundation

extension Array where Element: Comparable {
    
    mutating func quickSortIteratively() {
        guard count > 1 else {
            return
        }
        
        let count = count - 1
        var stack: [ClosedRange<Int>] = []
        stack.append(0...count)
        
        while !stack.isEmpty {
            guard let range = stack.popLast() else {
                return
            }
            
            let pivot = partition(range: range)
            
            let low = pivot - 1
            let high = pivot + 1
            
            if low > range.lowerBound {
                stack.append(range.lowerBound...low)
            }
            
            if high < range.upperBound {
                stack.append(high...range.upperBound)
            }
        }
    }
    
    private mutating func partition(range: ClosedRange<Int>) -> Int {
        var high = range.upperBound
        var low = range.lowerBound
        
        while low < high {
            if self[low] > self[high] {
                swapAt(low, high - 1)
                swapAt(high, high - 1)
                
                high -= 1
            } else {
                low += 1
            }
        }
                
        return low
    }
}
