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

css = (matrix) ->
	result = []
	for row, j in matrix
		for num, k in row
			result[rotate[j][k]] = round num
	result

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
	style = getComputedStyle(div)[annie.transform].slice 9, -1
	nums = style.split ', '

	for num, i in nums
		nums[i] = round num

	nums

describe 'transform-to-matrix', ->
	
	describe '#perspective', ->
		it 'should compute the same 3D matrix as the browser', ->
			ttm = css transformToMatrix.perspective(10)
			browser = getStyle 'perspective(10px)'
			expect(ttm).to.eql browser
	
	describe '#rotate3d', ->
		it 'should compute the same 3D matrix as the browser', ->
			ttm = css transformToMatrix.rotate3d(1, 0, 1, .5)
			browser = getStyle 'rotate3d(1, 0, 1, .5rad)'
			expect(ttm).to.eql browser
	
	describe '#scale3d', ->
		it 'should compute the same 3D matrix as the browser', ->
			ttm = css transformToMatrix.scale3d(5, 10, 20)
			browser = getStyle 'scale3d(5, 10, 20)'
			expect(ttm).to.eql browser
	
	describe '#skew', ->
		it 'should compute the same 3D matrix as the browser', ->
			ttm = css transformToMatrix.skew(.5, .7)
			browser = getStyle 'skewX(.5rad) skewY(.7rad)'
			console.log ttm, browser
			expect(ttm).to.eql browser
	
	describe '#translate3d', ->
		it 'should compute the same 3D matrix as the browser', ->
			ttm = css transformToMatrix.translate3d(10, 20, 30)
			browser = getStyle 'translate3d(10px, 20px, 30px)'
			expect(ttm).to.eql browser

runner = mocha.run()