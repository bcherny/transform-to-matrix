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
	div.style[annie.transform] = transform
	style = getComputedStyle(div)[annie.transform].match(/\([^\)]+\)/)[0].slice 1, -1
	nums = style.split ', '
	nums[i] = round num for num, i in nums
	nums

describe '3D', ->
	
	describe '#rotateX', ->
		it 'should compute the same matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.rotateX(.5)
			browser = styleToArray 'rotateX(.5rad)'
			expect(ttm).to.eql browser
	
	describe '#rotateY', ->
		it 'should compute the same matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.rotateY(.5)
			browser = styleToArray 'rotateY(.5rad)'
			expect(ttm).to.eql browser
	
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

	# rotate
	
	describe '#rotate', ->
		it 'should compute the same matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.rotate(.5)
			browser = styleToArray 'rotate(.5rad)'
			expect(ttm).to.eql browser
	
	describe '#rotateZ', ->
		it 'should compute the same matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.rotateZ(.5)
			browser = styleToArray 'rotateZ(.5rad)'
			expect(ttm).to.eql browser

	# scale
	
	describe '#scale', ->
		it 'should compute the same matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.scale(2, 3)
			browser = styleToArray 'scale(2, 3)'
			expect(ttm).to.eql browser
	
	describe '#scaleX', ->
		it 'should compute the same matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.scaleX(2)
			browser = styleToArray 'scaleX(2)'
			expect(ttm).to.eql browser
	
	describe '#scaleY', ->
		it 'should compute the same matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.scaleY(2)
			browser = styleToArray 'scaleY(2)'
			expect(ttm).to.eql browser
	
	describe '#scaleZ', ->
		it 'should compute the same matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.scaleZ(2)
			browser = styleToArray 'scaleZ(2)'
			expect(ttm).to.eql browser

	# skew
	
	describe '#skew', ->
		it 'should compute the same matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.skew(.5, .7)
			browser = styleToArray 'skew(.5rad, .7rad)'
			expect(ttm).to.eql browser
	
	describe '#skewX', ->
		it 'should compute the same matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.skewX(.5)
			browser = styleToArray 'skewX(.5rad)'
			expect(ttm).to.eql browser
	
	describe '#skewY', ->
		it 'should compute the same matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.skewY(.5)
			browser = styleToArray 'skewY(.5rad)'
			expect(ttm).to.eql browser

	# translate
	
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
	
	describe '#translateZ', ->
		it 'should compute the same matrix as the browser', ->
			ttm = rotateMatrix transformToMatrix.translateZ(10)
			browser = styleToArray 'translateZ(10px)'
			expect(ttm).to.eql browser

runner = mocha.run()