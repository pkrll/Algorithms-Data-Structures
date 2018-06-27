
function selectionSort(array) {

	for (let i = 0; i < array.length; i++) {
		let minValue = array[i];
		let minIndex = i;

		for (var j = i+1; j < array.length; j++) {
			if (array[minIndex] > array[j]) {
				minIndex = j;
			}
		}

		minValue = array[minIndex];
		let tmp = array[i];
		array[i] = minValue;
		array[minIndex] = tmp;
	}

	return array;
}

function stableSelectionSort(array) {

	for (let i = 0; i < array.length; i++) {
		let minValue = array[i];
		let minIndex = i;

		for (let j = i+1; j < array.length; j++) {
			if (array[minIndex] > array[j]) {
				minIndex = j;
			}
		}

		minValue = array[minIndex];
		let pushIndex = minIndex;
		while (pushIndex > i) {
			let tmp = array[pushIndex - 1];
			array[pushIndex] = tmp;
			pushIndex -= 1;
		}

		array[i] = minValue;
	}

	return array;
}

module.exports = {
	normal: selectionSort,
	stable: stableSelectionSort
};
