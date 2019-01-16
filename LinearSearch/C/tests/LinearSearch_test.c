#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include <CUnit/Automated.h>
#include <stdlib.h>
#include <stdio.h>
#include <LinearSearch.h>

void test_linear_search() {
	int array[100];

	for (int i = 0; i < 100; i++) {
		array[i] = i;
	}

	int length = sizeof(array) / sizeof(int);

	CU_ASSERT_TRUE(linear_search(array, 45, length));
	CU_ASSERT_FALSE(linear_search(array, 145, length));
	CU_ASSERT_TRUE(linear_search(array, 99, length));
	CU_ASSERT_FALSE(linear_search(array, 100, length));

	int smallArray[2] = {1, 2};
	CU_ASSERT_FALSE(linear_search(smallArray, 100, 2));
	CU_ASSERT_TRUE(linear_search(smallArray, 1, 2));
	CU_ASSERT_TRUE(linear_search(smallArray, 2, 2));

	int smallerArray[1] = {101};
	CU_ASSERT_TRUE(linear_search(smallerArray, 101, 1));
	CU_ASSERT_FALSE(linear_search(smallerArray, 2, 1));

	int smallestArray[] = {1};
	CU_ASSERT_FALSE(linear_search(smallestArray, 101, 0));
	CU_ASSERT_FALSE(linear_search(smallestArray, 5, 0));
	CU_ASSERT_FALSE(linear_search(smallestArray, 35, 0));
	CU_ASSERT_FALSE(linear_search(smallestArray, 96, 0));
	CU_ASSERT_FALSE(linear_search(smallestArray, 2, 0));
}

int main(int argc, char *argv[]) {

  CU_initialize_registry();

  CU_pSuite linearsearch = CU_add_suite("Testing linear search", NULL, NULL);
	CU_add_test(linearsearch, "Simple", test_linear_search);

  CU_basic_run_tests();
  CU_cleanup_registry();

  return CU_get_error();
}
