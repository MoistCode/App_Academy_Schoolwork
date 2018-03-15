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

// newArr.myEach(testArr, printNum);

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

// console.log(newArr.myMap(testArr, timesTwo));

Array.prototype.myReduce = function(arr, cb, initial = '') {
  if (initial === '') {
    let initial = arr[0];
    for(i = 1; i < arr.length; i++) {
      initial = cb(initial, arr[i]);
    }
    return initial;
  }
  if (initial !== '') {
    for(i = 0; i < arr.length; i++) {
      initial = cb(initial, arr[i]);
      return initial;
    }
  }

}

let timesV2 = function(num1, num2) {
  return num1 * num2
}

console.log(newArr.myReduce(testArr, timesV2));
