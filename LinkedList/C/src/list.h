#ifndef _LINKEDLIST_H_
#define _LINKEDLIST_H_

#include <stddef.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct list list_t;

/**
 * Initializes a new linked list.
 *
 * @return A new linked list.
 */
list_t *list_init();
/**
 * Returns the size of the list.
 *
 * @param  list		A list.
 * @return The size of the list.
 */
size_t list_size(list_t *);
/**
 * Returns the first element of the list.
 *
 * @param  list		A list.
 * @return The first element of the list.
 */
void *list_first(list_t *);
/**
 * Returns the last element of the list.
 *
 * @param  list		A list.
 * @return The last element of the list.
 */
void *list_last(list_t *);
/**
 * Adds an element to the front of the list.
 *
 * @param list		A list.
 * @param element	The element to add to the list.
 */
void list_prepend(list_t *, void *);
/**
 * Adds an element to the end of the list.
 *
 * @param list		A list.
 * @param element	The element to add to the list.
 */
void list_append(list_t *, void *);
/**
 * Inserts an element at the specified position of the list.
 *
 * @param list		A list.
 * @param index		The index.
 * @param element	The element to add to the list.
 */
void list_insert(list_t *, int, void *);
/**
 * Retrieves an element at the specified index of the list.
 *
 * @param  list 	A list.
 * @param  index	The index of the element.
 * @return The element at the specified index.
 */
void *list_get(list_t *, int);
/**
 * Removes an item at the specified index of the list.
 *
 * @param  list		A list.
 * @param  index	The index of the element.
 * @return True if the index exists, otherwise false.
 */
bool list_remove(list_t *, int);
/**
 * Deinitializes a list.
 *
 * @param list	The list to delete.
 */
void list_delete(list_t *);

#endif
