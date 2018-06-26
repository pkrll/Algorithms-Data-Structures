const bs = require('../src/binarySearch.js');

let randomArray = [];

for (var i = 0; i < 150; i++) {
	let randomNumber = Math.floor(Math.random() * Math.floor(300));
	randomArray.push(randomNumber);
}

randomArray.sort((x, y) => x - y);
let element = Math.floor(Math.random() * Math.floor(300));
let expectedValue = randomArray.includes(element);

test('Test recursive binary search', () => {
	let array = [1,2,3,4,5,6,7,8,9,10];
  expect(bs.recursiveBinarySearch(array, 5)).toBe(true);
});

test('Test recursive binary search (randomly generated numbers)', () => {

  expect(bs.recursiveBinarySearch(randomArray, element)).toBe(expectedValue);
});

test('Test iterative binary search (randomly generated numbers)', () => {
  expect(bs.iterativeBinarySearch(randomArray, element)).toBe(expectedValue);
});
