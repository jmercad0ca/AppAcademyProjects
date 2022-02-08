
class Player
    
  def prompt_position
    puts "Please enter the position of the box to set (e.g., '2,3')"
    pos = gets.chomp
    if pos == '' || /[\d]{1},[\d]{1}/.match(pos).to_s != pos
      puts "Invalid coordinates."
      self.prompt_position
    else
      pos.split(",")
    end
  end

  def prompt_value
    puts "Please enter the value you'd like to set the box to (e.g., '1,2,3...')"
    val = gets.chomp 
    if val == '' || /[\d]{1}/.match(val).to_s != val
      puts "Invalid value."
      self.prompt_value
    else
      val
    end
  end

end