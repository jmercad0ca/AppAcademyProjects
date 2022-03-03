require_relative 'game.rb'
require_relative 'display.rb'
class Game
  attr_accessor :board, :display, :players, :current_player

  def initialize(board, display, players)
    @board = board
    @display = display
    @players = players
    @current_player = @players[0]
  end

  def play

  end

  def notify_players

  end

  def swap_turn!

  end
end