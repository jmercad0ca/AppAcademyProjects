# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    mult_1 = 1
    mult_2 = 1
    while num_1 * mult_1 != num_2 * mult_2
        if num_1 * mult_1 < num_2 * mult_2
            mult_1 += 1
        else
            mult_2 += 1
        end
    end
    num_1 * mult_1
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigrams = Hash.new(0)
    (0...str.length-1).each do |idx|
        bigrams[str[idx..idx+1]] += 1
    end
    bigrams.key(bigrams.values.max)
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        self.map {|k,v| [v,k]}.to_h
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        sum_count = 0
        (0...self.length-1).each do |idx|
            sum_count+=self[idx+1..-1].count(num-self[idx])
        end
        sum_count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new{|a,b| a <=> b}
        swapped = true
        while swapped
            swapped = false
            (0...self.length-1).each do |idx|
                if prc.call(self[idx],self[idx+1]) == 1
                    temp = self[idx]
                    self[idx] = self[idx+1]
                    self[idx+1] = temp
                    swapped = true
                end
            end
        end
        self
    end
end
