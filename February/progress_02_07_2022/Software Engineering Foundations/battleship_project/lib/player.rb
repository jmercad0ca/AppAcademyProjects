class Player

    def get_move
        print 'enter a position '
        input = gets.chomp
        if input == "cheat"
            return input
        end
        input.split(" ").map(&:to_i)
    end
end
