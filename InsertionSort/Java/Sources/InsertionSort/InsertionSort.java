//
//  InsertionSort.java
//  InsertionSort
//
//  Created by Ardalan Samimi on 2019-03-29.
//
package InsertionSort;

public class InsertionSort {

	public static void sort(int[] array) {
		int size = array.length;

		for (int i = 1; i < size; i++) {
			int j = i - 1;
			int key = array[i];

			while (j >= 0 && array[j] > key) {
				array[j + 1] = array[j];
				j -= 1;
			}

			array[j + 1] = key;
		}
	}

}
