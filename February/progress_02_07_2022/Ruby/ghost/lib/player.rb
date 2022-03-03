
class Player
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def guess
    gets.chomp
  end

  def alert_invalid_guess
    puts "Invalid guess.  Try again."
  end
end