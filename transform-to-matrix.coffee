transformtomatrix = do ->

	fns =

		# perspective

		perspective: (d) ->

			[
				[1, 0, 0, 0]
				[0, 1, 0, 0]
				[0, 0, 1, 0]
				[0, 0, -1/d, 1]
			]

		# rotate

		rotate: (a) -> fns.rotateZ a
		rotateX: (a) -> fns.rotate3d 1, 0, 0, a
		rotateY: (a) -> fns.rotate3d 0, 1, 0, a
		rotateZ: (a) ->

			c = Math.cos a
			n = Math.sin a

			[
				[c, -n, 0]
				[n, c, 0]
			]

		rotate3d: (x, y, z, a) ->

			s = x*x + y*y + z*z
			c = Math.cos a
			n = Math.sin a
			i = 1 - c
			rs = Math.sqrt(s)*n
			[
				[(x*x + (y*y + z*z)*c)/s, (x*y*i - z*rs)/s, (x*z*i + y*rs)/s, 0]
				[(x*y*i + z*rs)/s, (y*y + (x*x + z*z)*c)/s, (y*z*i - x*rs)/s, 0]
				[(x*z*i - y*rs)/s, (y*z*i + x*rs)/s, (z*z + (x*x + y*y)*c)/s, 0]
				[0, 0, 0, 1]
			]

		# scale

		scale: (x, y) ->

			[
				[x, 0, 0]
				[0, y, 0]
			]

		scaleX: (x) -> fns.scale x, 1
		scaleY: (y) -> fns.scale 1, y
		scaleZ: (z) -> fns.scale3d 1, 1, z

		scale3d: (x, y, z) ->

			[
				[x, 0, 0, 0]
				[0, y, 0, 0]
				[0, 0, z, 0]
				[0, 0, 0, 1]
			]

		# skew

		skew: (x, y) ->

			[
				[1, Math.tan(x), 0]
				[Math.tan(y), 1, 0]
			]

		skewX: (x) ->

			[
				[1, Math.tan(x), 0]
				[0, 1, 0]
			]

		skewY: (y) ->

			[
				[1, 0, 0]
				[Math.tan(y), 1, 0]
			]

		# translate

		translate: (x, y) ->

			[
				[1, 0, x],
				[0, 1, y]
			]

		translateX: (x) -> fns.translate x, 0
		translateY: (y) -> fns.translate 0, y
		translateZ: (z) -> fns.translate3d 0, 0, z

		translate3d: (x, y, z) ->

			[
				[1, 0, 0, x],
				[0, 1, 0, y],
				[0, 0, 1, z],
				[0, 0, 0, 1]
			]