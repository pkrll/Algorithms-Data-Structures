function linearSearch(array, element) {
	for (let i = 0; i < array.length; i++) {
		if (array[i] == element) return true;
	}

	return false;
}

function jumpsearch(array, element) {
	if (array.length == 0) return false;

	const size = array.length;
	const jump = Math.round(Math.sqrt(size));
	let index  = 0;

	while (index < size) {
		if (element == array[index]) return true;
		index += jump;

		if (element < array[index]) break;
	}

	return linearSearch(array.slice(index - jump, index), element);
}

module.exports = jumpsearch;
