mocha.setup('bdd')

transformToMatrix = window['transform-to-matrix']
assert = chai.assert
div = document.getElementById 'test'

# helpers
rotate = [
	[0, 4, 8, 12],
	[1, 5, 9, 13],
	[2, 6, 10, 14],
	[3, 7, 11, 15]
]

css = (matrix) ->
	result = []
	for row, j in matrix
		for num, k in row
			result[rotate[j][k]] = num
	'matrix3d(' + result.join(', ') + ')'

dot = (matrix) ->

	def = [
		[1, 0, 0, 0]
		[0, 1, 0, 0]
		[0, 0, 1, 0]
		[0, 0, 0, 1]
	]
	result = [[],[],[],[]]

	for row, j in matrix
		for num, k in row
			result[j][k] = num*def[j][0] + num*def[j][1] + num*def[j][2] + num*def[j][3]

	result

getStyle = (transform) ->
	div.style[annie.transform] = transform
	getComputedStyle(div)[annie.transform]

describe 'transform-to-matrix', ->
	
	describe '#perspective', ->
		it 'should compute the same 3D matrix as the browser', ->
			ttm = css dot(transformToMatrix.perspective(10))
			browser = getStyle 'perspective(10px)'
			assert.equal ttm, browser
	
	describe '#rotate', ->
		it 'should compute the same 3D matrix as the browser', ->
			ttm = css transformToMatrix.rotate(1, 0, 1, .5)
			browser = getStyle 'rotate3d(1, 0, 1, .5rad)'
			assert.equal ttm, browser
	
	describe '#perspective', ->
		it 'should compute the same 3D matrix as the browser', ->
			ttm = css transformToMatrix.perspective(10)
			browser = getStyle 'perspective(10px)'
			assert.equal ttm, browser
	
	describe '#perspective', ->
		it 'should compute the same 3D matrix as the browser', ->
			ttm = css transformToMatrix.perspective(10)
			browser = getStyle 'perspective(10px)'
			assert.equal ttm, browser
	
	describe '#perspective', ->
		it 'should compute the same 3D matrix as the browser', ->
			ttm = css transformToMatrix.perspective(10)
			browser = getStyle 'perspective(10px)'
			assert.equal ttm, browser

runner = mocha.run()