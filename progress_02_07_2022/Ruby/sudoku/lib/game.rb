require_relative "board.rb"
require_relative "player.rb"
require 'byebug'

class Game

  attr_accessor :gameover, :board

  def initialize(puzzle)
    @board = Board.new(puzzle)
    @solved = false
    @player = Player.new
  end

  def play
    while !@solved do
      @board.render
      #debugger
      position = @player.prompt_position
      value = @player.prompt_value
      system("clear")
      @board[position] = value
      @solved = @board.solved?
    end
    win
  end

  def wait_next_turn
    puts "Press enter to continue."
    gets.chomp
  end

  def win
    system("clear") 
    @board.render
    puts "You've won!"
  end
  
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new("/Users/jordanmercado/Downloads/APP ACADEMY EXERCISES/Ruby/sudoku/lib/puzzles/sudoku1.txt")
  game.play
end