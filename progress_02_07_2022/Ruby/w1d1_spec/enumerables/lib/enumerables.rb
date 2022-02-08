require "byebug"

class Array 
    def my_each(&prc)
        idx = 0
        while idx < self.length do
            prc.call(self[idx])
            idx += 1
        end
        self
    end

    def my_select(&prc)
        selected = []
        self.my_each{|ele| selected << ele if prc.call(ele)}
        selected
    end

    def my_reject(&prc)
        rejected = []
        self.my_each{|ele| selected << ele if !prc.call(ele)}
        rejected
    end

    def my_any?(&prc)
        self.my_each{|ele| return true if prc.call(ele)}
        false
    end

    def my_all?(&prc)
        self.my_each{|ele| return false if !prc.call(ele)}
        true
    end


    def my_flatten
        flattened = []
        self.each do |ele| 
            if !ele.is_a?(Array) 
                flattened << ele 
            else
                flattened += ele.my_flatten
            end
        end
        flattened
    end

    def my_zip(*args)
        block = Array.new(self.length){Array.new(1+args.length)}
        self.each.with_index do |ele,idx|
            block[idx][0] = ele
        end
        
        args.each.with_index do |array,idx1|
            if idx1 + 1 < 1+args.length
                array.each.with_index do |ele,idx2|
                    if idx2 < self.length
                        block[idx2][idx1+1] = ele
                    else
                        break
                    end
                end
            else
                break
            end
        end
        block
    end

    def my_rotate(times=1)
        new_arr = self.my_select{|e| true}
        if times < 0
            while times < 0 do
                new_arr.unshift(new_arr.pop)
                times += 1
            end
        else
            while times > 0 do
                new_arr << new_arr.shift
                times -= 1
            end
        end
        new_arr
    end

    def my_join(separator="")
        joined = ""
        (0...self.length).each do |idx|
            joined << self[idx]
            joined << separator if idx < self.length - 1
        end
        joined
    end

    def my_reverse
        return self if self.length <= 1
        reversed = []
        self.each{|ele| reversed.unshift(ele)}
        reversed
    end
end