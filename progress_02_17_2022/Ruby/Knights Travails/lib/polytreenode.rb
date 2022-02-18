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

end