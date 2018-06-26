const linearSearch = require('../src/linearsearch.js');

test('search [1,2,3,4] for 5 gives false', () => {
  expect(linearSearch([1,2,3,4], 5)).toBe(false);
});

test('search randomly generated array', () => {
	let array = [];
  for (let i = 0; i < 10; i++) {
		let randomNumber = Math.floor(Math.random() * Math.floor(20));
		array.push(randomNumber);
	}

	let needle = Math.floor(Math.random() * Math.floor(20));
  expect(linearSearch(array, needle)).toBe(array.includes(needle));
});
