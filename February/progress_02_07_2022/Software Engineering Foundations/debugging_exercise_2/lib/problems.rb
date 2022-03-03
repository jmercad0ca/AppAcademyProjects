# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require 'prime'
require 'byebug'

def largest_prime_factor(num)
    return nil if num < 2
    factors = get_factors(num)
    idx = factors.length-1
    while idx >= 0
        return factors[idx] if Prime.prime?(factors[idx])
        idx -= 1
    end
end

def get_factors(num)
    factors = []
    mid = Math.sqrt(num).to_i
    while mid > 0 do
        if num % mid == 0
            factors.unshift(mid)
            factors << num / mid if mid != num / mid
        end
        mid -= 1
    end
    factors
end

def unique_chars?(str)
    unique = Hash.new(true)
    str.each_char do |c|
        if !unique[c]
            return false
        else
            unique[c] = false
        end
    end
    true
end

def dupe_indices(array)
    indices = Hash.new{|h,k| h[k] = []}
    array.each.with_index do |ele, idx|
        indices[ele] << idx
    end
    indices.select {|k,v| v.length > 1}
end

def ana_array(array_1,array_2)
    ele_count = Hash.new(0)
    return false if array_1.length != array_2.length
    (0...array_1.length).each do |idx|
        ele_count[array_1[idx]] += 1
        ele_count[array_2[idx]] += 1
    end
    ele_count.all?{|k,v| v.even?}
end

# def ana_array(array_1,array_2)
#     return false if array_1.length != array_2.length
#     array_1_count = Hash.new(0)
#     array_2_count = Hash.new(0)
#     (0...array_1.length).each do |idx|
#         array_1_count[array_1[idx]] += 1
#         array_2_count[array_2[idx]] += 1
#     end
#     array_1_count == array_2_count
# end