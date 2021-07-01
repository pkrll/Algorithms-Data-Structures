import Foundation

final class RecursionAnalyzer {
    
    enum TimeComplexity {
        case logarithmic
        case quadratic
    }
    
    static private(set) var callCounter: Int = 0
    static private(set) var functionName: String = ""
    
    static func prepare(for functionName: StringLiteralType = #function) {
        Self.functionName = functionName
    }
    
    static func didEnterFunction() {
        assert(!functionName.isEmpty, "You must call `prepare` before calling this method.")
        callCounter += 1
    }

    static func upperBound(of value: Int, using timeComplexity: TimeComplexity) -> Int {
        let value = Double(value)
        
        switch timeComplexity {
        case .logarithmic:
            return Int(log2(value) + 1)
        case .quadratic:
            return Int(pow(value, 2))
        }
    }
    
    static func clear() {
        callCounter = 0
        functionName = ""
    }    
}
