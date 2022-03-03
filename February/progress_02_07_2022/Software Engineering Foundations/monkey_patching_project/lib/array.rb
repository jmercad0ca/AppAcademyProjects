# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        self.length > 0 && self.all?{|ele| ele.is_a?(Numeric)} ? self.max - self.min : nil
    end

    def average
       self.length > 0 && self.all?{|ele| ele.is_a?(Numeric)} ? self.sum / self.length.to_f : nil
    end

    def median
        mid = self.length / 2
        if self.length.odd?
            return self.sort[mid]
        elsif self.length > 0 && self.length.even?
            return self.sort[mid-1..mid].average
        else
            return nil
        end
    end

    def counts
        count = Hash.new(0)
        self.each{|ele| count[ele] += 1}
        count
    end

    def my_count(ele)
        self.counts[ele]
    end

    def my_index(element)
        self.each.with_index do |ele,idx|
            return idx if ele == element
        end
        nil    
    end

    def my_uniq
        uniq = []
        self.each {|ele| uniq << ele if !uniq.include?(ele)}
        uniq
    end

    def my_transpose
        return self if self.length <= 1
        block = Array.new(self.length) {[]}
        self.each do |arr|
            arr.each_with_index do |ele, idx|
                block[idx] << ele
            end
        end
        block
    end
end
