require_relative 'piece.rb'
require_relative 'piece_modules/stepable.rb'
class King < Piece
  include Stepable
  def initialize(color, board, pos)
    super
  end

  def move_difs
    [:KING]
  end

  def symbol

  end

end