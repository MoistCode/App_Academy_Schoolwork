const MovingObjectFile = require('./moving_object');
const inherits = MovingObjectFile.inherits;
const MovingObject = MovingObjectFile.movingObject;

function Bullet() {

}

Bullet.inherits(MovingObject);

module.exports = Bullet;
