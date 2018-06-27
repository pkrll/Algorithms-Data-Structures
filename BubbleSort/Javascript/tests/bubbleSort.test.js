const bubbleSort = require('../src/bubbleSort.js');

let timeSumOptimized = 0;
let timeSumNormal = 0;
let timeSumSimple = 0;
let timeStart = 0;
let timeEnd = 0;
let total = 100;

test('bubbleSort()"', () => {
	let array = [5, 8, 4, 3, 1];

	timeStart = performance.now();
	let sortedArray = bubbleSort.normal(array.slice())
	timeEnd = performance.now();

	timeSumSimple += timeEnd - timeStart;

  expect(sortedArray).toEqual(array.sort());
});

for (let j = 0; j < total; j++) {
	test('bubbleSort() random', () => {
		let array = [];

		for (let i = 0; i < 400; i++) {
			let randomNumber = Math.round(Math.random() * Math.floor(1500));
			array.push(randomNumber);
		}

		timeStart = performance.now();
		let sortedArray = bubbleSort.normal(array.slice())
		timeEnd = performance.now();

		timeSumNormal += timeEnd - timeStart;

	  expect(sortedArray).toEqual(array.sort((a, b) => a - b));
	});
}

for (let j = 0; j < total; j++) {
	test('bubbleSort() random', () => {
		let array = [];

		for (let i = 0; i < 10; i++) {
			let randomNumber = Math.round(Math.random() * Math.floor(1500));
			array.push(randomNumber);
		}

		timeStart = performance.now();
		let sortedArray = bubbleSort.optimized(array.slice())
		timeEnd = performance.now();

		timeSumOptimized += timeEnd - timeStart

	  expect(sortedArray).toEqual(array.sort((a, b) => a - b));
	});
}

afterAll(() => {
	let t0 = (timeSumNormal / total).toFixed(3);
	let t1 = (timeSumOptimized / total).toFixed(3);

	console.log("Average time for bubble sort (fixed): %d ms\nAverage time for bubble sort (unoptimized): %d ms\nAverage time for bubble sort (optimized): %d ms", timeSumSimple.toFixed(3), t0, t1);
});
