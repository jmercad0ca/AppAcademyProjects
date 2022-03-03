# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".
def compress_str(str)
    compress = ''
    current_count = 1
    str.each_char.with_index do |c, idx|
        if idx == str.length-1 || c != str[idx+1] 
            compress << current_count.to_s if current_count != 1
            compress << c
            current_count = 1
        else
            current_count += 1
        end
    end
    compress
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
