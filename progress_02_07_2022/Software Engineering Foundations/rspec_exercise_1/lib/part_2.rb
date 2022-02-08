def hipsterfy(word)
    raise "Argument should be a string" if !word.is_a?(String)
    last_vowel = word.rindex(%r/[aeiouAEIOU]/)
    if !last_vowel
        word
    elsif last_vowel == word.length-1
        word[0...word.length-1]
    else
        word[0...last_vowel] + word[last_vowel+1..-1]
    end
end

def vowel_counts(word)
    raise "Argument should be a string" if !word.is_a?(String)
    hash = Hash.new(0)
    word.each_char do |c| 
        hash[c.downcase] += 1 if c.match?(%r/[aeiouAEIOU]/)
    end
    hash
end

def caesar_cipher(msg,n)
    if !msg.is_a?(String) || !n.is_a?(Numeric)
        raise "First argument should be a string, second argument should be a number"
    end
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    msg.each_char.with_index do |c,idx|
        if c.match?(%r/[a-zA-Z]/)
            msg[idx] = alphabet[(alphabet.index(c)+n) % alphabet.length]
        end
    end
    msg
end

