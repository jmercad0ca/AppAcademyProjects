// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  var Piece = require("./piece");
}
// DON'T TOUCH THIS CODE

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = new Array(8).fill(undefined).map(() => new Array(8).fill(undefined));
  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");
  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  return (pos[0] < 8 && pos[0] >= 0) && (pos[1] < 8 && pos[1] >= 0)
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (!this.isValidPos(pos)){
    throw new Error("Not valid pos!");
  }
  let [y,x] = pos;
  return this.grid[y][x];
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  return this.getPiece(pos) !== undefined && this.getPiece(pos).color === color;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return this.getPiece(pos) !== undefined;
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip=[]){
  let [difY,difX] = dir;
  let [posY,posX] = pos;
  let nextPos = [posY + difY, posX + difX]
  if (!this.isValidPos(nextPos) || this.getPiece(nextPos) === undefined){
    return [];
  }
  else if (this.getPiece(nextPos).color === color){
    return piecesToFlip;
  }
  else {
    piecesToFlip.push(nextPos);
    return this._positionsToFlip(nextPos,color,dir,piecesToFlip)
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.getPiece(pos) !== undefined){
    return false;
  }
  let valid = false;
  Board.DIRS.forEach((dir) => {
    if (this._positionsToFlip(pos,color,dir).length > 0){
      valid = true;
    }
  });
  return valid;
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos,color)){
    throw new Error("Invalid move!");
  }
  this.grid[pos[0]][pos[1]] = new Piece(color);

  let positionsToFlip = []
  Board.DIRS.forEach((dir) => {
    positionsToFlip = positionsToFlip.concat(this._positionsToFlip(pos, color, dir))
  });
  
  positionsToFlip.forEach((posFlip) => {
    this.getPiece(posFlip).flip();
  })
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let valMoves = [];
  for (let y = 0; y < this.grid.length; y++){
    for (let x = 0; x < this.grid[0].length; x++){
      if (this.validMove([y,x],color)){
        valMoves = valMoves.concat([[y,x]]);
      }
    }
  }
  return valMoves;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length > 1;
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return this.validMoves("white").length === 0 && this.validMoves("black").length === 0
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};


// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  module.exports = Board;
}
// DON'T TOUCH THIS CODE