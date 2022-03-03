require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    current_move = TicTacToeNode.new(game.board,mark)
    current_move.children.each do |child|
      return child.prev_move if child.winning_node?(mark)
    end
    current_move.children.each do |child|
      return child.prev_move if !child.losing_node?(mark)
    end
    raise "There are no non-losing nodes! Something is wrong with implementation."
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jordan")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
