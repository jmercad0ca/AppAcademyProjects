require 'colorize'
class Simon
  COLORS = [:red, :blue, :green, :yellow]

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    puts "Welcome to Simon!"
    while !@game_over do
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each{|color| print color.to_s.colorize(color) + " "}
    sleep 3
    system("clear")
  end

  def require_sequence
    idx = 0
    while idx < @seq.length && !@game_over do
      puts "SCORE: #{@sequence_length - 1}"
      puts "Enter Color @ Position: #{idx}"
      guess = gets.chomp.downcase
      if guess != @seq[idx].to_s
        @game_over = true
        puts "MISS! Color @ Posiion #{idx} was #{@seq[idx]}"
        puts "Remaining Sequence was #{@seq[idx..-1]}"
      end
      idx += 1        
    end
  end

  def add_random_color
    @seq << COLORS[rand(4)]
  end

  def round_success_message
    puts "ROUND WON"
  end

  def game_over_message
    puts "GAME OVER"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__==$PROGRAM_NAME
  game = Simon.new
  game.play
end
