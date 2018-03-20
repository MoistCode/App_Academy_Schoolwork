// Function.prototype.myBind = function (thisArg) {
//   // thisArg = instance object breakfast
//   let fn = this;
//   let args = Array.from(arguments).slice(1);
//
//   if (args.length !== 0) {
//     return fn.call(thisArg, ...args);
//   }
//
//   return function() {
//     let callArgs = Array.from(arguments);
//     fn.apply(thisArg, callArgs);
//   };// breakfast.says; function, not an invocation
// };

Function.prototype.myBind = function (...args) {
  let fn = this;
  let allArgs = args.slice(1);
  let thisArg = args[0];

  if (allArgs.length !== 0) {
    return fn.call(thisArg, ...allArgs);
  }
  return function () {
    let callArgs = Array.from(arguments);
    fn.apply(thisArg, callArgs);
  };
};



class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}`);
    return true;
  }
  /*
    Cat.prototype.says = function(sound, person) {
      console.log(`${this.name} says ${sound} to ${person}`);
      return true;
    }
  */
}


const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

markov.says.myBind(breakfast, "meow", "me");
const aFunc = markov.says.myBind(breakfast);
console.log(aFunc);
aFunc("cow", "man");
