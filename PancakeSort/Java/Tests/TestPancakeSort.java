import static org.junit.Assert.*;
import org.junit.*;
import java.util.Arrays;
import PancakeSort.*;

public class TestPancakeSort {

	@Test
	public void TestSort() {
		int[] array1 = {1,5,4,3,2};
		int[] sorted = array1.clone();
		Arrays.sort(sorted);
		assertArrayEquals(PancakeSort.sort(array1), sorted);

		int[] array2 = {5,7,1,3,2};
		sorted = array2.clone();
		Arrays.sort(sorted);
		assertArrayEquals(PancakeSort.sort(array2), sorted);

		int[] array3 = {65,89,123,3,8,54,10,1};
		sorted = array3.clone();
		Arrays.sort(sorted);
		assertArrayEquals(PancakeSort.sort(array3), sorted);

		int[] array4 = {5,7,5,5,5};
		sorted = array4.clone();
		Arrays.sort(sorted);
		assertArrayEquals(PancakeSort.sort(array4), sorted);
	}

}
