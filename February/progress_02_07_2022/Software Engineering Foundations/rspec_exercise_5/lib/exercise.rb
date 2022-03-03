def zip(*args)
    block = Array.new(args[0].length){[]}
    args.each do |array|
        array.each.with_index do |ele,idx|
            block[idx] << ele
        end
    end
    block
end

def prizz_proc(array, prc_1, prc_2)
    xored = []
    array.each { |ele| xored << ele if (prc_1.call(ele)) ^ (prc_2.call(ele)) }
    xored
end

def zany_zip(*args)
    max_length = 0
    args.each {|arr| max_length = arr.length if arr.length > max_length}    

    block = Array.new(max_length){Array.new(args.length)}
    args.each.with_index do |array,idx1|
        array.each.with_index do |ele,idx2|
            block[idx2][idx1] = ele
        end
    end
    block
end

def maximum(array, &prc)
    return nil if array.empty?
    max = 0
    max_idx = 9999999
    array.each.with_index do |ele,idx| 
        if prc.call(ele) >= max
            max = prc.call(ele)
            max_idx = idx
        end
    end
    array[max_idx] 
end

def my_group_by(array, &prc)
    group = Hash.new{|h,k| h[k] = []}
    array.each do |ele|
        group[prc.call(ele)] << ele
    end
    group
end

def max_tie_breaker(array, proc, &block)
    return nil if array.empty?
    
    block_res = max_res(array,block)
    return block_res[0] if block_res.length == 1
    max_res(block_res,proc)[0]
end

def max_res(array,proc)
    max = -999999999
    max_ele = []
    array.each.with_index do |ele,idx|
        res = proc.call(ele) 
        if res > max
            max = res
            max_ele = []
            max_ele << ele
        elsif res == max
            max_ele << ele
        else 
            next
        end        
    end
    max_ele
end

def silly_syllables(sentence)
    vowel_match = /[aeiou]/
    new_sentence = []
    sentence.split.each do |word|
        first_vowel = word.index(vowel_match)
        last_vowel = word.rindex(vowel_match)
        first_vowel != last_vowel ? new_sentence << word[first_vowel..last_vowel] : new_sentence << word
    end
    new_sentence.join(" ")
end