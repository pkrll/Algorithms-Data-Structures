const jumpsearch = require('../src/jumpsearch.js');

test('Jump search simple', () => {
  let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];

  expect(jumpsearch(array, 13)).toBe(true);
});

for (let j = 1; j <= 20; j++) {

	let randomArray = [];

	for (var i = 0; i < 200; i++) {
		let randomNumber = Math.floor(Math.random() * Math.floor(300));
		randomArray.push(randomNumber);
	}

	randomArray.sort((x, y) => x - y);
	let searchElement = Math.floor(Math.random() * Math.floor(300));
	let expectedValue = randomArray.includes(searchElement);

	test('Jump search test #' + j, () => {
	  expect(jumpsearch(randomArray, searchElement)).toBe(expectedValue);
	});

}
