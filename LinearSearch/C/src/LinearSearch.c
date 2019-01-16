#include "LinearSearch.h"
#include <stdio.h>

bool linear_search(int array[], int element, int length) {
	for (int i = 0; i < length; i++) {
		if (array[i] == element) {
			return true;
		}
	}

	return false;
}
