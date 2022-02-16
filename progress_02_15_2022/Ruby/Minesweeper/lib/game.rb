require_relative "board.rb"
require_relative "tile.rb"
require "byebug"
require "yaml"
class Game

    attr_accessor :board, :game_over, :solved
    def initialize
        @board = Board.new(9)
        @board.populate_bombs
        @board.populate_adjacent_bombs
        @board.populate_safe_tiles
        @bomb_hit = false
        @solved = false
    end

    def save
        save = File.open("game.yml", "w") { |file| file.write(self.to_yaml) }
        puts "Game is saved.  Restart Minesweeper to resume later."
        exit 100
    end

    def run
        until @bomb_hit || @solved do
            @board.render
            execute_move
            system("clear")
            @bomb_hit = true if @board.check_if_bomb_hit
            @solved = true if @board.check_board_solved
        end
        @board.render
        check_win
    end

    def check_win
        puts "GAME OVER. Bomb was hit." if @bomb_hit
        puts "WIN! Board was solved." if @solved
    end

    def explore_or_flag
        puts "Please enter E for explore, F for flag or S for save and continue later."
        pos = gets.chomp
        if pos == '' || (pos.upcase != 'E' && pos.upcase != 'F' && pos.upcase != 'S') 
            puts 'Invalid option.'
            self.explore_or_flag
        else
            pos.upcase
        end
    end

    def prompt_position
        puts "Please enter the position of the tile to set (e.g., '2,3')"
        pos = gets.chomp
        if pos == '' || /[\d]{1},[\d]{1}/.match(pos).to_s != pos
            puts "Invalid coordinates."
            self.prompt_position
        else
            pos.split(",").map{|coord| coord.to_i}
        end
    end


    def execute_move
        option = explore_or_flag
        self.save if option == 'S'
        position = prompt_position
        if option == 'E'
            @board.set_neighbor_clear(position[0],position[1])
            @board.reveal_position(position[0],position[1])
        else option
            @board.flag_position(position[0],position[1])
        end
    end
end

if __FILE__ == $PROGRAM_NAME
    game = Game.new
    puts "Welcome to Minesweeper!"
    puts "Enter L to load saved game or any other key to start a new game"
    if gets.chomp.upcase == "L"
        begin 
            game = YAML.load(File.read("game.yml"))
        rescue Exception
            puts "No previously saved game.  Starting new game."
            game = Game.new
        end
    else
        game = Game.new
    end
    game.run
end