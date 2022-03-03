class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def initialize
    @game_over = false
    @remaining_incorrect_guesses = 5
    @attempted_chars = []
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length,"_")
  end

  def self.random_word
    DICTIONARY.sample
  end

  def game_over=(bool)
    @game_over=bool
  end

  def attempted_chars
    @attempted_chars
  end

  def secret_word
    @secret_word
  end

  def guess_word
      @guess_word
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(guess)
    @attempted_chars.include?(guess)
  end

  def ask_user_for_guess
    print "Enter a char"
    guess = gets.chomp.downcase
    self.try_guess(guess)
  end

  def try_guess(guess)
    if self.already_attempted?(guess)
      puts "that char has already been guessed\n\n"
      return false
    else
      attempted_chars << guess
      if @secret_word.include?(guess)
        fill_indices(guess,get_matching_indices(guess))
      else
        @remaining_incorrect_guesses -= 1
      end
      return true
    end
  end

  def get_matching_indices(guess)
    match = []
    @secret_word.each_char.with_index {|ele,idx| match << idx if ele == guess}
    match
  end

  def fill_indices(guess,indices)
    indices.each{|idx| @guess_word[idx]=guess}
  end

  def win?
    if !@guess_word.include?("_")
      puts "YOU WIN"
      @game_over = true
      return true
    end
    return false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "YOU LOSE"
      @game_over = true
      return true
    end
    return false
  end


  def game_over?
    if win? || lose? 
      puts "The word was #{self.secret_word}" 
      return true
    else
      return false
    end
  end
end
