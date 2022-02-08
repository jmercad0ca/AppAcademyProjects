require_relative "tile.rb"
require "byebug"
class Board
    attr_accessor :board_vals
    def initialize(puzzle)
        vals = read_data(puzzle)
        @board_vals = vals.map{|arr| arr.map{|val| Tile.new(val)}}
    end

    def []=(key, value)
        x, y = key
        @board_vals[y.to_i][x.to_i].value = value unless @board_vals[y.to_i][x.to_i].given
    end

    def [](key)
        x, y = key
        @board_vals[y.to_i][x.to_i].value
    end

    def read_data(puzzle)
        file = File.open("#{puzzle}")
        file_data = file.readlines.map(&:chomp)
        file.close
        file_data.map{|arr| arr.split('')}
    end
    
    def render
        @board_vals.each.with_index do |arr,y_idx|
            row = ""
            arr.each.with_index do |tile,x_idx|
                row += "#{tile} "
                row += "| " if (x_idx + 1) % 3 == 0 && x_idx != 8
            end
            puts row 
            puts "----------------------" if (y_idx + 1) % 3 == 0 && y_idx != 8
        end
    end

    def solved?
        check_rows && check_cols && check_squares
    end

    def verify(tiles)
        converted = tiles.map{|tile| tile.value}
        return false if converted.include?(".") || converted != converted.uniq
        true
    end

    def check_rows
        @board_vals.each do |row|
            return false if !verify(row)
        end
        true
    end

    def check_cols
        @board_vals.transpose.each do |col|
            return false if !verify(col)
        end
        true
    end

    def check_squares
        squares = Array.new(9){[]}
        @board_vals.each_slice(3).with_index do |rows,row_idx|
            rows.each do |row|
                row.each_slice(3).with_index do |col,col_idx|
                    square_idx = (row_idx * 3) + col_idx
                    squares[square_idx] += col
                end
            end
        end

        squares.each do |square|
            return false if !verify(square)
        end
        true
    end
end

