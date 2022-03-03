require 'require_all'
require_all 'piece'

class Board
  BLACK_START, BLACK_PAWN, WHITE_PAWN, WHITE_START = 0,1,6,7
  attr_reader :rows, :null_piece
  def initialize
    @null_piece = nil
    @rows = Array.new(8)
    (0...8).each do |row_idx|
      # if [0,1].include?(row)
      #   @rows[row] = Array.new(8){|col| Piece.new(:black,self,[row,col])}
      # elsif [6,7].include?(row)
      #   @rows[row] = Array.new(8){|col| Piece.new(:white,self,[row,col])}
      # else
      #   @rows[row] = Array.new(8){nil}
      # end
      if row_idx == BLACK_START
        @rows[row_idx] = initialize_nonpawn_row(:black,row_idx)
      elsif row_idx == BLACK_PAWN
        @rows[row_idx] = Array.new(8){|col| Pawn.new(:black,self,[row_idx,col])}
      elsif row_idx == WHITE_PAWN
        @rows[row_idx] = Array.new(8){|col| Pawn.new(:white,self,[row_idx,col])}
      elsif row_idx == WHITE_START
        @rows[row_idx] = initialize_nonpawn_row(:white,row_idx)
      else
        @rows[row_idx] = Array.new(8){nil}
      end
    end
  end

  def initialize_nonpawn_row(color, row_idx)
    left = [Rook.new(color,self,[row_idx,0]),Knight.new(color,self,[row_idx,1]),Bishop.new(color,self,[row_idx,2])]
    middle = [Queen.new(color,self,[row_idx,3]),King.new(color,self,[row_idx,4])]
    right = left.map do |piece|
      clone = piece.clone 
      clone.pos = [row_idx,7-piece.pos[1]]
      clone
    end.reverse
    left + middle + right 
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos,val)
    row, col = pos
    @rows[row][col] = val
  end

  def move_piece(start_pos,end_pos)
    raise "No piece at starting position! #{start_pos}" if self[start_pos] == nil
    # Debugger
    #raise "Cannot move to ending position! #{end_pos}" if end_pos.any?{|val| val > 7 || val < 0}
    raise "Invalid Move! #{end_pos}" if !self[start_pos].moves.include?(end_pos)
    self[start_pos],self[end_pos] = nil, self[start_pos]
    self[end_pos].pos = end_pos    
  end

  def valid_pos?

  end

  def add_piece

  end

  def checkmate?

  end

  def in_check?

  end

  def find_king

  end
  
  def find_king

  end

  def pieces

  end

  def dup

  end

end
