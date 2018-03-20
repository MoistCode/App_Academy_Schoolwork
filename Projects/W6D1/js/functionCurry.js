Function.prototype.myCurry = function (numArgs) {
  let numbers = [];
  let thisArg = this;
  function _curriedFunc() {
    let args = Array.from(arguments);
    args.forEach(el => numbers.push(el));
    if (numbers.length === numArgs) {
      return thisArg.apply(null, numbers);
    } else {
      return _curriedFunc;
    }
  }
  return _curriedFunc;
};

Function.prototype.myCurry2 = function (numArgs) {
  let numbers = [];
  let thisArg = this;
  function _curriedFunc() {
    let args = Array.from(arguments);
    args.forEach(el => numbers.push(el));
    if (numbers.length === numArgs) {
      return thisArg.call(null, ...numbers);
    } else {
      return _curriedFunc;
    }
  }
  return _curriedFunc;
};

function multiplyMe() {
  let args = Array.from(arguments);
  return args.reduce(function (acc, el) {
    return acc * el;
  }, 1);
}

let multi = multiplyMe.myCurry(9);
console.log(multi(1,2)(3,4,5)(6)(7,8,9));

let multi2 = multiplyMe.myCurry2(9);
console.log(multi2(1,2)(3,4,5)(6)(7,8,9));
