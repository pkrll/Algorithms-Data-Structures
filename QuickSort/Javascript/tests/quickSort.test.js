const quickSort = require('../src/quickSort.js');

test('quickSort() returns "Hello World!"', () => {
	let sortedArray   = [2, 4, 5, 6, 9];
	let unsortedArray = [5, 6, 2, 4, 9];
	let start = 0;
	let end   = unsortedArray.length - 1;
	quickSort(unsortedArray, start, end);

  expect(unsortedArray).toEqual(sortedArray);
});
