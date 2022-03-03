class Card
  attr_accessor :face_up, :value 
  def initialize(value)
    @value = value
    @face_up = false
  end

  def hide
    @face_up = false
  end

  def reveal 
    @face_up = true
  end

  def render
    @face_up ? @value : " "
  end

  def to_s
    @value
  end

  def ==(guess)
    @value == guess
  end
end