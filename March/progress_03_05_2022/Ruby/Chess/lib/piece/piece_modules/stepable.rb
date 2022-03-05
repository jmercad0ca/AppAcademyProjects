module Stepable

  def moves
    directions = move_difs
    position = self.pos
    available_moves = []
    available_moves += king_moves(position) if directions.include?(:KING)
    available_moves += knight_moves(position) if directions.include?(:KNIGHT)
    available_moves
  end

  def move_difs
    [:KING,:KNIGHT]
  end

  def king_moves(position)
    row,col = position
    [[row-1,col-1],[row-1,col],[row-1,col+1],[row,col-1],[row,col+1],[row+1,col-1],[row+1,col],[row+1,col+1]].select do |pairs|
      pairs.all?{|idx| (0...7).include?(idx)} && (self.board[pairs].nil? || self.board[pairs].color != self.color) 
    end
  end

  def knight_moves(position)
    row,col = position
    [[row-2,col-1],[row-2,col+1],[row+2,col-1],[row+2,col+1],[row-1,col-2],[row-1,col+2],[row+1,col-2],[row+1,col+2]].select do |pairs|
      pairs.all?{|idx| (0...7).include?(idx)} && (self.board[pairs].nil? || self.board[pairs].color != self.color) 
    end
  end
end