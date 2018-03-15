newArr = new Array;
let testArr = [1,2,3,4,5,6,7];

Array.prototype.myEach = function(arr, cb) {
  for(i = 0; i < arr.length; i++) {
    cb(arr[i]);
  }
  return undefined;
}

let printNum = function(num) {
  console.log(num)
}

newArr.myEach(testArr, printNum);

Array.prototype.myMap = function(arr, cb) {
  let arrCopy = [];

  for(i = 0; i < arr.length; i ++) {
    arrCopy.push(cb(arr[i]));
  }

  return arrCopy;
}

let timesTwo = function(num) {
  return (num * 2);
}

console.log(newArr.myMap(testArr, timesTwo));

Array.prototype.myReduce
