 def partition(arr, num)
    if !arr.is_a?(Array) || !num.is_a?(Numeric)
        raise "First argument should be an array, then second argument should be a number" 
    end
    less = []
    great = [] 
    arr.each do |n| 
        n < num ? less << n : great << n
    end
    [less,great]
end

def merge(hash_1, hash_2)
    if !hash_1.is_a?(Hash) || !hash_2.is_a?(Hash)
        raise "Both arguments should be hashes" 
    end
    new_hash = {}
    hash_1.each do |k,v|
        new_hash[k] = v
    end
    hash_2.each do |k,v|
        new_hash[k] = v
    end
    new_hash
end

def censor(sentence, array)
    if !sentence.is_a?(String) || !array.is_a?(Array)
        raise "First argument should be an string, then second argument should be an array" 
    end
    words = sentence.split(" ")
    words.each do |word|
        word.gsub!(%r/[aeiouAEIOU]/,"*") if array.include?(word.downcase)
    end
    words.join(" ")
end

def power_of_two?(num)
    if !num.is_a?(Numeric)
        raise "Argument should be a number"
    end
    product = 1
    while product < num do
        product *= 2
    end
    product == num
end