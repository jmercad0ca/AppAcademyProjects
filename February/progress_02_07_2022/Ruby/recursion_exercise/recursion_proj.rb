def exp_mul(base, n)
    if n == 0
        return 1
    else
        return base * exp_mul(base,n-1)
    end
end

def exp_div(base, n)
    if n == 0 
        return 1
    elsif n == 1
        return base
    elsif n.even?
        result = exp_div(base, n / 2)
        return result * result
    else
        result = exp_div(base, (n-1) / 2)
        return base * result * result
    end
end

class Array
    def deep_dup
        if self.none?{|ele| ele.is_a?(Array)}
            return self.dup
        elsif !self[0].is_a?(Array)
            return [self[0]] + self[1..-1].deep_dup
        else
            return [self[0].deep_dup] + self[1..-1].deep_dup
        end
    end
end

def fibonacci(n)
    if n == 0
        return []
    elsif n == 1
        return [1]
    elsif n == 2
        return [1,1]
    else
        fib_1 = fibonacci(n-1)[-1] 
        fib_2 = fibonacci(n-2)[-1]
        return fibonacci(n-3) + [fib_2, fib_1, fib_1+fib_2]
    end
end

def bsearch(arr,target)
    return nil if arr.empty? || (arr.length == 1 && arr[0] != target)
    middle = arr.length / 2
    if arr[middle] == target
        return middle
    elsif arr[middle] > target
        res = bsearch(arr[0...middle],target)
        res == nil ? nil : res 
    else
        res = bsearch(arr[middle..-1],target)
        res == nil ? nil : middle + res
    end
end

def mergesort(arr)
    if arr.length <= 1
        return arr
    else
        middle = arr.length / 2
        merge(mergesort(arr[0...middle]),mergesort(arr[middle..-1]))
    end
end

def merge(arr_left,arr_right)
    merged = []
    left_idx = 0
    right_idx = 0
    while left_idx < arr_left.length && right_idx < arr_right.length do
        left_val = arr_left[left_idx]
        right_val = arr_right[right_idx]
        if left_val <= right_val
            merged << left_val
            left_idx += 1
        else
            merged << right_val
            right_idx += 1
        end
    end
    left_idx < right_idx ? merged += arr_left[left_idx..-1] : merged += arr_right[right_idx..-1]
    merged
end


def subsets(arr)
    if arr.empty?
        return [[]]
    elsif arr.length == 1
        return [[arr[0]],[]]
    else
        head = arr[0]
        sets = subsets(arr[1..-1])
        return sets + sets.deep_dup.map{|ele| ele.unshift(head)}
    end
end



if __FILE__ == $PROGRAM_NAME
   puts "exp_mul test\n======"
   puts exp_mul(2,2) == 2 ** 2
   puts exp_mul(2,0) == 2 ** 0
   puts exp_mul(2,5) == 2 ** 5
   puts exp_mul(0,1) == 0 ** 1
   puts exp_mul(1,12) == 1 ** 12
   puts exp_mul(4,4) == 4 ** 4
   puts exp_mul(1,256) == 1 ** 256
   puts exp_mul(2,256) == 2 ** 256
   puts "exp_div test\n======"
   puts exp_div(2,2) == 2 ** 2
   puts exp_div(2,0) == 2 ** 0
   puts exp_div(2,5) == 2 ** 5
   puts exp_div(0,1) == 0 ** 1
   puts exp_div(1,12) == 1 ** 12
   puts exp_div(2,256) == 2 ** 256
   puts "array deep_dup test\n======"
   robot_parts = [["nuts", "bolts", "washers"],
   ["capacitors", "resistors", "inductors"], "light bulb"]
   robot_parts_copy = robot_parts.deep_dup
   robot_parts_copy[1] << "LEDs"
   print "#{robot_parts_copy}\n"
   print "#{robot_parts}\n"
   puts robot_parts_copy[1] != robot_parts[1]
   mixed_ele = [1, [2], [3, [4]]]
   mixed_ele_copy = mixed_ele.deep_dup
   mixed_ele_copy[2] << 2
   mixed_ele[1] << 5
   print "#{mixed_ele_copy}\n"
   print "#{mixed_ele}\n"
   puts mixed_ele_copy[2] != mixed_ele[2]
   puts mixed_ele_copy[1] != mixed_ele[1]  
   puts "fibonacci sequence test\n======"
   puts fibonacci(1) == [1]
   puts fibonacci(2) == [1,1]
   puts fibonacci(3) == [1,1,2]
   puts fibonacci(4) == [1,1,2,3]
   puts fibonacci(5) == [1,1,2,3,5]
   puts fibonacci(6) == [1,1,2,3,5,8]
   puts fibonacci(7) == [1,1,2,3,5,8,13]
   puts fibonacci(8) == [1,1,2,3,5,8,13,21]
   puts fibonacci(9) == [1,1,2,3,5,8,13,21,34]
   puts fibonacci(10) == [1,1,2,3,5,8,13,21,34,55]
   puts "bsearch test\n======"
   puts bsearch([1, 2, 3, 4], 2) == 1
   puts bsearch([1, 2, 3,], 1) == 0
   puts bsearch([1, 2, 3, 4], 1) == 0
   puts bsearch([2, 3, 4, 5], 4) == 2
   puts bsearch([2, 4, 6, 8, 10], 8) == 3
   puts bsearch([1, 3, 4, 5, 9], 5)  == 3
   puts bsearch([1, 2, 3, 4, 5, 6], 6) == 5
   puts bsearch([1, 2, 3, 4, 5, 6, 7], 7) == 6
   puts bsearch([1, 2, 3, 4, 5, 7], 6) == nil
   puts "mergesort test\n======"
   arr = [1,2,3,4,5]
   puts mergesort(arr) == arr
   arr = [1,2,3,4]
   puts mergesort(arr) == arr
   arr = [1]
   puts mergesort(arr) == arr
   arr = []
   puts mergesort(arr) == arr
   arr = [4,3,2,1]
   puts mergesort(arr) == [1, 2, 3, 4]
   arr = [5,4,3,2,1]
   puts mergesort(arr) == [1, 2, 3, 4, 5]
   arr = [1,7,3,5,2,8,9,10,100,2,3,4,64,1]
   puts mergesort(arr) == [1, 1, 2, 2, 3, 3, 4, 5, 7, 8, 9, 10, 64, 100]
   arr = [1,7,3,5,2,8,9,10,100,2,3,52,4,1,1]
   puts mergesort(arr) == [1, 1, 1, 2, 2, 3, 3, 4, 5, 7, 8, 9, 10, 52, 100]
   puts "subsets test\n======"
   puts subsets([]) == [[]]
   print subsets([1]).sort  == [[], [1]].sort
   puts " "
   print subsets([1,2]).sort == [[], [1], [2], [1, 2]].sort
   puts " "
   print subsets([1,2,3]).sort == [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]].sort
   puts " "
   print subsets([1,2,3,4]).sort == [[], [1], [1, 2], [1, 2, 3], [1, 2, 3, 4], [1, 2, 4], [1, 3], [1, 3, 4], [1, 4], [2], [2, 3], [2, 3, 4], [2, 4], [3], [3, 4], [4]].sort
   puts " "
end