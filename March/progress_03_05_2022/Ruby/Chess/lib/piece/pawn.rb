class Pawn < Piece
  BLACK_START = 1
  WHITE_START = 6
  def initialize(color, board, pos)
    super
  end

  def moves
    row,col = self.pos
    available_moves = []
    if self.color == :black
      available_moves << [row+1,col] if self.board[[row+1,col]].nil?
      available_moves << [row+2,col] if self.board[[row+2,col]].nil? && at_start_row?
      available_moves << [row+1,col-1] if col-1 >= 0 && !self.board[[row+1,col-1]].nil? && self.board[[row+1,col-1]].color != self.color 
      available_moves << [row+1,col+1] if col+1 <= 7 && !self.board[[row+1,col+1]].nil? && self.board[[row+1,col+1]].color != self.color
    else
      available_moves << [row-1,col] if self.board[[row-1,col]].nil?
      available_moves << [row-2,col] if self.board[[row-2,col]].nil? && at_start_row?
      available_moves << [row-1,col-1] if col-1 >= 0 && !self.board[[row-1,col-1]].nil? && self.board[[row-1,col-1]].color != self.color
      available_moves << [row-1,col+1] if col+1 <= 7 && !self.board[[row-1,col+1]].nil? && self.board[[row-1,col+1]].color != self.color
    end
    available_moves
  end

  def symbol
    '♟'.colorize(:color => color, :background => :light_black)
  end

  def at_start_row?
    row = self.pos[0]
    (self.color == :black && row == BLACK_START) || (self.color == :white && row == WHITE_START)
  end

end