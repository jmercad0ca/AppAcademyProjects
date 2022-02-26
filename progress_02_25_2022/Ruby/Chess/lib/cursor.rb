require_relative 'board.rb'
class Cursor
  attr_accessor :board, :display, :players, :current_player

  def initialize(board)
    @board = board
    @display = display
    @selected = false
  end

  def get_input

  end

  def toggle_selected

  end

  def handle_key

  end

  def read_char

  end

  def update_pos

  end
end