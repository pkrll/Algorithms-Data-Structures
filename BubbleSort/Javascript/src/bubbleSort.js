
function swapInPlace(array, i, j) {
	let tmp = array[i];
	array[i] = array[j];
	array[j] = tmp;

	return true;
}

function bubbleSort(array) {

	for (let i = 0; i < array.length; i++) {
		for (let j = 0; j < array.length - 1; j++) {
			if (array[j] > array[j + 1]) {
				swapInPlace(array, j, j + 1);
			}
		}
	}

	return array;
}

function bubbleSortOptimized(array) {

	for (let i = 0; i < array.length; i++) {
		didSwap = false;

		for (let j = 0; j < array.length - 1; j++) {
			if (array[j] > array[j + 1]) {
				didSwap = swapInPlace(array, j, j + 1);
			}
		}

		if (didSwap == false) break;
	}

	return array;
}

module.exports = {
	normal: bubbleSort,
	optimized: bubbleSortOptimized
};
