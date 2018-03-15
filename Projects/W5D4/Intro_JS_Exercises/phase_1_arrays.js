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
newArr = new Array;
console.log(newArr.uniq([1,2,3,4,4,5,6,2,4,1,3,4,6,24]));

Array.prototype.twoSum = function(arr) {
  // Returns an array of position pairs in which the sum === 0
  let indexArr = [];
  for(i = 0; i < arr.length; i++) {
    for(j = i + 1; j < arr.length; j++) {
      if (arr[i] + arr[j] === 0) {
        var posArr = [];
        posArr.push(i);
        posArr.push(j);
        indexArr.push(posArr);
      }
    }
  }
  return indexArr
}

console.log(newArr.twoSum([1,2,3,6,2,4,-1,-1,-2,-4,-3,-2]));

Array.prototype.transpose = function(arr) {
   let mainArr = [];
   let counter = 0;
   while (counter < arr[0].length) {
    mainArr.push([]);
    counter ++;
   }
   for(i = 0; i < arr[0].length; i++){
     for(j = 0; j < arr.length; j++) {
       mainArr[i].push(arr[j][i]);
     }
   }
   return mainArr;
}

let transArr = [
  [1,2,3],
  [4,5,6],
  [7,8,9]
];

console.log(newArr.transpose(transArr));

// Solutions beneath

Array.prototype.uniq = function() {
  let uniqueArray = [];

  for (let i = 0; i < this.length; i++) {
    if (uniqueArray.indexOf(this[i]) === -1) {
      
      uniqueArray.push(this[i]);
    }
  }

  return uniqueArray;
}
