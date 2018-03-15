newArr = new Array;
newStr = new String;
Array.prototype.bubbleSort = function(arr) {
  let unsorted = true;
  let arrCopy = arr.slice(0);

  while (unsorted) {
    let swapped = false;
    for(i = 0; i < arr.length - 1; i++) {
      if (arrCopy[i] > arrCopy[i+1]) {
        var greaterNum = arrCopy[i];
        var lesserNum = arrCopy[i+1];
        arrCopy[i] = lesserNum;
        arrCopy[i+1] = greaterNum;
        swapped = true;
      }
    }
    if (swapped === false) {
      return arrCopy;
    }
  }

}

// console.log(newArr.bubbleSort([5,2,51,4,5,6,7,32,5,76,3,4,42,34,6,7,2]));

String.prototype.substrings = function(str) {
  let counter = 1;
  let finalArr = [];

  while (counter <= str.length) {
    for(let i = 0; i < str.length; i++) {
      let strArr = [str[i]];
      for(let j = i+1; j <= str.length; j++) {
        if (strArr.length === counter) {
          finalArr.push(strArr);
          break;
        }
        strArr.push(str[j]);
      }
    }
    counter++;
  }
  console.log(finalArr);

}

console.log(newStr.substrings('string'));
