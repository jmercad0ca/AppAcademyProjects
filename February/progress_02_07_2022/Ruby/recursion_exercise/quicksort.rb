def quicksort(arr)
    if arr.length <= 1
        return arr
    else
        partition(arr, 0)
    end
end

def partition(arr,pivot)
    check = arr[pivot]
    left = arr[1..-1].select{|less| less < check}
    right = arr[1..-1].select{|greater| greater >= check}

    quicksort(left) + [check] + quicksort(right)
end

if __FILE__ == $PROGRAM_NAME
    (0...10).each do |idx|
        test = Array.new(rand(10000)) { rand(1...10000) }
        puts test.sort == quicksort(test)
    end
end

# choose a partition idx
# place values less than idx on left
# place values greater than idx on right
# repeat partition on left and right array