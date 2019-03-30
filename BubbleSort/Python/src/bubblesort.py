#!/usr/bin/env python2.7
# -*- coding: utf-8 -*-
'''
	bubblesort.py
	bubblesort

	Created by Ardalan Samimi on 2019-03-29.
'''

def swap(array, i, j):
	tempVal  = array[i]
	array[i] = array[j]
	array[j] = tempVal

def bubblesort(array):
	size = len(array)

	for i in range(0, size):
		for j in range(i + 1, size):
			if (array[i] > array[j]):
				swap(array, i, j)
