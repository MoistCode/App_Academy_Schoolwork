const readline = require( 'readline' )

const reader = readline.createInterface ({
  input: process.stdin,
  output: process.stdout
});

function addNumbers( sum, numsLeft, completionCallback ) {

  if ( numsLeft > 0 ){
    reader.question("Please give me a number\n", function(input) {
      const res =   parseInt(input);
      sum += res;
      console.log(`Current Sum: ${sum}`);
      numsLeft -= 1;
      console.log(`Numbers Left: ${numsLeft}`);
      addNumbers( sum, numsLeft, completionCallback );
    });
  } else {
    completionCallback(sum);
  }
}

addNumbers(0, 3, sum => {
  console.log(`Total Sum: ${sum}`)
  reader.close();
});
