require_relative "card.rb"
class Board

    attr_accessor :board_vals, :size
    def initialize(size=6)
        @size = size
        @board_vals = Array.new(size){Array.new(size)}
    end

    def [](coord)
        x, y = coord
        @board_vals[y.to_i][x.to_i].value
    end

    def populate(size)
        num_pairs = size * size / 2
        (0...num_pairs).each do |num|
            rand_char = rand(65..90).chr
            inserted_vals = 0
            while inserted_vals != 2 do
                x_pos = rand(0...size)
                y_pos = rand(0...size)
                if @board_vals[y_pos][x_pos] == nil
                    @board_vals[y_pos][x_pos] = Card.new(rand_char)
                    inserted_vals += 1
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
            arr.each do |card|
                y_axis += "#{card.render} "
            end
            puts y_axis
        end
    end

    def won?
        @board_vals.all? do |arr|
            arr.all?{|card| card.face_up}
        end
    end

    def flip(guessed_pos)
        x_pos, y_pos = guessed_pos
        card = @board_vals[y_pos.to_i][x_pos.to_i]
        card.face_up ? card.hide : card.reveal
        card.value
    end

end