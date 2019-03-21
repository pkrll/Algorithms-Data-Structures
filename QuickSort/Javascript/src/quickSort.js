function swap(array, i, j) {
	let element = array[i];
	array[i] = array[j];
	array[j] = element;
}

function partition(array, start, end) {
	let i = start + 1;
	let p = array[start];

	for (let j = i; j <= end; j++) {
		if (array[j] < p) {
			swap(array, j, i);
			i += 1;
		}
	}

	swap(array, start, i-1);

	return (i-1);
}

function quickSort(array, start, end) {
	if (start < end) {
		const pivotPosition = partition(array, start, end);
		quickSort(array, start, pivotPosition - 1);
		quickSort(array, pivotPosition + 1, end);
	}
}

module.exports = quickSort;
