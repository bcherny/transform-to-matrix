// Generated by CoffeeScript 1.6.3
(function() {
  var assert, css, div, dot, getStyle, rotate, runner, transformToMatrix;

  mocha.setup('bdd');

  transformToMatrix = window['transform-to-matrix'];

  assert = chai.assert;

  div = document.getElementById('test');

  rotate = [[0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15]];

  css = function(matrix) {
    var j, k, num, result, row, _i, _j, _len, _len1;
    result = [];
    for (j = _i = 0, _len = matrix.length; _i < _len; j = ++_i) {
      row = matrix[j];
      for (k = _j = 0, _len1 = row.length; _j < _len1; k = ++_j) {
        num = row[k];
        result[rotate[j][k]] = num;
      }
    }
    return 'matrix3d(' + result.join(', ') + ')';
  };

  dot = function(matrix) {
    var def, j, k, num, result, row, _i, _j, _len, _len1;
    def = [[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]];
    result = [[], [], [], []];
    for (j = _i = 0, _len = matrix.length; _i < _len; j = ++_i) {
      row = matrix[j];
      for (k = _j = 0, _len1 = row.length; _j < _len1; k = ++_j) {
        num = row[k];
        result[j][k] = num * def[j][0] + num * def[j][1] + num * def[j][2] + num * def[j][3];
      }
    }
    return result;
  };

  getStyle = function(transform) {
    div.style[annie.transform] = transform;
    return getComputedStyle(div)[annie.transform];
  };

  describe('transform-to-matrix', function() {
    describe('#perspective', function() {
      return it('should compute the same 3D matrix as the browser', function() {
        var browser, ttm;
        ttm = css(dot(transformToMatrix.perspective(10)));
        browser = getStyle('perspective(10px)');
        return assert.equal(ttm, browser);
      });
    });
    describe('#rotate', function() {
      return it('should compute the same 3D matrix as the browser', function() {
        var browser, ttm;
        ttm = css(transformToMatrix.rotate(1, 0, 1, .5));
        browser = getStyle('rotate3d(1, 0, 1, .5rad)');
        return assert.equal(ttm, browser);
      });
    });
    describe('#perspective', function() {
      return it('should compute the same 3D matrix as the browser', function() {
        var browser, ttm;
        ttm = css(transformToMatrix.perspective(10));
        browser = getStyle('perspective(10px)');
        return assert.equal(ttm, browser);
      });
    });
    describe('#perspective', function() {
      return it('should compute the same 3D matrix as the browser', function() {
        var browser, ttm;
        ttm = css(transformToMatrix.perspective(10));
        browser = getStyle('perspective(10px)');
        return assert.equal(ttm, browser);
      });
    });
    return describe('#perspective', function() {
      return it('should compute the same 3D matrix as the browser', function() {
        var browser, ttm;
        ttm = css(transformToMatrix.perspective(10));
        browser = getStyle('perspective(10px)');
        return assert.equal(ttm, browser);
      });
    });
  });

  runner = mocha.run();

}).call(this);
