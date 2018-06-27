
function swapInPlace(array, j, i) {
	let tmp = array[j];
	array[j] = array[i];
	array[i] = tmp;
}

function insertionSort(array) {
	for (let i = 0; i < array.length; i++) {
		for (let j = i + 1; j > 0; j--) {
			if (array[j - 1] > array[j]) {
				swapInPlace(array, j, j - 1);
			}
		}
	}

	return array;
}

module.exports = insertionSort;
