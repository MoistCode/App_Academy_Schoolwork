
class Player {
  constructor(name) {
    this.name = name
  }

  let currentPlayer = undefined;

  _chooseFirstPlayer(player1, player2) {
    let num = this._getRandomInt;
    if (num === 1) {
      currentPlayer = player1;
    } else {
      currentPlayer = player2;
    }
  }

  _currentPlayer(player) {
    return currentPlayer
  }

  _switchPlayer() {

  }

  _getRandomInt() {
    return Math.floor(Math.random() * 2);
  }
}

module.exports = Player;
