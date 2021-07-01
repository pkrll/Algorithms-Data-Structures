import XCTest
@testable import Algorithms

final class BinarySearchTests: XCTestCase {
    
    static var values: [Int] = []
    static var primes: [Int] = []
    static var largeRandomArray: [Int] = []
    static var randomElement = 0
    
    private let analyzer = RecursionAnalyzer.self
    
    func testBinarySearch() throws {
        let values = BinarySearchTests.values
        let primes = BinarySearchTests.primes
        var key: Int?

        analyzer.clear()
        analyzer.prepare()
        key = values.binarySearch(for: 8)
        XCTAssertEqual(key, nil)
        XCTAssertLessThanOrEqual(analyzer.callCounter, analyzer.upperBound(of: values.count, using: .logarithmic))
        
        analyzer.clear()
        analyzer.prepare()
        key = values.binarySearch(for: 6)
        XCTAssertEqual(key, 5)
        XCTAssertLessThanOrEqual(analyzer.callCounter, analyzer.upperBound(of: values.count, using: .logarithmic))

        analyzer.clear()
        analyzer.prepare()
        key = primes.binarySearch(for: 67)
        XCTAssertLessThanOrEqual(analyzer.callCounter, analyzer.upperBound(of: primes.count, using: .logarithmic))
        
        analyzer.clear()
        analyzer.prepare()
        key = primes.binarySearch(for: 79)
        XCTAssertLessThanOrEqual(analyzer.callCounter, analyzer.upperBound(of: primes.count, using: .logarithmic))
        
        analyzer.clear()
        analyzer.prepare()
        key = primes.binarySearch(for: 73)
        XCTAssertLessThanOrEqual(analyzer.callCounter, analyzer.upperBound(of: primes.count, using: .logarithmic))
    }
    
    func testBinarySearchRandom() {
        let randomElement = BinarySearchTests.randomElement
        let randomArray = BinarySearchTests.largeRandomArray
        let appleKey = randomArray.firstIndex(of: randomElement)
        
        analyzer.clear()
        analyzer.prepare()
        let key = randomArray.binarySearch(for: randomElement)
        XCTAssertEqual(key, appleKey)
        XCTAssertLessThanOrEqual(analyzer.callCounter, analyzer.upperBound(of: randomArray.count, using: .logarithmic))
    }
    
    // MARK: - Iterative Binary Search
    
    func testbinarySearchIteratively() {
        let values = BinarySearchTests.values
        let primes = BinarySearchTests.primes
        var key: Int?
        
        key = values.binarySearchIteratively(for: 6)
        XCTAssertEqual(key, 5)
        key = primes.binarySearchIteratively(for: 67)
        XCTAssertEqual(key, 18)
        key = primes.binarySearchIteratively(for: 79)
        XCTAssertEqual(key, 21)
        key = primes.binarySearchIteratively(for: 73)
        XCTAssertEqual(key, 20)
    }
    
    func testBinarySearchIterativelyRandom() {
        let randomElement = BinarySearchTests.randomElement
        let randomArray = BinarySearchTests.largeRandomArray
        let appleKey = randomArray.firstIndex(of: randomElement)
        
        let key = randomArray.binarySearchIteratively(for: randomElement)
        XCTAssertEqual(key, appleKey)
    }
    
    override class func setUp() {
        BinarySearchTests.values = [1,2,3,4,5,6,7,9,10]
        BinarySearchTests.primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
        
        let capacity = 1000000
        
        for i in 0..<capacity {
            BinarySearchTests.largeRandomArray.append(i)
        }
        
        print("Large random array created. Now sorting...")
        
        BinarySearchTests.largeRandomArray.sort()
        BinarySearchTests.randomElement = Int(arc4random_uniform(UInt32(capacity)))
    }
}
