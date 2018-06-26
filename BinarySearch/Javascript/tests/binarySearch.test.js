const bs = require('../src/binarySearch.js');

test('Test recursive binary search', () => {
	let array = [1,2,3,4,5,6,7,8,9,10];
  expect(bs.recursiveBinarySearch(array, 5)).toBe(true);
});

for (let j = 1; j <= 10; j++) {

	let randomArray = [];

	for (var i = 0; i < 150; i++) {
		let randomNumber = Math.floor(Math.random() * Math.floor(300));
		randomArray.push(randomNumber);
	}

	randomArray.sort((x, y) => x - y);
	let searchElement = Math.floor(Math.random() * Math.floor(300));
	let expectedValue = randomArray.includes(searchElement);

	test('Test recursive binary search (randomly generated numbers). Test #' + j, () => {
	  expect(bs.recursiveBinarySearch(randomArray, searchElement)).toBe(expectedValue);
	});

	test('Test iterative binary search (randomly generated numbers). Test #' + j, () => {
	  expect(bs.iterativeBinarySearch(randomArray, searchElement)).toBe(expectedValue);
	});
}
