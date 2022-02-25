# PHASE 2
def convert_to_int(str)
  Integer(str)
  rescue 
    puts "Invalid argument to convert to Integer!" 
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise StandardError 
  else
    raise ArgumentError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue => error
    if error.to_s == 'StandardError'
      puts "Yum, Coffee! Please feed me a fruit!"
      retry 
    else
      puts "That's not a fruit :(."
    end
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise "Best Friends need to know each other for atleast 5 years!" if yrs_known < 5
    raise "Best Friends need a name & favorite past time!" if name.length <= 0 || fav_pastime.length <= 0
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


