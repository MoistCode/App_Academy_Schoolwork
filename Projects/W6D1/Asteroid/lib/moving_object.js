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
