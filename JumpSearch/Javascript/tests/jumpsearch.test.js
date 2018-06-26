const jumpsearch = require('../src/jumpsearch.js');

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
