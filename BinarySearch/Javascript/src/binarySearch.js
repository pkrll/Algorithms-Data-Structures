
const recursiveBinarySearch = (array, element) => {
	if (array.length == 0) return false;
	let middleIndex = Math.floor(array.length / 2);
  let middleValue = array[middleIndex];

	if (element > middleValue)
		return recursiveBinarySearch(array.slice(middleIndex + 1), element);
	if (element < middleValue)
		return recursiveBinarySearch(array.slice(0, middleIndex), element);
	if (element == middleValue)
		return true;

	return false;
}

const iterativeBinarySearch = (array, element) => {
	while (array.length > 0) {
		let middle = Math.floor(array.length / 2);

		if (array[middle] == element) return true;
		if (array[middle] < element) {
			array = array.slice(middle + 1);
		} else if (array[middle] > element) {
			array = array.slice(0, middle);
		}
	}

	return false;
}

exports.recursiveBinarySearch = recursiveBinarySearch;
exports.iterativeBinarySearch = iterativeBinarySearch;
