#include "stack.h"

typedef struct node {
	void *item;
	struct node *next;
} node_t;

struct stack {
	size_t size;
	node_t *top;
};

// -------------------------------
// Declarations
// -------------------------------

node_t *node_init(void *, node_t *);

// -------------------------------
// Public
// -------------------------------

Stack_t *stack_init() {
	Stack_t *stack = calloc(1, sizeof(Stack_t));

	return stack;
}

void stack_push(Stack_t *stack, void *item) {
	if (stack == NULL) return;

	stack->top = node_init(item, stack->top);
	stack->size++;
}

void *stack_pop(Stack_t *stack) {
	if (stack == NULL) return NULL;

	node_t *node 	= stack->top;
	void *element = node->item;
	stack->top 		= node->next;
	stack->size--;

	free(node);

	return element;
}

size_t stack_size(Stack_t *stack) {
	return (stack) ? stack->size : 0;
}

void stack_delete(Stack_t *stack) {
	if (stack == NULL) return;

	node_t *node = stack->top;

	while (node) {
		node_t *prev = node;
		node = prev->next;
		free(prev);
	}

	free(stack);
}

// -------------------------------
// Private
// -------------------------------

node_t *node_init(void *item, node_t *next) {
	node_t *node = calloc(1, sizeof(node_t));

	if (node) {
		node->item = item;
		node->next = next;
	}

	return node;
}
