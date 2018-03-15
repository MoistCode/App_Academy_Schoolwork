newArr = new Array;

Array.prototype.bubbleSort = function(arr) {
  let unsorted = true;
  let arrCopy = arr.slice(0);

  while (unsorted) {
    for(i = 0; i < arr.length - 1; i++) {
      if (arrCopy[i] > arrCopy[i+1]) {
        var greaterNum = arrCopy[i];
        var lesserNum = arrCopy[i+1];
        arrCopy[i] = lesserNum;
        arrCopy[i+1] = greaterNum;
      }
      console.log(arrCopy);
    }

  }

}

newArr.bubbleSort([5,2,51,4,5,6,7,32,5,76,3,4,42,34,6,7,2]);

String.prototype.substrings = function(str) {

}
