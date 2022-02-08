def proper_factors(number)
    return [] if number <= 0
    factors = []
    (1...number).each do |idx|
        if number % idx == 0
            factors << idx
        end
    end
    factors
end

def aliquot_sum(number)
    proper_factors(number).sum
end

def perfect_number?(number)
    aliquot_sum(number) == number
end

def ideal_numbers(number)
    perfect_nums = []
    idx = 2
    while perfect_nums.length != number do
        perfect_nums << idx if perfect_number?(idx)
        idx += 1
    end
    perfect_nums
end

