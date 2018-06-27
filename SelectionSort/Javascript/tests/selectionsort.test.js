const selectionSort = require('../src/selectionSort.js');

let performanceArray = [];

test('selectionSort()', () => {
	let array = [64, 25, 12, 22, 11, 5, 34, 16, 98, 55];
	let timeS = performance.now();
	let sortedArray = selectionSort.normal(array.slice());
	let timeE = performance.now();

	performanceArray.push({ name: 'selectionSort()', time: timeE - timeS, n: 5 });

  expect(sortedArray).toEqual(array.sort((x, y) => x - y));
});

test('selectionSort() random', () => {
	let array = []

	for (var i = 0; i < 200; i++) {
		array.push(Math.round(Math.random() * Math.floor(300)));
	}

	let timeS = performance.now();
	let sortedArray = selectionSort.normal(array.slice());
	let timeE = performance.now();

	performanceArray.push({ name: 'selectionSort() random', time: timeE - timeS, n: 400 });

  expect(sortedArray).toEqual(array.sort((x, y) => x - y));
});

test('stableSelectionSort() random', () => {
	let array = []

	for (var i = 0; i < 200; i++) {
		array.push(Math.round(Math.random() * Math.floor(300)));
	}

	timeS = performance.now();
	let sortedArray = selectionSort.stable(array.slice());
	timeE = performance.now();

	performanceArray.push({ name: 'stableSelectionSort() random', time: timeE - timeS, n: 400 });

  expect(sortedArray).toEqual(array.sort((x, y) => x - y));
});


afterAll(() => {
	for (var i = 0; i < performanceArray.length; i++) {
		let p = performanceArray[i];
		console.log("Time for %s with n = %d => %d ms", p.name, p.n, p.time.toFixed(4));
	}
});
