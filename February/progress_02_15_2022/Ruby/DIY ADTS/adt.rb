class Stack
    def initialize
        @stack = []
    end

    def push(el)
        @stack << el
    end

    def pop
        popped = @stack[-1]
        @stack = @stack[0...-1]
        popped
    end

    def peek
        @stack[-1]
    end

    def to_s
        @stack
    end
end

class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue << el
    end

    def dequeue
        dequeued = @queue[0]
        @queue = @queue[1..-1]
        dequeued
    end

    def peek
        @queue[0]
    end

    def to_s
        @queue
    end
end

class Map
    def initialize
        @map = []
    end

    def set(key, value)
        @map.each.with_index do |pair,idx| 
            if pair[0] == key
                @map[idx] = [key,value]
                return true
            end
        end
        @map << [key, value]
        return false
    end 
    
    def get(key)
        value = @map.select{|pair| pair[0] == key}.flatten[1]
        value.nil? ? false : value
    end
    
    def delete(key)
        @map.each do |pair| 
            if pair[0] == key
                @map.delete(pair)
                return true
            end
        end
        return false
    end
    
    def show
        print @map
    end

    def to_s
        @map
    end
end



if __FILE__==$PROGRAM_NAME
    print "TEST STACK\n========\n"
    stack = Stack.new
    stack.push(1)
    puts stack.to_s == [1]
    stack.push(2)
    puts stack.to_s == [1,2]
    stack.push(3)
    puts stack.to_s == [1,2,3]
    stack.push(4)
    puts stack.to_s == [1,2,3,4]
    puts stack.pop == 4
    puts stack.to_s == [1,2,3]
    puts stack.peek == 3
    puts stack.pop == 3
    puts stack.to_s == [1,2]
    puts stack.peek == 2
    puts stack.pop == 2
    puts stack.to_s == [1]
    puts stack.peek == 1
    puts stack.pop == 1
    puts stack.to_s == []
    puts stack.peek == nil
    print "TEST QUEUE\n========\n"
    queue = Queue.new
    queue.enqueue(1)
    puts queue.to_s == [1]
    queue.enqueue(2)
    puts queue.to_s == [1,2]
    queue.enqueue(3)
    puts queue.to_s == [1,2,3]
    queue.enqueue(4)
    puts queue.to_s == [1,2,3,4]
    puts queue.dequeue == 1
    puts queue.to_s == [2,3,4]
    puts queue.peek == 2
    puts queue.dequeue == 2
    puts queue.to_s == [3,4]
    puts queue.peek == 3
    puts queue.dequeue == 3
    puts queue.to_s == [4]
    puts queue.peek == 4
    puts queue.dequeue == 4
    puts queue.to_s == []
    puts queue.peek == nil
    print "TEST MAP\n========\n"
    map = Map.new
    puts map.set("key_1","value_1") == false
    puts map.get("key_1") == "value_1"
    puts map.to_s == [["key_1","value_1"]]
    puts map.get("key_1") == "value_1"
    puts map.delete("key_1") == true
    puts map.get("key_1") == false
    puts map.delete("key_1") == false
    puts map.set("key_1","value_1") == false
    puts map.set("key_2","value_2") == false
    puts map.set("key_3","value_3") == false
    puts map.to_s == [["key_1","value_1"],["key_2","value_2"],["key_3","value_3"]]
    puts map.set("key_3","value_4") == true
    puts map.to_s == [["key_1","value_1"],["key_2","value_2"],["key_3","value_4"]]
end