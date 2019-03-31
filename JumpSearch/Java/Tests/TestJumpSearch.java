import static org.junit.Assert.*;
import org.junit.*;
import JumpSearch.*;

public class TestJumpSearch {

	@Test
	public void TestJumpSearchSimple() {
		int[] array = {1, 2, 3, 4, 5};

		assertEquals(JumpSearch.search(array, 1), 0);
		assertEquals(JumpSearch.search(array, 2), 1);
		assertEquals(JumpSearch.search(array, 3), 2);
		assertEquals(JumpSearch.search(array, 4), 3);
		assertEquals(JumpSearch.search(array, 5), 4);
		assertEquals(JumpSearch.search(array, 6), -1);
		assertEquals(JumpSearch.search(array, -1), -1);
	}

	@Test
	public void TestJumpSearch() {
		int[] array = new int[100];

		for (int i = 0; i < 100; i++) {
			array[i] = i;
		}

		assertEquals(JumpSearch.search(array, 50), 50);
		assertEquals(JumpSearch.search(array, 35), 35);
		assertEquals(JumpSearch.search(array, 9), 9);
		assertEquals(JumpSearch.search(array, 34), 34);
		assertEquals(JumpSearch.search(array, -5), -1);
	}

	@Test
	public void TestJumpSearchSingle() {
		int[] array = {1};

		assertEquals(JumpSearch.search(array, 1), 0);
		assertEquals(JumpSearch.search(array, 11), -1);
		assertEquals(JumpSearch.search(array, 10), -1);
		assertEquals(JumpSearch.search(array, -1), -1);
		assertEquals(JumpSearch.search(array, -5), -1);
	}

	@Test
	public void TestJumpSearchEmpty() {
		int[] array = {};

		assertEquals(JumpSearch.search(array, 1), -1);
		assertEquals(JumpSearch.search(array, 11), -1);
		assertEquals(JumpSearch.search(array, 10), -1);
		assertEquals(JumpSearch.search(array, -1), -1);
		assertEquals(JumpSearch.search(array, -5), -1);
	}

}
