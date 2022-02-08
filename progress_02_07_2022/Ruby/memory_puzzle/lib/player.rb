
class Player
    
  def prompt
    puts "Please enter the position of the card you'd like to flip (e.g., '2,3')"
    gets.chomp.split(",")
  end


end