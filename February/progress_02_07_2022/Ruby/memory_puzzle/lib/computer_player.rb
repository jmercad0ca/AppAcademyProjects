
class ComputerPlayer
    
    attr_accessor :guesses
    def initialize
        @guesses = Hash.new{|h,k| h[k] = []}
        
    end
    
end