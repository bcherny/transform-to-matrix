(function(root, factory) {
    if(typeof exports === 'object') {
        module.exports = factory();
    }
    else if(typeof define === 'function' && define.amd) {
        define('transform-to-matrix', [], factory);
    }
    else {
        root['transform-to-matrix'] = factory();
    }
}(this, function() {
var transformtomatrix;

transformtomatrix = (function() {
  var fns;
  return fns = {
    perspective: function(d) {
      return [[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, -1 / d, 1]];
    },
    rotate: function(a) {
      return fns.rotateZ(a);
    },
    rotateX: function(a) {
      return fns.rotate3d(1, 0, 0, a);
    },
    rotateY: function(a) {
      return fns.rotate3d(0, 1, 0, a);
    },
    rotateZ: function(a) {
      var c, n;
      c = Math.cos(a);
      n = Math.sin(a);
      return [[c, -n, 0], [n, c, 0]];
    },
    rotate3d: function(x, y, z, a) {
      var c, i, n, rs, s;
      s = x * x + y * y + z * z;
      c = Math.cos(a);
      n = Math.sin(a);
      i = 1 - c;
      rs = Math.sqrt(s) * n;
      return [[(x * x + (y * y + z * z) * c) / s, (x * y * i - z * rs) / s, (x * z * i + y * rs) / s, 0], [(x * y * i + z * rs) / s, (y * y + (x * x + z * z) * c) / s, (y * z * i - x * rs) / s, 0], [(x * z * i - y * rs) / s, (y * z * i + x * rs) / s, (z * z + (x * x + y * y) * c) / s, 0], [0, 0, 0, 1]];
    },
    scale: function(x, y) {
      return [[x, 0, 0], [0, y, 0]];
    },
    scaleX: function(x) {
      return fns.scale(x, 1);
    },
    scaleY: function(y) {
      return fns.scale(1, y);
    },
    scaleZ: function(z) {
      return fns.scale3d(1, 1, z);
    },
    scale3d: function(x, y, z) {
      return [[x, 0, 0, 0], [0, y, 0, 0], [0, 0, z, 0], [0, 0, 0, 1]];
    },
    skew: function(x, y) {
      return [[1, Math.tan(x), 0], [Math.tan(y), 1, 0]];
    },
    skewX: function(x) {
      return [[1, Math.tan(x), 0], [0, 1, 0]];
    },
    skewY: function(y) {
      return [[1, 0, 0], [Math.tan(y), 1, 0]];
    },
    translate: function(x, y) {
      return [[1, 0, x], [0, 1, y]];
    },
    translateX: function(x) {
      return fns.translate(x, 0);
    },
    translateY: function(y) {
      return fns.translate(0, y);
    },
    translateZ: function(z) {
      return fns.translate3d(0, 0, z);
    },
    translate3d: function(x, y, z) {
      return [[1, 0, 0, x], [0, 1, 0, y], [0, 0, 1, z], [0, 0, 0, 1]];
    }
  };
})();

    return transformtomatrix;
}));