mocha.setup('bdd')

transformToMatrix = window['transform-to-matrix']
expect = chai.expect
div = document.getElementById 'test'
precision = 100000

# helpers
rotate = [
	[0, 4, 8, 12],
	[1, 5, 9, 13],
	[2, 6, 10, 14],
	[3, 7, 11, 15]
]

round = (mixed) ->
	Math.round(mixed*precision)/precision

rotateMatrix = (matrix) ->
	result = []
	for row, j in matrix
		for num, k in row
			result[rotate[j][k]] = round num
	result

styleToArray = (transform) ->
	div.style[annie.transform] = transform
	style = getComputedStyle(div)[annie.transform].slice 9, -1
	nums = style.split ', '
	nums[i] = round num for num, i in nums
	nums

describe 'transform-to-matrix', ->
	
	describe '#perspective', ->
		it 'should compute the same 3D matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.perspective(10)
			browser = styleToArray 'perspective(10px)'
			expect(ttm).to.eql browser
	
	describe '#rotate3d', ->
		it 'should compute the same 3D matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.rotate3d(1, 0, 1, .5)
			browser = styleToArray 'rotate3d(1, 0, 1, .5rad)'
			expect(ttm).to.eql browser
	
	describe '#scale3d', ->
		it 'should compute the same 3D matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.scale3d(5, 10, 20)
			browser = styleToArray 'scale3d(5, 10, 20)'
			expect(ttm).to.eql browser
	
	describe '#skew', ->
		it 'should compute the same 3D matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.skew(.5, .7)
			browser = styleToArray 'skewX(.5rad) skewY(.7rad)'
			console.log ttm, browser
			expect(ttm).to.eql browser
	
	describe '#translate3d', ->
		it 'should compute the same 3D matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.translate3d(10, 20, 30)
			browser = styleToArray 'translate3d(10px, 20px, 30px)'
			expect(ttm).to.eql browser

runner = mocha.run()