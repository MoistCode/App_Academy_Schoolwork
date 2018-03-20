const MovingObjectFile = require('./moving_object');
const inherits = MovingObjectFile.inherits;
const MovingObject = MovingObjectFile.movingObject;

function Ship() {

}

Ship.inherits(MovingObject);

module.exports = Ship;
