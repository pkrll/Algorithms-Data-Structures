#!/usr/bin/env python2.7
# -*- coding: utf-8 -*-
'''
	test_bubblesort.py
	test_bubblesort

	Created by Ardalan Samimi on 2019-03-29.
'''
import unittest
import random
from src.bubblesort import bubblesort

class Testbubblesort(unittest.TestCase):

	def test_bubblesort_simple(self):
		array  = [4, 3, 1, 8, 5]
		sorted = array[:]

		bubblesort(array)
		sorted.sort()

		self.assertEqual(array, sorted)

	def test_bubblesort_reverse(self):
		array  = [5, 4, 3, 2, 1]
		sorted = array[:]

		bubblesort(array)
		sorted.sort()

		self.assertEqual(array, sorted)

	def test_bubblesort(self):
		array  = [456, 8, 1, 93, 9, 34, 3, 34, 123]
		sorted = array[:]

		bubblesort(array)
		sorted.sort()

		self.assertEqual(array, sorted)

		array  = [-5, 34, 3, -99, 99, 5]
		sorted = array[:]

		bubblesort(array)
		sorted.sort()

		self.assertEqual(array, sorted)

	def test_bubblesort_random(self):
		array = []

		for i in range(100):
			array.append(random.randint(0, 1500))

		sorted = array[:]

		bubblesort(array)
		sorted.sort()

		self.assertEqual(array, sorted)

if __name__ == '__main__':
	unittest.main()
