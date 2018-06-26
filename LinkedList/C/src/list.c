#include "list.h"

typedef struct node node_t;

struct node {
	void *item;
	node_t *next;
};

struct list {
	size_t size;
	node_t *head;
	node_t *tail;
};

// -------------------------------
// Declarations
// -------------------------------

node_t *node_init(void *item, node_t *next);
node_t **node_get(node_t **head, int index);
int adjust_index(int index, int size);

// -------------------------------
// Public
// -------------------------------

list_t *list_init() {
	list_t *list = calloc(1, sizeof(list_t));

	return list;
}

size_t list_size(list_t *list) {
	return (list == NULL) ? 0 : list->size;
}

void *list_first(list_t *list) {
	return (list == NULL) ? NULL : list->head->item;
}

void *list_last(list_t *list) {
	return (list == NULL) ? NULL : list->tail->item;
}

void list_prepend(list_t *list, void *item) {
	list_insert(list, 0, item);
}

void list_append(list_t *list, void *item) {
	list_insert(list, -1, item);
}

void list_insert(list_t *list, int index, void *item) {
	if (list == NULL) return;

	int size 	 = list_size(list);
	int adjInd = adjust_index(index, size);

	node_t *head = list->head;
	node_t **next = node_get(&head, adjInd);

	*next = node_init(item, *next);

	if (adjInd == 0)		list->head = *next;
	if (adjInd == size) list->tail = *next;

	list->size += 1;
}

void *list_get(list_t *list, int index) {
	if (list == NULL) return NULL;

	node_t *head = list->head;
	node_t **next = node_get(&head, index);

	if (*next) {
		return (*next)->item;
	}

	return NULL;
}

bool list_remove(list_t *list, int index) {
	if (list == NULL) return true;

	node_t *head = list->head;
	node_t **next = node_get(&head, index);

	if (*next) {
		int size = list_size(list);

		node_t *tmp = *next;
		*next = (*next)->next;

		if (index == 0) 		list->head = *next;
		if (index == size)	list->tail = *next;

		free(tmp);

		list->size -= 1;

		return true;
	}

	return false;
}

void list_delete(list_t *list) {
	if (list == NULL) return;

	node_t *node = list->head;

	while (node) {
		node_t *tmp = node;
		node = node->next;
		free(tmp);
	}

	free(list);
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

node_t **node_get(node_t **head, int index) {
	int currentIndex = 0;
	node_t **current = head;

	while (currentIndex < index && *current) {
		*head = *current;
		current = &(*current)->next;
		currentIndex += 1;
	}

	return current;
}

int adjust_index(int index, int size) {
	return (index < 0) ? 1 + index + size : index;
}
