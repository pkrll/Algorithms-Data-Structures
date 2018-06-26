#include "binarysearch.h"
#include <stdio.h>

bool binary_search(int array[], int element, int start, int end) {
	if (start > end) return false;

	int middleIndex = start + (end - start) / 2;
	int middleValue = array[middleIndex];

	if (element == middleValue) return true;

	if (element > middleValue) {
		return binary_search(array, element, middleIndex + 1, end);
	} else if (element < middleValue) {
		return binary_search(array, element, start, middleIndex - 1);
	}

	return false;
}
