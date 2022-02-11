class Tile
    attr_accessor :bomb, :adjacent_bombs, :user_flagged, :explored 
    def initialize 
        @bomb = false 
        @adjacent_bombs = 0 
        @user_flagged = false 
        @explored = true 
    end 
    
    def render 
        if @bomb 
            return "X" 
        elsif @explored 
            adjacent_bombs == 0 ? "_" : "#{adjacent_bombs}" 
        elsif @user_flagged 
            return "F" 
        else 
            return "*" 
        end 
    end
end
