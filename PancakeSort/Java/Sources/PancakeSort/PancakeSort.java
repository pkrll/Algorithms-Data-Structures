//
//  PancakeSort.java
//  PancakeSort
//
//  Created by Ardalan Samimi on 2019-03-29.
//
package PancakeSort;

public class PancakeSort {

	private static int findMaximum(int[] array, int k) {
		int tmpElement  = array[k];
		int tmpPosition = -1;
		for (int i = 0; i < k; i++) {
			if (array[i] > tmpElement) {
				tmpElement  = array[i];
				tmpPosition = i;
			}
		}

		return tmpPosition;
	}

	private static void flip(int[] array, int k) {
		if (array.length < 2) return;
		if (array.length < k) k = array.length;

		for (int i = 0; i < k/2; i++) {
			int tmp = array[i];
			array[i] = array[k - i - 1];
			array[k - i - 1] = tmp;
		}
	}

	public static int[] sort(int[] array) {
		int size = array.length - 1;
		for (int i = size; i >= 0; i--) {
			int max = PancakeSort.findMaximum(array, i);

			if (max != -1) {
				PancakeSort.flip(array, max + 1);
				PancakeSort.flip(array, i + 1);
			}
		}

		return array;
	}

}
