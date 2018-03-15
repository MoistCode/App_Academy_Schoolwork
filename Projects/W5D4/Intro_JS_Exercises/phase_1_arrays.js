Array.prototype.uniq = function(arr) {
  // Returns unique elements in the order that the came in
  let newArr = [];

  for(i = 0; i < arr.length; i++) {
    let unique = true;

    for(j = 0; j < newArr.length; j++) {
      if (arr[i] === newArr[j]) {
        unique = false;
      }
    }

    if (unique) {
      newArr.push(arr[i]);
    }

  }

  return newArr;
}

Array.prototype.twoSum = function(arr) {
  // Returns an array of position pairs in which the sum === 0

}

Array.prototype.transpose = function(arr1, arr2) {

}
