transformToMatrix = window.transform_to_matrix
expect = chai.expect
div = document.getElementById 'test'
precision = 100000

# helpers
rotate3d = [
	[0, 4, 8, 12]
	[1, 5, 9, 13]
	[2, 6, 10, 14]
	[3, 7, 11, 15]
]

rotate2d = [
	[0, 2, 4]
	[1, 3, 5]
]

round = (mixed) ->
	Math.round(mixed*precision)/precision

rotateMatrix = (matrix) ->
	result = []
	rotate = if matrix.length is 4 then rotate3d else rotate2d
	for row, j in matrix
		for num, k in row
			result[rotate[j][k]] = round num
	result

styleToArray = (transform) ->
	div.style[annie.transform] = transform
	style = getComputedStyle(div)[annie.transform].match(/\([^\)]+\)/)[0].slice 1, -1
	nums = style.split ', '
	nums[i] = round num for num, i in nums
	nums

test = (property, values) ->

	intValues = []
	intValues.push parseFloat(value, 10) for value in values

	describe '#'+property, ->
		it 'should compute the same matrix as the browser', ->
			actual = rotateMatrix transformToMatrix[property].apply(@, intValues)
			expected = styleToArray property + '(' + values.join(', ') + ')'
			expect(actual).to.eql expected

# run!

mocha.setup 'bdd'

describe '3D', ->

	test 'rotateX', ['.5rad']
	test 'rotateY', ['.5rad']
	test 'rotate3d', [1, 0, 1, '.5rad']
	test 'scale3d', [5, 10, 20]
	test 'translate3d', ['10px', '20px', '30px']

describe '2D', ->

	test 'perspective', ['10px']
	test 'rotate', ['.5rad']
	test 'rotateZ', ['.5rad']
	test 'scale', [2, 3]
	test 'scaleX', [2]
	test 'scaleY', [2]
	test 'scaleZ', [2]
	test 'skew', ['.5rad', '.7rad']
	test 'skewX', ['.5rad']
	test 'skewY', ['.5rad']
	test 'translate', ['10px', '20px']
	test 'translateX', ['10px']
	test 'translateY', ['10px']
	test 'translateZ', ['10px']

mocha.run()