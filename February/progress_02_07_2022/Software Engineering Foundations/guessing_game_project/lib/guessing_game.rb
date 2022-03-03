class GuessingGame

    def initialize(min, max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def ask_user
        p "Enter a number: "
        input = gets.chomp.to_i
        check_num(input)
    end

    def check_num(input)
        @num_attempts += 1
        if input == @secret_num
            @game_over = true
            puts 'you win'
        elsif input < @secret_num
            puts "too small"
        else
            puts "too big"
        end
    end
    
    def game_over?
        @game_over
    end

    def num_attempts
        @num_attempts
    end
end
 