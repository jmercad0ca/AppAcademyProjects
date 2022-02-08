require_relative "board.rb"
require_relative "player.rb"
require 'byebug'

class Game

  attr_accessor :gameover, :board

  def initialize
    @board = Board.new(4)
    @prev_guess_pos = nil
    @guessed_pos = nil
    @gameover = false
    @player = Player.new
  end

  def play
    @board.populate(@board.size)
    while !@gameover do
      @board.render
      #debugger
      @guessed_pos = @player.prompt
      system("clear")
      @board.flip(@guessed_pos)
      if @prev_guess_pos != nil
        @board.render
        correct_guess = make_guess
        wait_next_turn
        clear_guesses if !correct_guess
        @prev_guess_pos = nil
        @guessed_pos = nil
        system("clear")
      else
        @prev_guess_pos = @guessed_pos
      end
      @gameover = @board.won?
    end
    win
  end

  

  def wait_next_turn
    puts "Press enter to continue."
    gets.chomp
  end

  def make_guess
    match = @prev_guess_pos != @guessed_pos && @board[@prev_guess_pos] == @board[@guessed_pos] 
    puts "It's a match!" if match 
    puts "Try again." if !match
    match
  end

  def clear_guesses
    @board.flip(@guessed_pos)
    @board.flip(@prev_guess_pos)
  end

  def win 
    @board.render
    puts "You've won!"
  end
  
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end