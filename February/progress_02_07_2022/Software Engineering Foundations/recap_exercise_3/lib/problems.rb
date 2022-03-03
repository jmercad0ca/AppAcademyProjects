require "Prime"

def no_dupes?(arr)
    arr.select{|ele| arr.count(ele) == 1}
end

def no_consecutive_repeats?(arr)
    (0...arr.length-1).each { |idx| return false if arr[idx] == arr[idx+1] }
    true
end

def char_indices(word)
    indices = Hash.new{|h,k| h[k] = []}
    word.each_char.with_index{|ele,idx| indices[ele] << idx}
    indices
end

def longest_streak(word)
    return word if word.length <= 1
    max_streak = 1
    max_char = ''
    streak = 1
    (0..word.length-1).each do |idx|
        if word[idx] == word[idx+1]
            streak += 1
            next
        end
        if streak >= max_streak
            max_streak = streak
            max_char = word[idx]
            streak = 1
        end
    end
    max_char * max_streak
end

def bi_prime?(num)
    factor_pairs = []
    (2..Math.sqrt(num).ceil).each do |factor|
        factor_pairs << [factor, num/factor] if num % factor == 0
    end
    factor_pairs.any?{|factors| both_prime?(factors)}
end

def both_prime?(factors)
    factors.all?{|factor| Prime.prime?(factor)}
end

ASCII_ALPH_START = 97
ALPH_LENGTH = 26
def vigenere_cipher(message,keys)
    vigenere = ''
    
    message.each_char.with_index do |c,idx|
        # convert characters using ascii codes (only lowercase, a = 97, z = 97+26)
        vigenere << ((c.ord+keys[idx%keys.length] - ASCII_ALPH_START) % ALPH_LENGTH + ASCII_ALPH_START).chr 
    end
    vigenere
end

def vowel_rotate(word)
    rotate = ''
    vowel_match = /[aeiou]/
    last_match = word[word.rindex(vowel_match)]
    word.each_char do |c|
        if c.match(vowel_match)
            rotate << last_match
            last_match = c
        else
            rotate << c
        end
    end
    rotate
end

class String
    def select(&prc)
        return '' if prc == nil
        selected_str = ''
        self.each_char do |c|
            selected_str << c if prc.call(c)
        end
        selected_str
    end

    def map!(&prc)
        (0..self.length-1).each do |idx|
            self[idx] = prc.call(self[idx],idx)
        end
        self
    end
end

def multiply(num_1,num_2)
    if num_1 == 0 || num_2 == 0
        return 0
    elsif num_1 == 1
        return num_2
    elsif num_1 == -1
        return -num_2
    elsif num_1 > 0
        return multiply(num_1-1,num_2) + num_2
    elsif num_1 < 0
        return multiply(num_1+1,num_2) - num_2    
    end
end

def lucas_sequence(num)
    if num == 0
        return []
    elsif num == 1
        return [2]
    elsif num == 2
        return [2,1]
    else
        res = lucas_sequence(num-1)
        return res + [res[res.length-1]+res[res.length-2]]
    end
end

def prime_factorization(num)
    return [num] if Prime.prime?(num)
    prime = 2
    while prime < num do
        if num % prime == 0
            return [prime] + prime_factorization(num/prime)
        end
        prime += 1
    end
end