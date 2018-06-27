const insertionSort = require('../src/insertionSort.js');

test('insertionSort()', () => {
	let array = [7, 94, 45, 2, 4, 9, 1];

  expect(insertionSort(array.slice())).toEqual(array.sort((a, b) => a - b));
});

test('insertionSort() random', () => {
  let array = [];
	for (let i = 0; i < 200; i++) {
		let randomNumber = Math.round(Math.random() * Math.floor(300));
		array.push(randomNumber);
	}

	let sortedArray = insertionSort(array.slice());

  expect(sortedArray).toEqual(array.sort((a, b) => a - b));
});
