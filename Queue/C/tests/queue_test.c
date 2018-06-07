#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include <CUnit/Automated.h>
#include <stdlib.h>
#include <stdio.h>
#include <queue.h>

void test_queue_init() {
	queue_t *queue = queue_init();
	CU_ASSERT_PTR_NOT_NULL(queue);
	queue_delete(queue);
}

void test_queue_enqueue() {
	queue_t *queue = queue_init();

	CU_ASSERT_EQUAL(queue_size(queue), 0);

	char *element_1 = "Hello World";
	char *element_2 = "This is McQueue.";
	char *element_3 = "Queues are fun!";
	char *element_4 = "So much fun!";

	queue_enqueue(queue, element_1);
	queue_enqueue(queue, element_2);
	queue_enqueue(queue, element_3);
	CU_ASSERT_EQUAL(queue_front(queue), element_1);
	CU_ASSERT_EQUAL(queue_size(queue), 3);

	char *return_1 = queue_dequeue(queue);
	CU_ASSERT_EQUAL(return_1, element_1);
	CU_ASSERT_EQUAL(queue_front(queue), element_2);
	CU_ASSERT_EQUAL(queue_size(queue), 2);

	queue_enqueue(queue, element_4);
	CU_ASSERT_EQUAL(queue_size(queue), 3);

	queue_delete(queue);
}

void test_queue_dequeue() {
	queue_t *queue = queue_init();
	CU_ASSERT_EQUAL(queue_size(queue), 0);

	int array[10];

	for (int i = 0; i < 10; i++) {
		array[i] = i;
		queue_enqueue(queue, &array[i]);
	}

	CU_ASSERT_EQUAL(queue_size(queue), 10);

	for (int i = 0; i < 10; i++) {
		int *element = queue_dequeue(queue);
		CU_ASSERT_EQUAL(*element, i);
		CU_ASSERT_EQUAL(queue_size(queue), 9-i);
	}

	for (int i = 10; i > 0; i--) {
		array[i] = i;
		queue_enqueue(queue, &array[i]);
	}

	for (int i = 0; i < 10; i++) {
		int *element = queue_dequeue(queue);
		CU_ASSERT_EQUAL(*element, 10-i);
		CU_ASSERT_EQUAL(queue_size(queue), 9-i);
	}

	queue_delete(queue);
}

int main(int argc, char *argv[]) {

  CU_initialize_registry();

  CU_pSuite queue = CU_add_suite("Testing queue", NULL, NULL);
	CU_add_test(queue, "Init", test_queue_init);
	CU_add_test(queue, "Enqueue", test_queue_enqueue);
	CU_add_test(queue, "Dequeue", test_queue_dequeue);

  CU_basic_run_tests();

  CU_cleanup_registry();

  return CU_get_error();
}
