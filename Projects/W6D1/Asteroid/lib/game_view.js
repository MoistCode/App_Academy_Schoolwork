const Game = require('./game');
const MovingObjectFile = require('./moving_object');


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
