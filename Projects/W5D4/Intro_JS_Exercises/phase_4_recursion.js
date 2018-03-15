// Write two versions; one of which utilizes recursion

// Iterative versions

function range(start, end) {
  let num = start;
  let finalArr = [];
  while (num <= end) {
    finalArr.push(num);
    num++
  }
  return finalArr;
}

// console.log(range(1, 17));

function sumRec(arr) {
  let sum = 0;
  for(let i = 0; i < arr.length; i++){
    sum = sum + arr[i];
  }

  return sum
}

// console.log(sumRec([1,2,3,4,5,6,7]));

function exponent(base, exp) {

}

function fibinacci(n) {

}

function deepDup(arr) {

}

// Recursive versions ========================================================

function rangeRecursive(start, end) {
  if ((start + 1) === end) {
    return [start, end]; // Base case
  }

  let arr = rangeRecursive(start+1, end);
  arr.unshift(start);
  return arr
}

// console.log(rangeRecursive(1, 17));

function sumRecRecursive(arr) {
  if (arr.length === 1){
    return arr[0];
  }
  let shiftedNum = arr.shift(1)
  let recurNum = sumRecRecursive(arr);
  return recurNum + shiftedNum
}

// console.log(sumRec([1,2,4,45,4,3,8,2,4]));
// console.log(sumRecRecursive([1,2,4,45,4,3,8,2,4]));

function exponentRecursive(base, exp) {

}

function fibinacciRecursive(n) {

}

function deepDupRecursive(arr) {

}
