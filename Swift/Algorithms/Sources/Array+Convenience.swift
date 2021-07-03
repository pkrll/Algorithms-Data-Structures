import Foundation

extension Array {
    var isNotEmpty: Bool { !isEmpty }
    
    mutating func dropFirst() -> Element? {
        guard count > 0 else {
            return nil
        }
        
        return removeFirst()
    }
    
    mutating func appendIfNotNil(element: Element?) {
        guard let element = element else {
            return
        }
        
        append(element)
    }
}
