#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include <CUnit/Automated.h>
#include <stdlib.h>
#include <stdio.h>
#include <stack.h>

void test_stack_init() {
	Stack_t *stack = stack_init();
	CU_ASSERT_PTR_NOT_NULL(stack);
	stack_delete(stack);
}

void test_stack_push_pop() {
	Stack_t *stack = stack_init();

	char *item_1 = "Hello World!";
	char *item_2 = "This is a test";
	char *item_3 = "of our stack.";
	char *item_4 = "We want to add";
	char *item_5 = "five items!";

	stack_push(stack, item_1);
	stack_push(stack, item_2);
	stack_push(stack, item_3);
	stack_push(stack, item_4);
	stack_push(stack, item_5);

	CU_ASSERT_EQUAL(stack_size(stack), 5);

	char *popped_item_1 = stack_pop(stack);
	CU_ASSERT_EQUAL(popped_item_1, item_5);
	char *popped_item_2 = stack_pop(stack);
	CU_ASSERT_EQUAL(popped_item_2, item_4);
	char *popped_item_3 = stack_pop(stack);
	CU_ASSERT_EQUAL(popped_item_3, item_3);
	char *popped_item_4 = stack_pop(stack);
	CU_ASSERT_EQUAL(popped_item_4, item_2);
	char *popped_item_5 = stack_pop(stack);
	CU_ASSERT_EQUAL(popped_item_5, item_1);

	CU_ASSERT_EQUAL(stack_size(stack), 0);

	char *item_6 = "Let's try that again";
	char *item_7 = "and see if we can keep";
	char *item_8 = "adding items!";

	stack_push(stack, item_6);
	stack_push(stack, item_7);
	stack_push(stack, item_8);

	CU_ASSERT_EQUAL(stack_size(stack), 3);

	char *popped_item_6 = stack_pop(stack);
	CU_ASSERT_EQUAL(popped_item_6, item_8);
	char *popped_item_7 = stack_pop(stack);
	CU_ASSERT_EQUAL(popped_item_7, item_7);
	char *popped_item_8 = stack_pop(stack);
	CU_ASSERT_EQUAL(popped_item_8, item_6);

	stack_delete(stack);
}

int main(int argc, char *argv[]) {

  CU_initialize_registry();

  CU_pSuite stack = CU_add_suite("Testing stack", NULL, NULL);
	CU_add_test(stack, "Init", test_stack_init);
	CU_add_test(stack, "Push/Pop", test_stack_push_pop);

  CU_basic_run_tests();

  CU_cleanup_registry();

  return CU_get_error();
}
