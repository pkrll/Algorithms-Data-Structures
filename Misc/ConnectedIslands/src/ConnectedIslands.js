// Given a map represented as a 2d array with only 0’s and
// 1’s. An island is a group of connected 1’s. Find out how
// many distinct islands(can be rotated).
//
// eg:
// 1 1 0 0
// 1 0 0 0
// 0 0 0 1
// 0 0 1 1
//
// return 2.

function checkAndMarkAdjacent(array, row, col) {
	let rows = array.length;
	let cols = array[0].length;

	if (row >= rows || col >= cols) return;

	if (array[row][col] === 1) {
		array[row][col] = 9;

		if (col < cols)	checkAndMarkAdjacent(array, row, col + 1);
		if (row < rows)	checkAndMarkAdjacent(array, row + 1, col);
		if (row > 0)		checkAndMarkAdjacent(array, row - 1, col);
		if (col > 0)		checkAndMarkAdjacent(array, row, col - 1);

		if (col < cols && row < rows)
			checkAndMarkAdjacent(array, row + 1, col + 1);
		if (col < cols && row > 0)
			checkAndMarkAdjacent(array, row - 1, col + 1);
		if (col > 0 && row > 0)
			checkAndMarkAdjacent(array, row - 1, col - 1);
		if (col > 0 && row < rows)
			checkAndMarkAdjacent(array, row + 1, col - 1);
	}
}

function ConnectedIslands(array) {
	let rows = array.length;
	let cols = array[0].length;
	let sum = 0;

	for (let i = 0; i < rows; i++) {
		for (var j = 0; j < cols; j++) {

			if (array[i][j] === 1) {
				checkAndMarkAdjacent(array, i, j);
				sum += 1;
			}
		}
	}

	return sum;
}

module.exports = ConnectedIslands;
