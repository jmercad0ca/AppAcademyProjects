 def reverser(str, &prc)
    prc.call(str.reverse)
 end

 def word_changer(sentence, &prc)
    new_sentence = []
    sentence.split(" ").each{|word| new_sentence << prc.call(word)}
    new_sentence.join(" ")
 end

 def greater_proc_value(num, prc_1, prc_2)
    result_1 = prc_1.call(num)
    result_2 = prc_2.call(num)
    result_1 > result_2 ? result_1 : result_2
 end

 def and_selector(array, prc_1, prc_2)
    i_select(i_select(array,prc_1),prc_2)
 end

 def i_select(array, prc)
    new_arr = []
    array.each{|ele| new_arr << ele if prc.call(ele) }
    new_arr
end

# def and_selector(array, prc_1, prc_2)
#   selected = []

#   array.each do |el|
#     if prc_1.call(el) && prc_2.call(el)
#       selected << el
#     end
#   end

#   selected
# end

def alternating_mapper(array, prc_1, prc_2)
    new_arr = []
    array.each.with_index do |ele,idx|
        if idx.even?
            new_arr << prc_1.call(ele)
        else
            new_arr << prc_2.call(ele)
        end
    end
    new_arr
end
