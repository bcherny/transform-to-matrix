// Generated by CoffeeScript 1.6.3
(function() {
  var div, expect, precision, rotate2d, rotate3d, rotateMatrix, round, runner, styleToArray, transformToMatrix;

  mocha.setup('bdd');

  transformToMatrix = window['transform-to-matrix'];

  expect = chai.expect;

  div = document.getElementById('test');

  precision = 100000;

  rotate3d = [[0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15]];

  rotate2d = [[0, 2, 4], [1, 3, 5]];

  round = function(mixed) {
    return Math.round(mixed * precision) / precision;
  };

  rotateMatrix = function(matrix) {
    var j, k, num, result, rotate, row, _i, _j, _len, _len1;
    result = [];
    rotate = matrix.length === 4 ? rotate3d : rotate2d;
    for (j = _i = 0, _len = matrix.length; _i < _len; j = ++_i) {
      row = matrix[j];
      for (k = _j = 0, _len1 = row.length; _j < _len1; k = ++_j) {
        num = row[k];
        result[rotate[j][k]] = round(num);
      }
    }
    return result;
  };

  styleToArray = function(transform) {
    var i, num, nums, sliceStart, style, _i, _len;
    sliceStart = transform.indexOf('3d') > -1 ? 9 : 7;
    div.style[annie.transform] = transform;
    style = getComputedStyle(div)[annie.transform].slice(sliceStart, -1);
    nums = style.split(', ');
    console.log(getComputedStyle(div)[annie.transform], sliceStart);
    for (i = _i = 0, _len = nums.length; _i < _len; i = ++_i) {
      num = nums[i];
      nums[i] = round(num);
    }
    return nums;
  };

  describe('3D', function() {
    describe('#rotate3d', function() {
      return it('should compute the same matrix as the browser', function() {
        var browser, ttm;
        ttm = rotateMatrix(transformToMatrix.rotate3d(1, 0, 1, .5));
        browser = styleToArray('rotate3d(1, 0, 1, .5rad)');
        return expect(ttm).to.eql(browser);
      });
    });
    describe('#scale3d', function() {
      return it('should compute the same matrix as the browser', function() {
        var browser, ttm;
        ttm = rotateMatrix(transformToMatrix.scale3d(5, 10, 20));
        browser = styleToArray('scale3d(5, 10, 20)');
        return expect(ttm).to.eql(browser);
      });
    });
    return describe('#translate3d', function() {
      return it('should compute the same matrix as the browser', function() {
        var browser, ttm;
        ttm = rotateMatrix(transformToMatrix.translate3d(10, 20, 30));
        browser = styleToArray('translate3d(10px, 20px, 30px)');
        return expect(ttm).to.eql(browser);
      });
    });
  });

  describe('2D', function() {
    describe('#perspective', function() {
      return it('should compute the same matrix as the browser', function() {
        var browser, ttm;
        ttm = rotateMatrix(transformToMatrix.perspective(10));
        browser = styleToArray('perspective(10px)');
        return expect(ttm).to.eql(browser);
      });
    });
    describe('#skew', function() {
      return it('should compute the same matrix as the browser', function() {
        var browser, ttm;
        ttm = rotateMatrix(transformToMatrix.skew(.5, .7));
        browser = styleToArray('skew(.5rad, .7rad)');
        return expect(ttm).to.eql(browser);
      });
    });
    describe('#skewX', function() {
      return it('should compute the same matrix as the browser', function() {
        var browser, ttm;
        ttm = rotateMatrix(transformToMatrix.skewX(.5));
        browser = styleToArray('skewX(.5rad)');
        return expect(ttm).to.eql(browser);
      });
    });
    describe('#skewY', function() {
      return it('should compute the same matrix as the browser', function() {
        var browser, ttm;
        ttm = rotateMatrix(transformToMatrix.skewY(.5));
        browser = styleToArray('skewY(.5rad)');
        return expect(ttm).to.eql(browser);
      });
    });
    describe('#translate', function() {
      return it('should compute the same matrix as the browser', function() {
        var browser, ttm;
        ttm = rotateMatrix(transformToMatrix.translate(10, 20));
        browser = styleToArray('translate(10px, 20px)');
        return expect(ttm).to.eql(browser);
      });
    });
    describe('#translateX', function() {
      return it('should compute the same matrix as the browser', function() {
        var browser, ttm;
        ttm = rotateMatrix(transformToMatrix.translateX(10));
        browser = styleToArray('translateX(10px)');
        return expect(ttm).to.eql(browser);
      });
    });
    return describe('#translateY', function() {
      return it('should compute the same matrix as the browser', function() {
        var browser, ttm;
        ttm = rotateMatrix(transformToMatrix.translateY(10));
        browser = styleToArray('translateY(10px)');
        return expect(ttm).to.eql(browser);
      });
    });
  });

  runner = mocha.run();

}).call(this);
