const Player = require('./player');

const readline = require('readline');

const reader = readline.createInterface({
  input: stdin,
  output: stdout
})

class HumanPlayer extends Player {
  constructor(name) {
    super(name);
  }

  _promptPlayerForName() {
    
  }

}

module.exports = HumanPlayer;
