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
  let total = 1;

  if (exp === 0) {
    return 1;
  }

  for(let i = 0; i < exp; i++) {
    total = total * base;
  }

  return total;
}

// console.log(exponent(5, 3));

function fibinacci(n) {
  let arr = [1,1];

  while (arr.length < n) {
    arr.push(arr[arr.length-1] + arr[arr.length-2]);
  }

  return arr
}

// console.log(fibinacci(7));

function deepDup(arr) {

}

function bsearch(arr, target) {

}

function mergesort(arr) {

}

function subsets(arr) {

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
  if (exp === 0) {
    return 1;
  }

  let result = (base * exponentRecursive(base, exp-1));
  return result;
}

// console.log(exponentRecursive(5, 3));

function fibinacciRecursive(n) {
  if (n === 2) {
    return [1,1];
  }
  if (n === 1) {
    return [1];
  }

  let recArr = fibinacciRecursive(n-1)
  recArr.push(recArr[recArr.length-1] + recArr[recArr.length-2]);
  return recArr;
}

// console.log(fibinacciRecursive(7));

function deepDupRecursive(arr) {

}

function bsearchRecrusive(arr) {

}

function mergesortRecursive(arr) {

}

function subsetsRecursive(arr) {

}
