class Tile
    attr_accessor :bomb, :adjacent_bombs, :user_flagged, :explored
    def initialize 
        @bomb = false 
        @adjacent_bombs = 0 
        @user_flagged = false 
        @explored = false
    end 
    
    def render 
        if @user_flagged 
            return "F"
        elsif !@explored 
            return "*"  
        elsif @bomb 
            return "X" 
        else
            adjacent_bombs == 0 ? "_" : "#{adjacent_bombs}" 
        end
    end

    def cheat_render
        return "X" if @bomb
        adjacent_bombs == 0 ? "_" : "#{adjacent_bombs}" 
    end
end
