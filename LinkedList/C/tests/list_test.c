#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include <CUnit/Automated.h>
#include <stdlib.h>
#include <stdio.h>
#include <list.h>

void test_list_init() {
	list_t *list = list_init();
	CU_ASSERT_PTR_NOT_NULL(list);
	CU_ASSERT_EQUAL(list_size(list), 0);

	list_delete(list);
}

void test_list_prepend() {
	list_t *list = list_init();
	CU_ASSERT_EQUAL(list_size(list), 0);

	char *element_1 = "Element 1";
	list_prepend(list, element_1);
	CU_ASSERT_EQUAL(list_size(list), 1);

	char *first_1 = list_first(list);
	char *last_1 = list_last(list);
	CU_ASSERT_EQUAL(first_1, element_1);
	CU_ASSERT_EQUAL(last_1, element_1);

	char *element_2 = "Element 2";
	list_prepend(list, element_2);
	CU_ASSERT_EQUAL(list_size(list), 2);

	char *first_2 = list_first(list);
	char *last_2 = list_last(list);

	CU_ASSERT_EQUAL(first_2, element_2);
	CU_ASSERT_EQUAL(last_2, element_1);

	list_delete(list);
}

void test_list_append() {
	list_t *list = list_init();
	CU_ASSERT_EQUAL(list_size(list), 0);

	char *element_1 = "Element 1";
	list_append(list, element_1);
	CU_ASSERT_EQUAL(list_size(list), 1);

	char *first_1 = list_first(list);
	char *last_1 = list_last(list);
	CU_ASSERT_EQUAL(first_1, element_1);
	CU_ASSERT_EQUAL(last_1, element_1);

	char *element_2 = "Element 2";
	list_append(list, element_2);
	CU_ASSERT_EQUAL(list_size(list), 2);

	char *first_2 = list_first(list);
	char *last_2 = list_last(list);

	CU_ASSERT_EQUAL(first_2, element_1);
	CU_ASSERT_EQUAL(last_2, element_2);

	list_delete(list);
}

void test_list_insert() {
	list_t *list = list_init();
	CU_ASSERT_EQUAL(list_size(list), 0);

	char *element_1 = "Element 1";
	list_insert(list, 0, element_1);
	CU_ASSERT_EQUAL(list_size(list), 1);

	char *first_1 = list_first(list);
	CU_ASSERT_EQUAL(first_1, element_1);

	char *element_2 = "Element 2";
	list_insert(list, -1, element_2);
	CU_ASSERT_EQUAL(list_size(list), 2);

	char *last_2 = list_last(list);

	CU_ASSERT_EQUAL(last_2, element_2);

	list_delete(list);
}

void test_list_get() {
	list_t *list = list_init();
	CU_ASSERT_EQUAL(list_size(list), 0);

	for (int i = 0; i < 200; i=i+2) {
		int *item = malloc(sizeof(int));
		*item = i;
		list_insert(list, -1, item);
	}

	int *item_1 = list_get(list, 0);
	CU_ASSERT_EQUAL(0, *item_1);
	int *item_2 = list_get(list, 99);
	CU_ASSERT_EQUAL(198, *item_2);
	int *item_3 = list_get(list, 10);
	CU_ASSERT_EQUAL(10*2, *item_3);

	for (int i = 99; i >= 0; i--) {
		int *item = list_get(list, i);
		CU_ASSERT_EQUAL(i * 2, *item);

		free(item);
		CU_ASSERT_TRUE(list_remove(list, i));
	}

	list_delete(list);
}

void test_list_remove() {
	list_t *list = list_init();

	for (int i = 1; i <= 200; i++) {
		int *item = malloc(sizeof(int));
		*item = i;
		list_append(list, item);
	}

	CU_ASSERT_EQUAL(200, list_size(list));
	CU_ASSERT_PTR_NOT_NULL(list_get(list, 199));
	free(list_get(list, 50));
	CU_ASSERT_TRUE(list_remove(list, 50));
	CU_ASSERT_PTR_NULL(list_get(list, 200));

	free(list_get(list, 198));
	CU_ASSERT_TRUE(list_remove(list, 198));
	CU_ASSERT_PTR_NULL(list_get(list, 198));

	CU_ASSERT_PTR_NOT_NULL(list_get(list, 10));
	CU_ASSERT_PTR_NOT_NULL(list_get(list, 19));
	CU_ASSERT_PTR_NOT_NULL(list_get(list, 120));

	for (int i = 197; i >= 0; i--) {
		int *item = list_get(list, i);
		CU_ASSERT_TRUE(list_remove(list, i));
		free(item);
	}

	list_delete(list);
}

int main(int argc, char *argv[]) {

  CU_initialize_registry();

  CU_pSuite list = CU_add_suite("Testing linked list", NULL, NULL);
	CU_add_test(list, "Init", test_list_init);
	CU_add_test(list, "Prepend", test_list_prepend);
	CU_add_test(list, "Append", test_list_append);
	CU_add_test(list, "Insert", test_list_insert);
	CU_add_test(list, "Get", test_list_get);
	CU_add_test(list, "Remove", test_list_remove);

  CU_basic_run_tests();

  CU_cleanup_registry();

  return CU_get_error();
}
