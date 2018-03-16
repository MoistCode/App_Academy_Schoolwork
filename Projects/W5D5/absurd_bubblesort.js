const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps === true) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop)
    } else {
      sortCompletionCallback();
    }
  }
  outerBubbleSortLoop(true)
}

function askIfGreaterThan( num1, num2, callback ) {
  reader.question(`Is ${num1} greater than ${num2}?`, function(input) {
    if (input === 'yes') {
      return callback(true);
    } else {
      return callback(false);
    }
  });
}

function innerBubbleSortLoop( arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i+1], function(bool) {
      if (bool) {
        var x = arr[i];
        var y = arr[i+1];
        arr[i] = y;
        arr[i+1] = x;
        madeAnySwaps = true;
      }
      innerBubbleSortLoop( arr, i+1, madeAnySwaps, outerBubbleSortLoop )
    });
  } else {
    console.log(arr);
    outerBubbleSortLoop(madeAnySwaps);
  }
}


function sortCompletionCallback() {
  console.log("Arr is now sorted!\n");
  console.log("Closing reader...\n");
  reader.close();
}

absurdBubbleSort([4,2,5,3,4,1], sortCompletionCallback);
