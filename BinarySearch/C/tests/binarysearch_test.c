#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include <CUnit/Automated.h>
#include <stdlib.h>
#include <stdio.h>
#include <binarysearch.h>

void test_binary_search() {
	int array[100];

	for (int i = 0; i < 100; i++) {
		array[i] = i;
	}

	int length = sizeof(array) / sizeof(int);

	CU_ASSERT_TRUE(binary_search(array, 45, 0, length));
	CU_ASSERT_FALSE(binary_search(array, 145, 0, length));
	CU_ASSERT_TRUE(binary_search(array, 99, 0, length));
	CU_ASSERT_FALSE(binary_search(array, 100, 0, length));

	int smallArray[2] = {1, 2};
	CU_ASSERT_FALSE(binary_search(smallArray, 100, 0, 2));
	CU_ASSERT_TRUE(binary_search(smallArray, 1, 0, 2));
	CU_ASSERT_TRUE(binary_search(smallArray, 2, 0, 2));

	int smallerArray[1] = {101};
	CU_ASSERT_TRUE(binary_search(smallerArray, 101, 0, 1));
	CU_ASSERT_FALSE(binary_search(smallerArray, 2, 0, 1));

	int emptyArray[0] = {};
	CU_ASSERT_FALSE(binary_search(emptyArray, 101, 0, 0));
	CU_ASSERT_FALSE(binary_search(emptyArray, 5, 0, 0));
	CU_ASSERT_FALSE(binary_search(emptyArray, 35, 0, 0));
	CU_ASSERT_FALSE(binary_search(emptyArray, 96, 0, 0));
	CU_ASSERT_FALSE(binary_search(emptyArray, 2, 0, 0));
}

int main(int argc, char *argv[]) {

  CU_initialize_registry();

  CU_pSuite queue = CU_add_suite("Testing binary search", NULL, NULL);
	CU_add_test(queue, "Simple", test_binary_search);

  CU_basic_run_tests();

  CU_cleanup_registry();

  return CU_get_error();
}
