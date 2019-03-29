import static org.junit.Assert.*;
import org.junit.*;
import java.util.Arrays;
import java.util.concurrent.ThreadLocalRandom;
import InsertionSort.*;

public class TestInsertionSort {

	@Test
	public void TestSimple() {
		int[] array = {5,1,4,2,8};
		int[] sorted = array.clone();

		Arrays.sort(sorted);
		InsertionSort.sort(array);

		assertArrayEquals(array, sorted);
	}

	@Test
	public void TestReverse() {
		int[] array = {7,6,5,4,3,2,1};
		int[] sorted = array.clone();

		Arrays.sort(sorted);
		InsertionSort.sort(array);

		assertArrayEquals(array, sorted);
	}

	@Test
	public void TestRandom() {
		int[] array = new int[100];

		for (int i = 0; i < 100; i++) {
			array[i] = ThreadLocalRandom.current().nextInt(0, 1500);
		}

		int[] sorted = array.clone();

		Arrays.sort(sorted);
		InsertionSort.sort(array);

		assertArrayEquals(array, sorted);
	}

}
