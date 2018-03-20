/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 1);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports) {

Function.prototype.inherits = function(Parent) {
  function Surrogate() {}
  Surrogate.prototype = Parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

function MovingObject(obj) {
  this.pos = obj.pos;
  this.velocity = obj.velocity;
  this.radius = obj.radius;
  this.color = obj.color;
}
function randomizeColor() {
  const HEX_DIGITS = "0123456789ABCDEF";
  let color = "#";
    for (let i = 0; i < 6; i++) {
      color += HEX_DIGITS[Math.floor((Math.random() * 16))];
    }

  return color;
}

MovingObject.prototype.move = function(maxX, maxY) {
  let dx = (Math.random() * 2) - 1;
  let dy = (Math.random() * 2) - 1;
  this.color = randomizeColor();
  this.pos[0] = Math.abs((this.pos[0] + (dx * this.radius * 1)) % maxX);
  this.pos[1] = Math.abs((this.pos[1] + (dy * this.radius * 1)) % maxY);
};

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();
  ctx.arc (
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI * this.radius
  );
  ctx.fill();
};

MovingObject.prototype.isCollidedWith = function(otherMovingObject) {

};

module.exports = {
  movingObject: MovingObject,
  inherits: Function.inherits
};


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const Game = __webpack_require__(2);
const MovingObjectFile = __webpack_require__(0);


let space = document.getElementById('space');
let ctx = space.getContext('2d');

ctx.fillStyle = 'black';
ctx.fillRect(0, 0, 650, 650);
console.log(space);
console.log(ctx);
window.MovingObject = MovingObject;



let o1 = {
  pos: [325, 325],
  velocity: 7,
  radius: 20,
  color: 'green'
};
const obj1 = new MovingObjectFile.movingObject(o1);
obj1.draw(ctx);

window.setInterval(function() {
  // ctx.fillStyle = 'black';
  // ctx.fillRect(0, 0, 650, 650);
  obj1.move(650, 650);
  obj1.draw(ctx);
}, 1);


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const Asteroid = __webpack_require__(3);
const Ship = __webpack_require__(4);
const Bullet = __webpack_require__(5);

function Game() {

}

Game.prototype.step = function () {

};

Game.prototype.move = function () {

};

Game.prototype.checkCollisions = function () {

};

Game.prototype.draw = function (ctx) {

};


module.exports = Game;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const MovingObjectFile = __webpack_require__(0);
const inherits = MovingObjectFile.inherits;
const MovingObject = MovingObjectFile.movingObject;

function Asteroid() {

}

Asteroid.inherits(MovingObject);

module.exports = Asteroid;


/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

const MovingObjectFile = __webpack_require__(0);
const inherits = MovingObjectFile.inherits;
const MovingObject = MovingObjectFile.movingObject;

function Ship() {

}

Ship.inherits(MovingObject);

module.exports = Ship;


/***/ }),
/* 5 */
/***/ (function(module, exports, __webpack_require__) {

const MovingObjectFile = __webpack_require__(0);
const inherits = MovingObjectFile.inherits;
const MovingObject = MovingObjectFile.movingObject;

function Bullet() {

}

Bullet.inherits(MovingObject);

module.exports = Bullet;


/***/ })
/******/ ]);