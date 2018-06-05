import XCTest
@testable import HashTable

final class HashTableTests: XCTestCase {

	func testHashTableInsert() {
		let intTable = HashTable<Int, Int>(capacity: 10)
		var intArray = [Int]()

		XCTAssertEqual(intTable.count, 0)
		XCTAssertEqual(intTable.capacity, 10)

		for i in 0..<20 {
			intArray.append(i)
			intTable.insert(i, forKey: i)
		}

		XCTAssertEqual(intTable.count, 20)

		XCTAssertEqual(intTable.value(forKey: 0), 0)
		XCTAssertEqual(intTable.value(forKey: 15), 15)

		var keys = intTable.keys
		var vals = intTable.values
		keys.sort()
		vals.sort()

		XCTAssertEqual(keys, intArray)
		XCTAssertEqual(vals, intArray)

		let strTable = HashTable<Character, UInt32>(capacity: 10)

		for key in "ABCDEFGHIJKLMNOPQRSTUVWXYZ" {
			let ascii = key.unicodeScalars.filter{ $0.isASCII }.first?.value ?? 0
			let item = ascii
			strTable.insert(item, forKey: key)
		}

		XCTAssertEqual(strTable.count, 26)

		let char: Character = "L"
		let expectedValue = char.unicodeScalars.filter{ $0.isASCII }.first?.value
		let resultedValue = strTable["L"]
		XCTAssertEqual(resultedValue, expectedValue)

		strTable["L"] = 15678
		XCTAssertEqual(strTable["L"]!, 15678)
	}

	func testHashTableRebalance() {
		let table = HashTable<Int, Int>(capacity: 10)

		XCTAssertEqual(table.capacity, 10)

		for i in 0..<5 {
			table.insert(i, forKey: i)
		}

		XCTAssertFalse(table.rebalance())
		XCTAssertEqual(table[9], nil)

		for i in 5..<20 {
			table.insert(i, forKey: i)
		}

		XCTAssertEqual(table.capacity, 10)
		XCTAssertTrue(table.rebalance())
		XCTAssertEqual(table.capacity, 23)
	}

	func testHashTableRemove() {
		let table = HashTable<Int, Int>(capacity: 20)

		for i in 0..<20 {
			table.insert(i, forKey: i)
		}

		XCTAssertEqual(table.count, 20)

		XCTAssertEqual(table[15], 15)
		table.removeValue(forKey: 15)
		XCTAssertEqual(table[15], nil)
		XCTAssertEqual(table.count, 19)

		for i in 0..<20 {
			table.removeValue(forKey: i)
		}

		XCTAssertEqual(table.count, 0)
	}

	static var allTests = [
		("testHashTableInsert", testHashTableInsert),
		("testHashTableRebalance", testHashTableRebalance),
		("testHashTableRemove", testHashTableRemove),
	]
}
