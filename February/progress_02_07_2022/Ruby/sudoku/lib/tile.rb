require 'colorize'
class Tile
  attr_accessor :given, :value 
  def initialize(value)
    if value == "0"
      @value = "."
      @given = false
    else
      @value = value
      @given = true
    end
  end

  def to_s
    @given ? value.colorize(:blue) : value.colorize(:pink)
  end

  def ==(guess)
    @value == guess
  end
end