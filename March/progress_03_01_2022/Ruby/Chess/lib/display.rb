require_relative 'board.rb'
require_relative 'cursor.rb'
class Display
  attr_accessor :board, :cursor

  def initialize(board)
    @board = board
    @cursor = cursor
  end

  def render

  end
end