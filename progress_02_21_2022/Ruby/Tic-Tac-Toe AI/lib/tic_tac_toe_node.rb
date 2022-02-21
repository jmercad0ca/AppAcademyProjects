require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_accessor :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over?
      return board.won? && board.winner != evaluator
    else
      if evaluator == @next_mover_mark
        return self.children.all?{|child| child.losing_node?(evaluator)}
      else
        return self.children.any?{|child| child.losing_node?(evaluator)}
      end
    end
  end

  def winning_node?(evaluator)
    if @board.over?
      return board.won? && board.winner == evaluator
    else
      if evaluator == @next_mover_mark
        return self.children.any?{|child| child.winning_node?(evaluator)}
      else
        return self.children.all?{|child| child.winning_node?(evaluator)}
      end
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    child_boards = []
    (0..2).each do |col|
      (0..2).each do |row|
        if @board.empty?([col,row])
          duplicate = @board.dup
          duplicate[[col,row]] = @next_mover_mark
          @next_mover_mark == :x ? new_mark = :o : new_mark = :x
          child_boards << TicTacToeNode.new(duplicate,new_mark,[col,row])
        end
      end
    end
    child_boards
  end
end
