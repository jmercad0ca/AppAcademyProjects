require_relative "tile.rb"
require "set"
require "byebug"

class Board
    attr_accessor :board_vals, :size, :bombs, :safe_tiles, :seen_adjacent_tiles 
    def initialize(size=9)
        @size = size
        @board_vals = Array.new(size){Array.new(size){Tile.new}}
        @bombs = Set.new
        @safe_tiles = Set.new
        @seen_adjacent_tiles = Set.new
    end
    
    
    def populate_bombs
        num_bombs = @size * @size / 8
        inserted_bombs = 0
        while inserted_bombs < num_bombs
            x_pos = rand(0...size)
            y_pos = rand(0...size)
            if !@board_vals[y_pos][x_pos].bomb
                @bombs.add(@board_vals[y_pos][x_pos])
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

    def populate_safe_tiles
        all_tiles = Set.new
        @board_vals.each{|row| row.each{|tile| all_tiles.add(tile)}}
        @safe_tiles = all_tiles - @bombs
    end

    def get_adjacent(x,y)
        [[x-1,y-1],[x-1,y],[x-1,y+1],[x,y-1],[x,y+1],[x+1,y-1],[x+1,y],[x+1,y+1]].select do |pairs|
            pairs.all?{|idx| (0...9).include?(idx)}
        end
    end

    def set_neighbor_clear(x,y)
         return if @board_vals[x][y].adjacent_bombs != 0
         get_adjacent_to_blanks(x,y)
         @seen_adjacent_tiles.map{|position| @board_vals[position[0]][position[1]].explored = true}
    end

    def get_adjacent_to_blanks(x,y)
        return if @board_vals[x][y].adjacent_bombs != 0
        adjacent_vals = get_adjacent(x,y).to_set - @seen_adjacent_tiles
        adjacent_vals.each do |adjacent_position|
            if @seen_adjacent_tiles.include?(adjacent_position)
                next
            else
                @seen_adjacent_tiles.add(adjacent_position)
                val_0, val_1 = adjacent_position
                if @board_vals[val_0][val_1].adjacent_bombs == 0
                    recursive_adjacent = get_adjacent(val_0,val_1)
                    recursive_adjacent.each { |position| get_adjacent_to_blanks(val_0,val_1) }
                end
            end
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

    def cheat_render
        x_axis = " "
        (0...@size).each{|idx| x_axis += " #{idx.to_s}"}
        puts x_axis
        @board_vals.each.with_index do |arr,idx1|
            y_axis = "#{idx1.to_s} "
            arr.each do |tile|
                y_axis += "#{tile.cheat_render} "
            end
            puts y_axis
        end
    end

    def flag_position(row,col)
        @board_vals[row][col].user_flagged = !@board_vals[row][col].user_flagged
    end

    def reveal_position(row,col)
        @board_vals[row][col].explored = true 
    end

    def check_board_solved
        @safe_tiles.all?{|tile| tile.explored}
    end

    def check_if_bomb_hit
        @bombs.any?{|tile| tile.explored}
    end

end

