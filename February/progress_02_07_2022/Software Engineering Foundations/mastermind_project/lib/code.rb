class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  attr_reader :pegs
  def initialize(pegs)
    raise "Not valid sequence" if !Code.valid_pegs?(pegs)
    @pegs = pegs.map(&:upcase)
  end

  def self.valid_pegs?(sequence)
    sequence.all?{|char| POSSIBLE_PEGS.has_key?(char.upcase)} 
  end

  def self.random(length)
    Code.new(Array.new(length){|ele| ele = POSSIBLE_PEGS.keys[rand(0..3)]})
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def ==(code)
    @pegs == code.pegs
  end

  def num_exact_matches(guess)
    matches = 0
    guess.pegs.each.with_index do |ele, idx|
      matches += 1 if ele == @pegs[idx]
    end
    matches
  end

  def num_near_matches(guess)
    matches = 0
    char_idx = Hash.new(0)
    @pegs.each do |char|
      char_idx[char] += 1
    end
    guess.pegs.each.with_index do |c,i|
      if char_idx[c] > 0
        matches += 1
      end
      char_idx[c] -= 1
    end
    matches - num_exact_matches(guess)
  end

end
