require_relative "player.rb"
require 'set'
require 'byebug'

class Game
  GHOST = "GHOST"

  attr_accessor :fragment

  def initialize
    @players = []
    @fragment = ""
    file = File.open("dictionary.txt")
    file_data = file.readlines.map(&:chomp)
    file.close
    @dictionary = file_data.to_set
    @losses = {}
  end

  def play_round
    turn = true
    while turn do
      turn = take_turn(current_player)
      if !turn
        @losses[current_player] += 1
        @fragment = ""
        if @losses[current_player] == 5
          puts "#{current_player.name} is out!"
          @players.shift 
        end
        next_player!
      else
        @fragment = turn
        next_player! 
      end
    end
  end

  def current_player
    @players[0]
  end

  def previous_player
    @players[1]
  end

  def next_player!
    @players.push(@players.shift)
  end

  def take_turn(player)
    puts player.name + "'s turn.  Current fragment: #{@fragment}. Enter guess."
    guess_letter = player.guess.downcase
    while !valid_play?(guess_letter) do
      player.alert_invalid_guess
      guess_letter = player.guess
    end
    guess_word = @fragment + guess_letter
    return false if @dictionary.include?(guess_word) || @dictionary.none?{|word| word.start_with?(guess_word)}
    guess_word
  end

  def valid_play?(string)
    return false if string.length != 1 || !string.match?(/[a-zA-Z]/)
    true
  end

  def initialize_players(player_count=2)
    (1..player_count).each do |num|
      new_player = Player.new("Player_#{num}") 
      @players.push(new_player)
      @losses[new_player] = 0
    end
  end

  def display_standings
    puts "STANDINGS:"
    @losses.each do |player,losses|
      puts "#{player.name}: #{GHOST[0...losses]}"
    end
  end

  def run
    puts "Welcome to GHOST.  Enter how many players will be playing."
    initialize_players(gets.chomp.to_i)
    while @players.length > 1 do
      play_round
      display_standings
    end
    puts "GAME OVER!"
    puts "#{current_player.name} wins!"
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.run
end