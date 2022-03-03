require_relative 'piece.rb'
require_relative 'piece_modules/stepable.rb'
class Knight < Piece
  include Stepable
  def initialize(color, board, pos)
    super
  end

  def move_difs
    [:KNIGHT]
  end

  def symbol

  end

end