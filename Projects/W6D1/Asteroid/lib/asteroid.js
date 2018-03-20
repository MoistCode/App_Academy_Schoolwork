const MovingObjectFile = require('./moving_object');
const inherits = MovingObjectFile.inherits;
const MovingObject = MovingObjectFile.movingObject;

function Asteroid() {

}

Asteroid.inherits(MovingObject);

module.exports = Asteroid;
