require_relative 'piece.rb'
require_relative 'piece_modules/slideable.rb'
class Rook < Piece
  include Slideable
  def initialize(color, board, pos)
    super
  end

  def move_dirs
    [:HORIZONTAL, :VERTICAL]
  end

  def symbol
    '♜'.colorize(:color => color, :background => :light_black)
  end


end