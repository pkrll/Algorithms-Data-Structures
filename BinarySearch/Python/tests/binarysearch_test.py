import unittest
from src.binarysearch import binary_search

class TestBinarysearch(unittest.TestCase):

	def test_binarysearch_simple(self):
		array = [1,2,3,4,5]

		self.assertEqual(binary_search(array, 1), 0)
		self.assertEqual(binary_search(array, 2), 1)
		self.assertEqual(binary_search(array, 3), 2)
		self.assertEqual(binary_search(array, 4), 3)
		self.assertEqual(binary_search(array, 5), 4)

	def test_binarysearch(self):
		array = [1, 25, 43, 50, 156, 999]

		self.assertEqual(binary_search(array, 1), 0)
		self.assertEqual(binary_search(array, 25), 1)
		self.assertEqual(binary_search(array, 43), 2)
		self.assertEqual(binary_search(array, 50), 3)
		self.assertEqual(binary_search(array, 156), 4)
		self.assertEqual(binary_search(array, 999), 5)
		self.assertEqual(binary_search(array, 157), -1)

if __name__ == '__main__':
	unittest.main()
