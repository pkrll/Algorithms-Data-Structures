#ifndef _STACK_H_
#define _STACK_H_

#include <stddef.h>
#include <stdlib.h>

typedef struct stack Stack_t;

/**
 * Initializes a stack.
 *
 * @return Pointer to a new Stack_t structure.
 */
Stack_t *stack_init();
/**
 * Pushes an element to the stack.
 *
 * @param stack 	The stack to push the element onto.
 * @param element The element to push on the stack.
 */
void stack_push(Stack_t*, void *);
/**
 * Pops an element from the stack.
 *
 * @param  stack	The stack to pop an element from.
 * @return The front most element on the stack.
 */
void *stack_pop(Stack_t *);
/**
 * Returns the size of the stack.
 *
 * @param  stack	A stack.
 * @return The size of a stack.
 */
size_t stack_size(Stack_t *);
/**
 * Deallocates a stack.
 *
 * @param stack	The stack to delete.
 */
void stack_delete(Stack_t *);

#endif
