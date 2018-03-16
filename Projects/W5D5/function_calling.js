Function.prototype.myBind = function(context) {
  // 'this' is undefined here when using arrow functions
  // Context is the object being passed through
  // We want to bind that context to 'this'
  // Using 'apply' or 'call', we can set 'this' but how do we get the
  // function that 'myBind' was called on? (i.e., 'turnOn')
  console.log(this);
  return () => {
    this.apply(context);
  }
};

class Lamp {
  constructor() {
    this.name = 'a lamp';
  }
}

const turnOn = function() {
  console.log('Turning on ' + this.name);
}

const lamp = new Lamp();

// turnOn(); // Should not work

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);

boundTurnOn();
myBoundTurnOn();
