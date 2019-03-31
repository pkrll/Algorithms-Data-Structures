import static org.junit.Assert.*;
import org.junit.*;
import BinarySearch.*;

public class TestBinarySearch {

	@Test
	public void TestBinarySearchSimple() {
		int[] array = {1, 2, 3, 4, 5};

		assertEquals(BinarySearch.search(array, 1), 0);
		assertEquals(BinarySearch.search(array, 2), 1);
		assertEquals(BinarySearch.search(array, 3), 2);
		assertEquals(BinarySearch.search(array, 4), 3);
		assertEquals(BinarySearch.search(array, 5), 4);
		assertEquals(BinarySearch.search(array, 6), -1);
		assertEquals(BinarySearch.search(array, -1), -1);
	}

	@Test
	public void TestBinarySearch() {
		int[] array = new int[100];

		for (int i = 0; i < 100; i++) {
			array[i] = i;
		}

		assertEquals(BinarySearch.search(array, 50), 50);
		assertEquals(BinarySearch.search(array, 35), 35);
		assertEquals(BinarySearch.search(array, 9), 9);
		assertEquals(BinarySearch.search(array, 34), 34);
		assertEquals(BinarySearch.search(array, -5), -1);
	}

		@Test
		public void TestBinarySearchSingle() {
			int[] array = {1};

			assertEquals(BinarySearch.search(array, 1), 0);
			assertEquals(BinarySearch.search(array, 11), -1);
			assertEquals(BinarySearch.search(array, 10), -1);
			assertEquals(BinarySearch.search(array, -1), -1);
			assertEquals(BinarySearch.search(array, -5), -1);
		}

		@Test
		public void TestBinarySearchEmpty() {
			int[] array = {};

			assertEquals(BinarySearch.search(array, 1), -1);
			assertEquals(BinarySearch.search(array, 11), -1);
			assertEquals(BinarySearch.search(array, 10), -1);
			assertEquals(BinarySearch.search(array, -1), -1);
			assertEquals(BinarySearch.search(array, -5), -1);
		}

}
