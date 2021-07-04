import XCTest
@testable import Algorithms

final class MergeSortTests: XCTestCase {

    private let analyzer = RecursionAnalyzer.self
    
    func testMergeSort() {
        let sortPile = [25, 2, 654, 45, 1356, 3, 1, 65, 8, 17, 4, 245, 9]
        let appleSortedPile = sortPile.sorted()
        var pkrllSortedPile = sortPile

        pkrllSortedPile.mergeSort()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }

    func testMergeSortShortList() {
        let sortPile = [25, 2, 654]
        let appleSortedPile = sortPile.sorted()
        var pkrllSortedPile = sortPile

        pkrllSortedPile.mergeSort()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }
    
    func testMergeSortSortedList() {
        let sortPile = [25, 2, 654, 45, 1356, 3, 1, 65, 8, 17, 4, 245, 9].sorted()
        let appleSortedPile = sortPile
        var pkrllSortedPile = sortPile

        pkrllSortedPile.mergeSort()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }
    
    func testMergeSortRandom() {
        var pile: [UInt32] = []
        
        for _ in 1...150 {
            let randomNumber = arc4random_uniform(4096)
            pile.append(randomNumber)
        }
        
        let appleSortedPile = pile.sorted()
        var pkrllSortedPile = pile

        pkrllSortedPile.mergeSort()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }
    
    func testMergeSortSorted() {
        let sortPile = [25, 2, 654, 45, 1356, 3, 1, 65, 8, 17, 4, 245, 9].sorted()
        let appleSortedPile = sortPile
        var pkrllSortedPile = sortPile

        pkrllSortedPile.mergeSort()
        XCTAssertEqual(pkrllSortedPile, appleSortedPile)
    }
}
