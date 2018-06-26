'use strict'

function linearSearch(arr, element) {
	for (let i = 0; i < arr.length; i++) {
		if (element == arr[i]) return true;
	}

	return false;
}

module.exports = linearSearch;
