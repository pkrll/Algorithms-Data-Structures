import Foundation

final class RecursionAnalyzer {
    
    static private(set) var callCounter: Int = 0
    static private(set) var functionName: String = ""
    
    static func prepare(for functionName: StringLiteralType = #function) {
        Self.functionName = functionName
    }
    
    static func didEnterFunction() {
        assert(!functionName.isEmpty, "You must call `prepare` before calling this method.")
        callCounter += 1
    }
    
    static func upperBound(_ upperBound: Int) -> Int {
        let upperBound = Double(upperBound)
        return Int(log2(upperBound) + 1)
    }
    
    static func clear() {
        callCounter = 0
        functionName = ""
    }    
}
