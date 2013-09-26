# transform-to-matrix

A tiny library to get 2/3D matricies from CSS3 transform functions. Fully covered by unit tests, with support for AMD, CommonJS, Node, and browser globals.

## example

```js
var getMatrix = require('transform-to-matrix'),
	matrix = getMatrix.translate3d(10, 50, 100)
	// ->
	// [
	// 	  [1, 0, 0, 10],
	//    [0, 1, 0, 50],
	//    [0, 0, 1, 100],
	//    [0, 0, 0, 1]
	// ]
```

## supported transforms

- perspective
- rotate
- rotateX
- rotateY
- rotateZ
- rotate3d
- scale
- scaleX
- scaleY
- scaleZ
- scale3d
- skew
- skewX
- skewY
- translate
- translateX
- translateY
- translateZ
- translate3d

# see

- https://developer.mozilla.org/en-US/docs/Web/CSS/transform
- http://www.w3.org/TR/css3-transforms/#mathematical-description
- http://inside.mines.edu/~gmurray/ArbitraryAxisRotation/#5.1