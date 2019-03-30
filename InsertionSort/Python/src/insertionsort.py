#!/usr/bin/env python2.7
# -*- coding: utf-8 -*-
'''
	insertionsort.py
	insertionsort

	Created by Ardalan Samimi on 2019-03-30.
'''

def insertionsort(input):
	array = input[:]
	size  = len(array)

	for i in range(0, size):
		v = array[i]
		j = i - 1

		while (j >= 0 and v <= array[j]):
			array[j + 1] = array[j]
			j = j - 1

		array[j + 1] = v

	return array
