def select_even_nums(array)
    array.select(&:even?)
end

def reject_puppies(doggies)
    doggies.reject{|dog| dog["age"]<=2}
end

def count_positive_subarrays(array)
    array.count{|nums| nums.sum > 0}
end

def aba_translate(word)
    new_word = ''
    word.each_char do |c|
        if c.match?(%r/[aeiouAEIOU]/)
            new_word << c + "b" + c
        else
            new_word << c
        end
    end
    new_word
end

def aba_array(words)
    words.map{ |word| aba_translate(word)}
end

