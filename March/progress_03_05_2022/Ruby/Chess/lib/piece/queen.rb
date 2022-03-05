require_relative 'piece.rb'
require_relative 'piece_modules/slideable.rb'
class Queen < Piece
  include Slideable
  def initialize(color, board, pos)
    super
  end

  def symbol
    '♛'.colorize(:color => color, :background => :light_black)
  end

end