require 'colorize'
class Piece
  attr_reader :color, :board
  attr_accessor :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def moves

  end

  def to_s

  end

  def empty?

  end

  def valid_moves

  end

  def move_into_check?(end_pos)

  end

end