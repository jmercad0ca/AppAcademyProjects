require_relative "polytreenode.rb"
require "set"
class KnightPathFinder

    attr_accessor :root_node, :considered_positions
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = Set.new
        @considered_positions.add(@root_node)
        build_move_tree
        
    end

    def valid_moves(pos)
        x,y = pos
        [[x-1,y-2],[x-1,y+2],[x-2,y-1],[x-2,y+1],[x+1,y-2],[x+1,y+2],[x+2,y-1],[x+2,y+1]].select do |pairs|
            pairs.all?{|idx| (0...8).include?(idx)}
        end
    end

    def new_move_positions(pos)
        new_moves = valid_moves(pos).select do |move|
            !@considered_positions.include?(move)
        end
        @considered_positions += new_moves
        new_moves
    end

    def build_move_tree
        queue = [@root_node]
        while !queue.empty?
            children = new_move_positions(queue[0].value).map{|pos| PolyTreeNode.new(pos)}
            children.each{|node| queue[0].add_child(node)}
            queue += children
            queue.shift
        end
    end

end
