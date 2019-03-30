#!/usr/bin/env python2.7
# -*- coding: utf-8 -*-
'''
	test_insertionsort.py
	test_insertionsort

	Created by Ardalan Samimi on 2019-03-30.
'''
import unittest
import random
from src.insertionsort import insertionsort

class Testinsertionsort(unittest.TestCase):
	def test_insertionsort_simple(self):
		array  = [4, 3, 1, 8, 5]
		sorted = array[:]

		array = insertionsort(array)
		sorted.sort()

		self.assertEqual(array, sorted)

	def test_insertionsort_reverse(self):
		array  = [5, 4, 3, 2, 1]
		sorted = array[:]

		array = insertionsort(array)
		sorted.sort()

		self.assertEqual(array, sorted)

	def test_insertionsort(self):
		array  = [456, 8, 1, 93, 9, 34, 3, 34, 123]
		sorted = array[:]

		array = insertionsort(array)
		sorted.sort()

		self.assertEqual(array, sorted)

		array  = [-5, 34, 3, -99, 99, 5]
		sorted = array[:]

		array = insertionsort(array)
		sorted.sort()

		self.assertEqual(array, sorted)

	def test_insertionsort_random(self):
		array = []

		for i in range(100):
			array.append(random.randint(0, 1500))

		sorted = array[:]

		array = insertionsort(array)
		sorted.sort()

		self.assertEqual(array, sorted)

if __name__ == '__main__':
	unittest.main()
