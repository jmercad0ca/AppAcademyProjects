require_relative "board.rb"
require_relative "tile.rb"
require "byebug"
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

    def run
        until @bomb_hit || @solved do
            @board.render
            @board.cheat_render
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
        puts "Would you like to explore or flag a position?"
        puts "Please enter E for explore or F for flag"
        pos = gets.chomp
        if pos == '' || (pos.upcase != 'E' && pos.upcase != 'F') 
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
        position = prompt_position
        if option == 'E'
            @board.set_neighbor_clear(position[0],position[1])
            @board.reveal_position(position[0],position[1])
        else
            @board.flag_position(position[0],position[1])
        end
    end
end

if __FILE__ == $PROGRAM_NAME
    game = Game.new
    game.run
end