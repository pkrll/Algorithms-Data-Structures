#include "queue.h"

typedef struct node {
	void *element;
	struct node *next;
} node_t;

struct queue {
	size_t size;
	node_t *first;
	node_t *last;
};

// -------------------------------
// Declarations
// -------------------------------
node_t *node_init(void *);

// -------------------------------
// Public
// -------------------------------

queue_t *queue_init() {
	queue_t *queue = calloc(1, sizeof(queue_t));
	return queue;
}

bool queue_is_empty(queue_t *queue) {
	if (queue == NULL) return true;

	return (queue == NULL && queue->size == 0) ? true : false;
}

size_t queue_size(queue_t *queue) {
	if (queue == NULL) return 0;

	return queue->size;
}

void *queue_front(queue_t *queue) {
	if (queue == NULL) return NULL;

	return queue->first->element;
}

void queue_enqueue(queue_t *queue, void *element) {
	if (queue == NULL) return;

	node_t *node = node_init(element);

	if (queue->first == NULL)	queue->first = node;
	if (queue->last != NULL) 	queue->last->next = node;

	queue->last = node;
	queue->size += 1;
}

void *queue_dequeue(queue_t *queue) {
	if (queue == NULL) return NULL;
	if (queue->size == 0) return NULL;

	node_t *node = queue->first;
	void *element = node->element;

	queue->first = node->next;
	queue->size -= 1;

	free(node);

	return element;
}

void queue_delete(queue_t *queue) {
	if (queue == NULL) return;

	node_t *node = queue->first;

	while (node) {
		node_t *prev = node;
		node = node->next;
		free(prev);
	}

	free(queue);
}

// -------------------------------
// Private
// -------------------------------

node_t *node_init(void *element) {
	node_t *node = calloc(1, sizeof(node_t));

	if (node) {
		node->element = element;
	}

	return node;
}
