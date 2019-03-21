const quickSort = require('../src/quickSort.js');

test('quickSort() test 1', () => {
	let sortedArray   = [2, 4, 5, 6, 9];
	let unsortedArray = [5, 6, 2, 4, 9];
	let start = 0;
	let end   = unsortedArray.length - 1;
	quickSort(unsortedArray, start, end);

  expect(unsortedArray).toEqual(sortedArray);
});

test('quickSort() test 2', () => {
	let array  = [8, 1, 14, 9, 15, 5, 4, 3, 7, 17, 11, 18, 2, 12, 16, 13, 6, 10];
	let sorted = array.concat().sort((a, b) => { return a - b; });

	let start = 0;
	let end   = array.length - 1;
	quickSort(array, start, end);

  expect(array).toEqual(sorted);
});

test('quickSort() test 3', () => {
	let array  = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
	let sorted = array.concat().sort((a, b) => { return a - b; });

	let start = 0;
	let end   = array.length - 1;
	quickSort(array, start, end);

  expect(array).toEqual(sorted);
});

test('quickSort() test 4', () => {
	let array  = [10, 9, 8, 7, 5, 6, 4, 3, 2, 1];
	let sorted = array.concat().sort((a, b) => { return a - b; });

	let start = 0;
	let end   = array.length - 1;
	quickSort(array, start, end);

  expect(array).toEqual(sorted);
});

test('quickSort() test 5', () => {
	let array  = [1, 9, 8, 7, 5, 6, 4, 3, 2, 10];
	let sorted = array.concat().sort((a, b) => { return a - b; });

	let start = 0;
	let end   = array.length - 1;
	quickSort(array, start, end);

  expect(array).toEqual(sorted);
});

test('quickSort() test 6', () => {
	let array  = [1, 2, 3, 4, 5, 10, 8];
	let sorted = array.concat().sort((a, b) => { return a - b; });

	let start = 0;
	let end   = array.length - 1;
	quickSort(array, start, end);

  expect(array).toEqual(sorted);
});
