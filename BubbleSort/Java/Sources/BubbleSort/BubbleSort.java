//
//  BubbleSort.java
//  BubbleSort
//
//  Created by Ardalan Samimi on 2019-03-29.
//
package BubbleSort;

public class BubbleSort {

		public static void sort(int[] array) {
			int size = array.length;

			for (int i = 0; i < size; i++) {
				for (int j = 1; j < size - i; j++) {
					if (array[j - 1] > array[j]) {
						BubbleSort.swap(array, j, j - 1);
					}
				}
			}
		}

		private static void swap(int[] array, int i, int j) {
			int temp = array[i];
			array[i] = array[j];
			array[j] = temp;
		}

}
