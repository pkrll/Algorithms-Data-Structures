#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include <CUnit/Automated.h>
#include <time.h>
#include <stdlib.h>
#include <stdio.h>
#include <mergesort.h>

void test_merge_sort_simple() {
	int array[] = {14, 33, 27, 10, 35, 19, 42, 44};
	int length  = sizeof(array) / sizeof(int);

	merge_sort(array, 0, length - 1);

	for (int i = 1; i < length; i++) {
		CU_ASSERT_TRUE(array[i - 1] < array[i]);
	}
}

void test_merge_sort_single() {
	int single_element_array[1] = {1};
	int length = sizeof(single_element_array) / sizeof(int);
	merge_sort(single_element_array, 0, length - 1);
	CU_ASSERT_EQUAL(single_element_array[0], 1);
}

void test_merge_sort_sorted() {
	int sorted_array[] = {1, 2, 15, 45, 59, 65, 112, 545};
	int length = sizeof(sorted_array) / sizeof(int);
	merge_sort(sorted_array, 0, length - 1);

	for (int i = 1; i < length; i++) {
		CU_ASSERT_TRUE(sorted_array[i - 1] < sorted_array[i]);
	}

	int sorted_array_reverse[] = {545, 112, 65, 59, 45, 15, 2, 1};
	merge_sort(sorted_array_reverse, 0, length - 1);

	for (int i = 1; i < length; i++) {
		CU_ASSERT_TRUE(sorted_array_reverse[i - 1] < sorted_array_reverse[i]);
	}

}

void test_merge_sort_dupes() {
	int array_with_dupes[] = {54, 8, 34, 6, 8, 13, 15};
	int length = sizeof(array_with_dupes) / sizeof(int);
	merge_sort(array_with_dupes, 0, length - 1);

	for (int i = 1; i < length; i++) {
		CU_ASSERT_TRUE(array_with_dupes[i - 1] <= array_with_dupes[i]);
	}

	int array_with_same[] = {42, 42, 42, 42, 42, 42, 42};
	length = sizeof(array_with_same) / sizeof(int);
	merge_sort(array_with_same, 0, length - 1);

	for (int i = 1; i < length; i++) {
		CU_ASSERT_TRUE(array_with_same[i - 1] == array_with_same[i]);
	}
}

void test_merge_sort_random() {
	int array[50];
	srand(time(NULL));

	for (int i = 0; i < 50; i++) {
		array[i] = rand() % 512;
	}

	merge_sort(array, 0, 49);

	for (int i = 1; i < 50; i++) {
		CU_ASSERT_TRUE(array[i - 1] <= array[i]);
	}
}

int main(int argc, char *argv[]) {

  CU_initialize_registry();

  CU_pSuite mergesort = CU_add_suite("Testing merge sort", NULL, NULL);
	CU_add_test(mergesort, "Simple", test_merge_sort_simple);
	CU_add_test(mergesort, "Single", test_merge_sort_single);
	CU_add_test(mergesort, "Sorted", test_merge_sort_sorted);
	CU_add_test(mergesort, "Dupes", test_merge_sort_dupes);
	CU_add_test(mergesort, "Random", test_merge_sort_random);

  CU_basic_run_tests();
  CU_cleanup_registry();

  return CU_get_error();
}
