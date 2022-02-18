class PolyTreeNode

    attr_accessor :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(val)
        @parent.children.delete(self) if !@parent.nil?
        @parent = val
        @parent.children << self if !val.nil?
    end

    def add_child(child_node)
        child_node.parent=self
    end

    def remove_child(child_node)
        raise "Not a child to this node!" unless child_node.parent == self
        child_node.parent=nil
    end

    def dfs(target_value)
        return self if self.value == target_value
        result = nil
        @children.each do |child| 
            result = child.dfs(target_value)
            break if !result.nil?
        end
        result
    end

    def bfs(target_value)
        queue = [self]
        while !queue.empty?
            return queue[0] if queue[0].value == target_value
            queue += queue[0].children if !queue[0].children.nil?
            queue.shift
        end
        nil
    end
end