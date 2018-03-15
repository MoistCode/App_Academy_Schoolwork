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

}

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

console.log(rangeRecursive(1, 17));

function sumRecRecursive(arr) {

}

function exponentRecursive(base, exp) {

}

function fibinacciRecursive(n) {

}

function deepDupRecursive(arr) {

}
