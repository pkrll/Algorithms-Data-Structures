#!/usr/bin/env python2.7
# -*- coding: utf-8 -*-
'''
	binarysearch.py

	Created by Ardalan Samimi on 2019-03-29
'''

def set_defaults(array, start, end):
	if start == None:
		start = 0
	if end == None:
		end = len(array)

	return start, end

def binary_search(array, element, start = None, end = None):
	start, end = set_defaults(array, start, end)

	middle = (start + end) / 2

	if (start > end or middle >= len(array)):
		return -1

	if (array[middle] == element):
		return middle
	elif (element < array[middle]):
		return binary_search(array, element, start, middle - 1)
	else:
		return binary_search(array, element, middle + 1, end)
