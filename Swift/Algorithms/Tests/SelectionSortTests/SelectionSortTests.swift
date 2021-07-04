import XCTest
@testable import Algorithms

final class SelectionSortTests: XCTestCase {

    private let analyzer = RecursionAnalyzer.self
    
    func testSelectionSort() {
        let sortPile = [25, 2, 654, 45, 1356, 3, 1, 65, 8, 17, 4, 245, 9]
        let appleSortedPile = sortPile.sorted()
        var pkrllSortedPile = sortPile

        pkrllSortedPile.selectionSort()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }

    func testSelectionSortShortList() {
        let sortPile = [25, 2, 654]
        let appleSortedPile = sortPile.sorted()
        var pkrllSortedPile = sortPile

        pkrllSortedPile.selectionSort()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }
    
    func testSelectionSortRandom() {
        var pile: [UInt32] = []
        
        for _ in 1...150 {
            let randomNumber = arc4random_uniform(4096)
            pile.append(randomNumber)
        }
        
        let appleSortedPile = pile.sorted()
        var pkrllSortedPile = pile

        pkrllSortedPile.selectionSort()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }
    
    func testSelectionSortSorted() {
        let sortPile = [25, 2, 654, 45, 1356, 3, 1, 65, 8, 17, 4, 245, 9].sorted()
        let appleSortedPile = sortPile
        var pkrllSortedPile = sortPile

        pkrllSortedPile.selectionSort()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }
    
    func testSelectionSortIteratively() {
        let sortPile = [25, 2, 654, 45, 1356, 3, 1, 65, 8, 17, 4, 245, 9]
        let appleSortedPile = sortPile.sorted()
        var pkrllSortedPile = sortPile

        pkrllSortedPile.selectionSortIteratively()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }

    func testSelectionSortIterativelyShortList() {
        let sortPile = [25, 2, 654]
        let appleSortedPile = sortPile.sorted()
        var pkrllSortedPile = sortPile

        pkrllSortedPile.selectionSortIteratively()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }
    
    func testSelectionSortIterativelyRandom() {
        var pile: [UInt32] = []
        
        for _ in 1...150 {
            let randomNumber = arc4random_uniform(4096)
            pile.append(randomNumber)
        }
        
        let appleSortedPile = pile.sorted()
        var pkrllSortedPile = pile

        pkrllSortedPile.selectionSortIteratively()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }
    
    func testSelectionSortIterativelySorted() {
        let sortPile = [25, 2, 654, 45, 1356, 3, 1, 65, 8, 17, 4, 245, 9].sorted()
        let appleSortedPile = sortPile
        var pkrllSortedPile = sortPile

        pkrllSortedPile.selectionSortIteratively()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }
}
