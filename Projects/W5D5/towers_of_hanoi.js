// Main portion of the game

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor() {
    // This is ran when the game is started
    // Creates the towers and disks
    this._createTowerAndDisks();
    // Display the tower and disks
    this._displayTowerAndDisks();
    const prompt = this._promptsUser.bind(this)
    prompt();
      // Prompt user
      // Update towers and disks
        // Notify of any illegal moves
      // Display towers and disks
      // Repeat until won
  }

  _createTowerAndDisks() {
    this.towersAndDisks = {
      0: [1,2,3],
      1: [],
      2: []
    };
  }

  _displayTowerAndDisks() {
    console.log(`Tower 1: ${this.towersAndDisks[0]}`);
    console.log(`Tower 2: ${this.towersAndDisks[1]}`);
    console.log(`Tower 3: ${this.towersAndDisks[2]}`);
  }

  _promptsUser() {
    if (this._isLoser()) {
      reader.question("Choose a source tower:\n", (sTower) => {
        reader.question("Choose a destination tower:\n", (dTower) => {
          let first = parseInt(sTower);
          let second = parseInt(dTower);
          first -= 1;
          second -= 1;
          if (this._isLegal(first, second)){
            this._updatesTowersAndDisks(first, second);
          } else {
            console.log(`Invalid move`)
          }
          this._displayTowerAndDisks();
          this._promptsUser();
        });
      });
    } else {
      return console.log('You win!')
    }
  }

  _updatesTowersAndDisks(source, destination) {
    let s = this.towersAndDisks[source].shift();
    this.towersAndDisks[destination].unshift(s);
  }

  _isLegal(source, destination) {
    if (source < 0 || source > 2 || destination < 0 || destination > 2) {
      return false
    } else if (this.towersAndDisks[source][0] === undefined){
      return false;
    } else if (this.towersAndDisks[destination][0] === undefined) {
      return true
    } else {
      return this.towersAndDisks[source][0] < this.towersAndDisks[destination][0]
    }
  }

  _isLoser() {
    console.log(this.towersAndDisks[2]);
    return this.towersAndDisks[2] !== [1,2,3];
  }

}

const game = new Game();
