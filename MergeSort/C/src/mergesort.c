#include "mergesort.h"
#include <stdio.h>

void merge(int array[], int left, int middle, int right) {
	int k = middle + 1;

	if (array[middle] <= array[k]) return;

	while (left <= middle && k <= right) {
		if (array[left] <= array[k]) {
			left++;
		} else {
			int temporary = array[k];

			for (int i = k; i != left; i--) {
				array[i] = array[i - 1];
			}

			array[left] = temporary;

			left++;
			middle++;
			k++;
		}
	}
}

void merge_sort(int array[], int left, int right) {
	if (right <= left) return;

	int middle = left + (right - left) / 2;

	merge_sort(array, left, middle);
	merge_sort(array, middle + 1, right);
	merge(array, left, middle, right);
}
