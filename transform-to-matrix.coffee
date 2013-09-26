# UMD (play nice with AMD, CommonJS, globals)
umd = (factory) ->
	if typeof exports is 'object'
		module.exports = factory
	else if typeof define is 'function' and define.amd
		define([], factory)
	else
		@['transform-to-matrix'] = factory

umd

	perspective: (d) ->

		[
			[1, 0, 0, 0]
			[0, 1, 0, 0]
			[0, 0, 1, 0]
			[0, 0, -1/d, 1]
		]

	rotate3d: (x, y, z, a) ->

		s = x*x + y*y + z*z
		c = Math.cos a
		n = Math.sin a
		i = 1 - c
		rs = Math.sqrt(s)*n

		[
			[(x*x + (y*y + z*z)*c)/s, (x*y*i - z*rs)/s, (x*z*i + y*rs)/s, 0]
			[(x*y*i + z*rs)/s,(y*y + (x*x + z*z)*c)/s, (y*z*i - x*rs)/s, 0]
			[(x*z*i - y*rs)/s, (y*z*i + x*rs)/s, (z*z + (x*x + y*y)*c)/s, 0]
			[0, 0, 0, 1]
		]

	scale3d: (x, y, z) ->

		[
			[x, 0, 0, 0]
			[0, y, 0, 0]
			[0, 0, z, 0]
			[0, 0, 0, 1]
		]

	skew: (x, y) ->

		[
			[1, Math.tan x, 0, 0]
			[Math.tan y, 1, 0, 0]
			[0, 0, 1, 0]
			[0, 0, 0, 1]
		]

	translate3d: (x, y, z) ->

		[
			[1, 0, 0, x],
			[0, 1, 0, y],
			[0, 0, 1, z],
			[0, 0, 0, 1]
		]