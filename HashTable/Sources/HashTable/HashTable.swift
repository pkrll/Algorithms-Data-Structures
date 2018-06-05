
public class HashTable<K: Hashable, V>: CustomStringConvertible {

	private typealias Item = (key: K, value: V)
	private typealias Slot = [Item]

	private var slots: [Slot]
	private(set) public var capacity: Int
	private(set) public var count: Int

	public var keys: [K] {
		return self.slots.map({
			$0.map { $0.key }
		}).reduce([], { result, element in
			result + element
		})
	}

	public var values: [V] {
		return self.slots.map({
			$0.map { $0.value }
		}).reduce([], { result, element in
			result + element
		})
	}

	public var description: String {
		var description = ""

		for (index, slot) in self.slots.enumerated() {
			description += "\(index) => [ "

			for item in slot {
				description += "\(item), "
			}
			description += "] (\(slot.count) items)\n"
		}

		return description
	}

	public var loadFactor: Double {
		return Double(self.count) / Double(self.slots.count)
	}

	public subscript(key: K) -> V? {
		get {
			return self.value(forKey: key)
		}
		set {
			if let value = newValue {
				self.insert(value, forKey: key)
			} else {
				self.removeValue(forKey: key)
			}
		}
	}

	init(capacity: Int) {
		self.capacity = capacity
		self.count = 0
		self.slots = Array<Slot>(repeating: [], count: capacity)
	}

	public func rebalance() -> Bool {
		if self.loadFactor > 0.75, let capacity = self.nextPrime(self.count) {
			let slots = self.slots

			self.capacity = capacity
			self.slots = Array<Slot>(repeating: [], count: capacity)

			for slot in slots {
				for item in slot {
					self.insert(item.value, forKey: item.key)
				}
			}

			return true
		}

		return false
	}

	public func insert(_ value: V, forKey key: K) {
		let slot = self.index(forKey: key)
		let item = (key: key, value: value)
		var spot: Int? = nil

		for (index, item) in self.slots[slot].enumerated() {
			if item.key == key {
				spot = index
				break
			}
		}

		if let spot = spot {
			self.slots[slot][spot] = item
		} else {
			self.slots[slot].append(item)
			self.count += 1
		}
	}

	public func value(forKey key: K) -> V? {
		let slot = self.index(forKey: key)

		for item in self.slots[slot] {
			if item.key == key { return item.value }
		}

		return nil
	}

	public func removeValue(forKey key: K) {
		let slot = self.index(forKey: key)
		var spot: Int? = nil

		for (index, item) in self.slots[slot].enumerated() {
			if item.key == key {
				spot = index
				break
			}
		}

		if let spot = spot {
			self.slots.remove(at: spot)
			self.count -= 1
		}
	}

	private func index(forKey key: K) -> Int {
		return abs(key.hashValue % self.capacity)
	}

	private func nextPrime(_ start: Int) -> Int? {
		let end = 2 * start

		for i in start..<end {
			if self.isPrime(i) { return i }
		}

		return nil
	}

	private func isPrime(_ n: Int) -> Bool {
		guard n > 4 else { return (n > 1 && n <= 3) ? true : false }
		var i = 2
		repeat {
			if n % i == 0 { return false }
			i += 1
		} while (i < n)

		return true
	}
}
