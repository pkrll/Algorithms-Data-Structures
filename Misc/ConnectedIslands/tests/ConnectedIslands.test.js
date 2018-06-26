const ConnectedIslands = require('../src/ConnectedIslands.js');

test('ConnectedIslands() 4x4 with 2 islands', () => {
	let array = [ [1,1,0,0],
								[1,0,0,0],
								[0,0,0,1],
								[0,0,1,1] ];

	let expected = 2;
  expect(ConnectedIslands(array)).toBe(expected);
});


test('ConnectedIslands() 4x4 with 2 islands (diagonal connection)', () => {
	let array = [ [1,0,0,0],
								[0,1,0,0],
								[0,0,1,0],
								[1,0,1,1] ];

	let expected = 2;
  expect(ConnectedIslands(array)).toBe(expected);
});

test('ConnectedIslands() 6x4 with 2', () => {
	let array = [ [1,1,0,0],
								[1,0,0,0],
								[0,0,0,1],
								[0,0,1,1],
								[0,0,1,1],
								[0,0,1,1]
							];

	let expected = 2;
  expect(ConnectedIslands(array)).toBe(expected);
});

test('ConnectedIslands() 6x4 with 2 zig-zag', () => {
	let array = [ [1,1,0,0],
								[1,0,0,0],
								[0,0,0,1],
								[0,0,1,0],
								[0,0,0,1],
								[0,0,1,0]
							];

	let expected = 2;
  expect(ConnectedIslands(array)).toBe(expected);
});

test('ConnectedIslands() 8x8 with 4 zig-zag', () => {
	let array = [ [0,0,0,0,0,1,0],
								[0,1,0,1,0,0,1],
								[1,0,1,1,1,0,0],
								[0,0,0,1,0,0,0],
								[0,1,0,0,0,0,1],
								[1,0,1,0,0,1,1]
							];

	let expected = 4;
  expect(ConnectedIslands(array)).toBe(expected);
});
