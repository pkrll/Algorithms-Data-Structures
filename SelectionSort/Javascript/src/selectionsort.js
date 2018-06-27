
function selectionsort(array) {

	for (let i = 0; i < array.length; i++) {
		let minimumValue = array[i];
		let minimumIndex = i;

		for (var j = i+1; j < array.length; j++) {
			if (minimumValue > array[j]) {
				minimumValue = array[j];
				minimumIndex = j;
			}
		}

		let tmp = array[i];
		array[i] = minimumValue;
		array[minimumIndex] = tmp;
	}

	return array;
}

module.exports = selectionsort;
