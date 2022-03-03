module Slideable

  def moves
    directions = move_dirs
    position = self.pos
    available_moves = []
    available_moves += horizontal_moves(position) if directions.include?(:HORIZONTAL)
    available_moves += vertical_moves(position) if directions.include?(:VERTICAL)
    available_moves += diagonal_moves(position) if directions.include?(:DIAGONAL)  
    available_moves
  end

  def move_dirs
    [:HORIZONTAL,:VERTICAL,:DIAGONAL]
  end

  def horizontal_moves(current_pos)
    available_moves = []
    # Check left direction
    row,col = current_pos[0],current_pos[1]-1
    while col >= 0 && self.board[[row,col]].nil? do
      available_moves << [row,col]
      col -= 1
    end
    available_moves << [row,col] if check_final_position_in_dir(row,col)
    # Check right direction
    col = current_pos[1]+1
    while col <= 7 && self.board[[row,col]].nil? do
      available_moves << [row,col]
      col += 1
    end
    available_moves << [row,col] if check_final_position_in_dir(row,col)
    available_moves
  end

  def vertical_moves(current_pos)
    available_moves = []
    # Check up direction
    row,col = current_pos[0]-1,current_pos[1]
    while row >= 0 && self.board[[row,col]].nil? do
      available_moves << [row,col]
      row -= 1
    end
    available_moves << [row,col] if check_final_position_in_dir(row,col)
    # Check down direction
    row = current_pos[0]+1
    while row <= 7 && self.board[[row,col]].nil? do
      available_moves << [row,col]
      row += 1
    end
    available_moves << [row,col] if check_final_position_in_dir(row,col)
    available_moves
  end

  def diagonal_moves(current_pos)
    available_moves = []
    # Check up-left direction
    row,col = current_pos[0]-1,current_pos[1]-1
    while row >= 0 && col >= 0 && self.board[[row,col]].nil? do
      available_moves << [row,col]
      row -= 1
      col -= 1
    end
    available_moves << [row,col] if check_final_position_in_dir(row,col)
    # Check down-left direction
    row,col = current_pos[0]+1,current_pos[1]-1
    while row >= 0 && col >= 0 && self.board[[row,col]].nil? do
      available_moves << [row,col]
      row += 1
      col -= 1
    end
    available_moves << [row,col] if check_final_position_in_dir(row,col)
    # Check down-right direction
    row,col = current_pos[0]+1,current_pos[1]+1
    while row >= 0 && col >= 0 && self.board[[row,col]].nil? do
      available_moves << [row,col]
      row += 1
      col += 1
    end
    available_moves << [row,col] if check_final_position_in_dir(row,col)
    # Check up-right direction
    row,col = current_pos[0]-1,current_pos[1]+1
    while row >= 0 && col >= 0 && self.board[[row,col]].nil? do
      available_moves << [row,col]
      row -= 1
      col += 1
    end
    available_moves << [row,col] if check_final_position_in_dir(row,col)
    available_moves
  end

  def check_final_position_in_dir(row,col)
    # Check if landing pos is enemy piece
    (0..7).include?(row) && (0..7).include?(col) && self.board[[row,col]].color != self.color
  end

end