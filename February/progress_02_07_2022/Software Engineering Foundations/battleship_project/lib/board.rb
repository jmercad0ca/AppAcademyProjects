class Board

    attr_reader :size
    def initialize(size)
        @grid = Array.new(size){Array.new(size){|ele| ele = :N}}
        @size = (size * size)
    end
    
    def [](idxs)
        row, col = idxs
        @grid[row][col]
    end

    def []=(idxs,val)
        row, col = idxs
        @grid[row][col] = val
    end

    def num_ships
        ships = 0
        @grid.each{|row| ships += row.count(:S)}
        ships
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts 'you sunk my battleship!'
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        num_ships = 0
        length = @grid.length
        while num_ships < (@size / 4.0).ceil
            coord = [rand(0...length),rand(0...length)]
            if self[coord] == :N
                self[coord] = :S
                num_ships += 1
            end
        end
    end

    def hidden_ships_grid
        hidden_grid = Array.new(@grid.length){Array.new(@grid.length){|ele| ele = :N}}
        @grid.each.with_index do |row, i|
            row.each.with_index do |col, j|
                hidden_grid[i][j] = col
                hidden_grid[i][j] = :N if col == :S
            end
        end
        hidden_grid
    end

    def self.print_grid(p_grid)
        p_grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end
    
    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
