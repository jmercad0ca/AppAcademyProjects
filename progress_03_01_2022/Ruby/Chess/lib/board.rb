require_relative "piece/piece.rb"
class Board

  attr_reader :rows, :null_piece
  def initialize
    @null_piece = nil
    @rows = Array.new(8)
    (0...8).each do |row|
      if [0,1].include?(row)
        @rows[row] = Array.new(8){|col| Piece.new(:black,self,[row,col])}
      elsif [6,7].include?(row)
        @rows[row] = Array.new(8){|col| Piece.new(:white,self,[row,col])}
      else
        @rows[row] = Array.new(8){nil}
      end
    end
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
    raise "Cannot move to ending position! #{end_pos}" if end_pos.any?{|val| val > 7 || val < 0}
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
