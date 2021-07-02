import XCTest
@testable import Algorithms

final class InsertionSortTests: XCTestCase {

    private let analyzer = RecursionAnalyzer.self
    
    func testInsertionSort() {
        let sortPile = [25, 2, 654, 45, 1356, 3, 1, 65, 8, 17, 4, 245, 9]
        let appleSortedPile = sortPile.sorted()
        var pkrllSortedPile = sortPile
        
        analyzer.clear()
        analyzer.prepare()
        pkrllSortedPile.insertionSort()
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
        pkrllSortedPile.insertionSort()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
        XCTAssertLessThanOrEqual(analyzer.callCounter, analyzer.upperBound(of: appleSortedPile.count, using: .quadratic))
    }
    
    func testInsertionSortIteratively() {
        let sortPile = [25, 2, 654, 45, 1356, 3, 1, 65, 8, 17, 4, 245, 9]
        let appleSortedPile = sortPile.sorted()
        var pkrllSortedPile = sortPile
        
        analyzer.clear()
        analyzer.prepare()
        pkrllSortedPile.insertionSortIteratively()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
        XCTAssertLessThanOrEqual(analyzer.callCounter, analyzer.upperBound(of: appleSortedPile.count, using: .quadratic))
    }
    
    func testInsertionSortIterativelyRandom() {
        var pile: [UInt32] = []
        
        for _ in 1...150 {
            let randomNumber = arc4random_uniform(4096)
            pile.append(randomNumber)
        }
        
        let appleSortedPile = pile.sorted()
        var pkrllSortedPile = pile
        
        analyzer.clear()
        analyzer.prepare()
        pkrllSortedPile.insertionSortIteratively()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
        XCTAssertLessThanOrEqual(analyzer.callCounter, analyzer.upperBound(of: appleSortedPile.count, using: .quadratic))
    }
}
