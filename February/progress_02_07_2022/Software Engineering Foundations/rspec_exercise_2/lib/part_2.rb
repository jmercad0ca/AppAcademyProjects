 def palindrome?(str)
    return true if str.length <= 1
    left = 0
    right = str.length-1
    while left < right do
        return false if str[left] != str[right]
        left += 1
        right -= 1
    end
    true
 end

 def substrings(str)
    subs = []
    (0...str.length).each do |idx|
        (idx..str.length-1).each do |i|
            subs << str[idx..i]
        end
    end
    subs
end

def palindrome_substrings(str)
    subs = substrings(str)
    subs.select{ |sub| palindrome?(sub) && sub.length > 1}
end

# def palindrome_substrings(str)
#     total_palindromes = []
#     (0...str.length).each do |idx|
#         total_palindromes << expand(str,idx,idx+1) 
#         total_palindromes << expand(str,idx-1,idx+1)
#     end
#     total_palindromes.flatten
# end

# def expand(str, j, k)
#     palindromes = []
#     while j >= 0 && k < str.length
#         break if str[j] != str[k]
#         palindromes << str[j..k]
#         j -= 1
#         k += 1
#     end
#     palindromes
# end