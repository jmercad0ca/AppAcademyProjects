require_relative "code"

class Mastermind
    
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code)
        puts "exact matches: "+@secret_code.num_exact_matches(code).to_s
        puts "near matches: "+@secret_code.num_near_matches(code).to_s
    end

    def ask_user_for_guess
        print 'Enter a code: '
        input = Code.from_string(gets.chomp)
        print_matches(input)
        @secret_code.num_exact_matches(input) == input.length ? true : false
    end
end
