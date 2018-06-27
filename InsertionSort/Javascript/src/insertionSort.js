
function swapInPlace(array, j, i) {
	let tmp = array[j];
	array[j] = array[i];
	array[i] = tmp;
}

function insertionSort(array) {
	for (let i = 1; i < array.length; i++) {
		for (let j = 0; j < i; j++) {
			if (array[j] > array[i]) {
				swapInPlace(array, j, i);
			}
		}
	}

	return array;
}

module.exports = insertionSort;
