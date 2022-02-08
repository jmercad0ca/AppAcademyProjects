def average(num1, num2)
    if !num1.is_a?(Numeric) || !num2.is_a?(Numeric)
        raise "Both arguments should be numbers" 
    end
    return (num1 + num2) / 2.0 
end

def average_array(arr)
    raise "Argument should be an array" if !arr.is_a?(Array)
    begin
        arr.sum / arr.length.to_f
    rescue => exception
        raise "Argument should be an array of numbers"
    end
end

def repeat(str,num)
    if !str.is_a?(String) || !num.is_a?(Numeric)
        raise "First argument should be a String & second argument should be a number" 
    end
    raise "Cannot repeat a string negative times" if num < 0
    str*num
end

def yell(str)
    raise "Argument should be a String" if !str.is_a?(String)
    str.upcase + "!"
end

def alternating_case(str)
    raise "Argument should be a String" if !str.is_a?(String)
    alternate = []
    str.split(" ").each.with_index do |word, index|
        if index.odd?
            alternate << word.downcase
        else
            alternate << word.upcase
        end
    end
    alternate.join(" ")
end