#ifndef _QUEUE_H_
#define _QUEUE_H_

#include <stddef.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct queue queue_t;

/**
 * Initializes a new queue.
 *
 * @return A new queue.
 */
queue_t *queue_init();
/**
 * Checks if queue is empty.
 *
 * @param  queue	The queue to check.
 * @return True if the queue is empty, otherwise false.
 */
bool queue_is_empty(queue_t *);
/**
 * Returns the size of the queue.
 *
 * @param  queue	A queue.
 * @return The size of the queue.
 */
size_t queue_size(queue_t *);
/**
 * Returns the frontmost element in the queue,
 * without removing it.
 *
 * @param  queue	A queue.
 * @return The frontmost element of the queue.
 */
void *queue_front(queue_t *);
/**
 * Adds an element to the end of the queue.
 *
 * @param queue		A queue.
 * @param element The element to enqueue.
 */
void queue_enqueue(queue_t *, void *);
/**
 * Returns the fronstmost element of the queue,
 * and removes it from the queue.
 *
 * @param  queue	A queue.
 * @return The frontmost element of the queue.
 */
void *queue_dequeue(queue_t *);
/**
 * Deinitializes a queue.
 *
 * @param queue		The queue to delete.
 */
void queue_delete(queue_t *);
#endif
