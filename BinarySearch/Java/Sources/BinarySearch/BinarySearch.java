//
//  BinarySearch.java
//  BinarySearch
//
//  Created by Ardalan Samimi on 2019-03-29.
//
package BinarySearch;

public class BinarySearch {

		public static int search(int[] array, int element) {
			return BinarySearch.search(array, element, 0, array.length);
		}

		private static int search(int[] array, int element, int start, int end) {
			int size   = array.length;
			int middle = (start + end) / 2;

			if (start > end || middle >= size) return -1;

			if (element == array[middle]) {
				return middle;
			} else if (element < array[middle]) {
				return BinarySearch.search(array, element, start, middle - 1);
			} else if (element > array[middle]) {
				return BinarySearch.search(array, element, middle + 1, end);
			}

			return -1;
		}

}
