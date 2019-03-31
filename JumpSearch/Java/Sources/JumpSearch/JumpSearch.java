//
//  JumpSearch.java
//  JumpSearch
//
//  Created by Ardalan Samimi on 2019-03-30.
//
package JumpSearch;
import java.lang.Math;

public class JumpSearch {

	public static int search(int[] array, int element) {
		int size  = array.length;
		int jump  = (int)Math.sqrt(size);
		int start = 0;
		int end   = jump;

		while (end < size && element >= array[end]) {
			start = end;
			end   = end + jump;
			if (end > size - 1) end = size;
		}

		return JumpSearch.linearSearch(array, element, start, end);
	}

	private static int linearSearch(int[] array, int element, int start, int end) {
		for (int i = start; i < end; i++) {
			if (array[i] == element) {
				return i;
			}
		}

		return -1;
	}

}
