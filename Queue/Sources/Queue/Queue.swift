import Foundation

public struct Queue<T> {

	private var data: [T?] = []
	private var head: Int = 0

	public var isEmpty: Bool {
		return self.count == 0
	}

	public var count: Int {
		return self.data.count - self.head
	}

	public var front: T? {
		return (self.isEmpty) ? nil : self.data[self.head]
	}

	public mutating func enqueue(_ item: T) {
		self.data.append(item);
	}

	public mutating func dequeue() -> T? {
		guard self.head < self.data.count, let item = self.data[head] else {
			return nil
		}

		self.data[head] = nil
		self.head = self.head + 1

		let totalNumberOfUsedSlots = self.data.count
		let percentageOfEmptySlots = Double(self.head) / Double(totalNumberOfUsedSlots)

		if totalNumberOfUsedSlots > 50 && percentageOfEmptySlots > 0.25 {
			self.data.removeFirst(self.head)
			self.head = 0
		}

		return item
	}

}
