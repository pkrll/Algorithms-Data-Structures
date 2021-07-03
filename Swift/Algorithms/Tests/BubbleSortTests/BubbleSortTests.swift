import XCTest
@testable import Algorithms

final class BubbleSortTests: XCTestCase {
    
    private let analyzer = RecursionAnalyzer.self
    
    func testBubbleSort() {
        let sortPile = [25, 2, 654, 45, 1356, 3, 1, 65, 8, 17, 4, 245, 9]
        let appleSortedPile = sortPile.sorted()
        var pkrllSortedPile = sortPile
        
        analyzer.clear()
        analyzer.prepare()
        pkrllSortedPile.bubbleSort()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
        XCTAssertLessThanOrEqual(analyzer.callCounter, analyzer.upperBound(of: appleSortedPile.count, using: .quadratic))
    }
    
    func testInsertionSortRandom() {
        var pile: [UInt32] = []
        
        for _ in 1...150 {
            let randomNumber = arc4random_uniform(4096)
            pile.append(randomNumber)
        }
        
        let appleSortedPile = pile.sorted()
        var pkrllSortedPile = pile
        
        analyzer.clear()
        analyzer.prepare()
        pkrllSortedPile.bubbleSort()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
        XCTAssertLessThanOrEqual(analyzer.callCounter, analyzer.upperBound(of: appleSortedPile.count, using: .quadratic))
    }
    
    func testInsertionSortInverted() {
        var pile: [Int] = []
        
        for i in 1...150 {
            let number = 150 - i
            pile.append(number)
        }
        
        let appleSortedPile = pile.sorted()
        var pkrllSortedPile = pile
        
        analyzer.clear()
        analyzer.prepare()
        pkrllSortedPile.bubbleSort()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
        XCTAssertLessThanOrEqual(analyzer.callCounter, analyzer.upperBound(of: appleSortedPile.count, using: .quadratic))
    }
    
    func testBubbleSortIteratively() {
        let sortPile = [25, 2, 654, 45, 1356, 3, 1, 65, 8, 17, 4, 245, 9]
        let appleSortedPile = sortPile.sorted()
        var pkrllSortedPile = sortPile

        pkrllSortedPile.bubbleSortIteratively()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }
    
    func testInsertionSortRandomIteratively() {
        var pile: [UInt32] = []
        
        for _ in 1...150 {
            let randomNumber = arc4random_uniform(4096)
            pile.append(randomNumber)
        }
        
        let appleSortedPile = pile.sorted()
        var pkrllSortedPile = pile

        pkrllSortedPile.bubbleSortIteratively()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }
    
    func testInsertionSortInvertedIteratively() {
        var pile: [Int] = []
        
        for i in 1...150 {
            let number = 150 - i
            pile.append(number)
        }
        
        let appleSortedPile = pile.sorted()
        var pkrllSortedPile = pile

        pkrllSortedPile.bubbleSortIteratively()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }
}
