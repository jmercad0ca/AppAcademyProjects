require 'colorize'
class Tile
    attr_accessor :bomb, :adjacent_bombs, :user_flagged, :explored
    def initialize 
        @bomb = false 
        @adjacent_bombs = 0 
        @user_flagged = false 
        @explored = false
    end 
    
    def render 
        if @user_flagged && !@explored
            return "F".colorize(:green)
        elsif !@explored 
            return "*"  
        elsif @bomb 
            return "X".colorize(:red) 
        else
            adjacent_bombs == 0 ? "_".colorize(:blue) : colorize_numbers(adjacent_bombs) 
        end
    end

    def cheat_render
        return "X".colorize(:red)  if @bomb
        adjacent_bombs == 0 ? "_".colorize(:blue) : colorize_numbers(adjacent_bombs)
    end

    def colorize_numbers(num)
        if num == 1
            "#{num}".colorize(:light_cyan)
        elsif num == 2
            "#{num}".colorize(:yellow)
        elsif num == 3
            "#{num}".colorize(:magenta)
        else
            "#{num}".colorize(:light_red)
        end
    end
end
