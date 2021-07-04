import XCTest
@testable import Algorithms

final class QuickSortTests: XCTestCase {

    private let analyzer = RecursionAnalyzer.self
    
    func testQuickSort() {
        let sortPile = [25, 2, 654, 45, 1356, 3, 1, 65, 8, 17, 4, 245, 9]
        let appleSortedPile = sortPile.sorted()
        var pkrllSortedPile = sortPile

        pkrllSortedPile.quickSort()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }
    
    func testQuickSortRandom() {
        var pile: [UInt32] = []
        
        for _ in 1...150 {
            let randomNumber = arc4random_uniform(4096)
            pile.append(randomNumber)
        }
        
        let appleSortedPile = pile.sorted()
        var pkrllSortedPile = pile

        pkrllSortedPile.quickSort()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }
    
    func testQuickSortSorted() {
        let sortPile = [25, 2, 654, 45, 1356, 3, 1, 65, 8, 17, 4, 245, 9].sorted()
        let appleSortedPile = sortPile
        var pkrllSortedPile = sortPile

        pkrllSortedPile.quickSort()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }

    func testQuickSortIteratively() {
        let sortPile = [25, 2, 654, 45, 1356, 3, 1, 65, 8, 17, 4, 245, 9]
        let appleSortedPile = sortPile.sorted()
        var pkrllSortedPile = sortPile

        pkrllSortedPile.quickSortIteratively()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }
    
    func testQuickSortRandomIteratively() {
        var pile: [UInt32] = []
        
        for _ in 1...150 {
            let randomNumber = arc4random_uniform(4096)
            pile.append(randomNumber)
        }
        
        let appleSortedPile = pile.sorted()
        var pkrllSortedPile = pile

        pkrllSortedPile.quickSortIteratively()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }
    
    func testQuickSortSortedIteratively() {
        let sortPile = [25, 2, 654, 45, 1356, 3, 1, 65, 8, 17, 4, 245, 9].sorted()
        let appleSortedPile = sortPile
        var pkrllSortedPile = sortPile

        pkrllSortedPile.quickSortIteratively()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }
}