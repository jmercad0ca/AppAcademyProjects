require_relative "tile.rb"

class Board
    attr_accessor :board_vals, :size
    def initialize(size=9)
        @size = size
        @board_vals = Array.new(size){Array.new(size){Tile.new}}
    end
    
    
    def populate_bombs
        num_bombs = @size * @size / 8
        inserted_bombs = 0
        while inserted_bombs < num_bombs
            x_pos = rand(0...size)
            y_pos = rand(0...size)
            if !@board_vals[y_pos][x_pos].bomb
                @board_vals[y_pos][x_pos].bomb = true
                inserted_bombs += 1
            end
        end 
    end

    def populate_adjacent_bombs
        (0...size).each do |col|
            (0...size).each do |row|
                adjacent_positions = get_adjacent(col,row)
                adjacent_positions.each do |adjacent_position|
                    y,x = adjacent_position
                    @board_vals[col][row].adjacent_bombs += 1 if @board_vals[y][x].bomb
                end
            end
        end
    end

    def get_adjacent(x,y)
        [[x-1,y-1],[x-1,y],[x-1,y+1],[x,y-1],[x,y+1],[x+1,y-1],[x+1,y],[x+1,y+1]].select do |pairs|
            pairs.all?{|idx| (0...9).include?(idx)}
        end
    end


    def render
        x_axis = " "
        (0...@size).each{|idx| x_axis += " #{idx.to_s}"}
        puts x_axis
        @board_vals.each.with_index do |arr,idx1|
            y_axis = "#{idx1.to_s} "
            arr.each do |tile|
                y_axis += "#{tile.render} "
            end
            puts y_axis
        end
    end

    def self.test_game
        b = Board.new(9)
        b.populate_bombs
        b.populate_adjacent_bombs
        b.render
    end
end

