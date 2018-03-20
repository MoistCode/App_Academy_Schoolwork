function Surrogate () {}

Function.prototype.inherits = function (Child, Parent) {
  Surrogate.prototype = Parent.prototype;
  Child.prototype = new Surrogate();
  Child.prototype.constructor = Child;
};

Function.prototype.inherits2 = function (Parent) {
  Surrogate.prototype = Parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

function MovingObject () {}
MovingObject.prototype.sayHello = function () {
  console.log("You're in moving object");
};

function Ship () {}
Ship.inherits2(MovingObject);
Ship.prototype.sayShip = function () {
  console.log("You're in ship");
};

function Asteroid () {}
Asteroid.inherits2(MovingObject);
Asteroid.prototype.sayAsteroid = function () {
  console.log("You're in asteroid");
};


let ship1 = new Ship();
let asteroid1 = new Asteroid();
console.log(Object.getPrototypeOf(ship1));
console.log(Object.getPrototypeOf(asteroid1));
ship1.sayHello();
asteroid1.sayHello();
ship1.sayShip();
asteroid1.sayAsteroid();
ship1.sayAsteroid();
