mocha.setup('bdd')

transformToMatrix = window['transform-to-matrix']
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
	sliceStart = if transform.indexOf('3d') > -1 then 9 else 7
	div.style[annie.transform] = transform
	style = getComputedStyle(div)[annie.transform].slice sliceStart, -1
	nums = style.split ', '
	console.log getComputedStyle(div)[annie.transform], sliceStart
	nums[i] = round num for num, i in nums
	nums

describe '3D', ->
	
	describe '#rotate3d', ->
		it 'should compute the same matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.rotate3d(1, 0, 1, .5)
			browser = styleToArray 'rotate3d(1, 0, 1, .5rad)'
			expect(ttm).to.eql browser
	
	describe '#scale3d', ->
		it 'should compute the same matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.scale3d(5, 10, 20)
			browser = styleToArray 'scale3d(5, 10, 20)'
			expect(ttm).to.eql browser

	describe '#translate3d', ->
		it 'should compute the same matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.translate3d(10, 20, 30)
			browser = styleToArray 'translate3d(10px, 20px, 30px)'
			expect(ttm).to.eql browser

describe '2D', ->
	
	describe '#perspective', ->
		it 'should compute the same matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.perspective(10)
			browser = styleToArray 'perspective(10px)'
			expect(ttm).to.eql browser
	
	describe '#skew', ->
		it 'should compute the same matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.skew(.5, .7)
			browser = styleToArray 'skewX(.5rad) skewY(.7rad)'
			console.log ttm, browser
			expect(ttm).to.eql browser
	
	describe '#translate', ->
		it 'should compute the same matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.translate(10, 20)
			browser = styleToArray 'translate(10px, 20px)'
			expect(ttm).to.eql browser
	
	describe '#translateX', ->
		it 'should compute the same matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.translateX(10)
			browser = styleToArray 'translateX(10px)'
			expect(ttm).to.eql browser
	
	describe '#translateY', ->
		it 'should compute the same matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.translateY(10)
			browser = styleToArray 'translateY(10px)'
			expect(ttm).to.eql browser

runner = mocha.run()