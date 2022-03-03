
class Board
  attr_accessor :cups, :player_1_name, :player_2_name

  VALID_POSITIONS = [0,1,2,3,4,5,7,8,9,10,11,12]
  PLAYER_1_BANK = 6
  PLAYER_2_BANK = 13
  def initialize(name1, name2)
    @player_1_name = name1
    @player_2_name = name2
    @cups = Array.new(14){Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..12).each do |idx|
      unless idx == 6
        @cups[idx] = [:stone,:stone, :stone,:stone]
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !VALID_POSITIONS.include?(start_pos)
    raise "Starting cup is empty" if @cups[start_pos].empty?
    true
  end

  def make_move(start_pos, current_player_name)
    opposing_bank = current_player_name == @player_1_name ? PLAYER_2_BANK : PLAYER_1_BANK
    num_stones, @cups[start_pos] = @cups[start_pos].count, []
    current_pos = start_pos
    while num_stones > 0 do
      current_pos = (current_pos + 1) % 14
      unless current_pos == opposing_bank
        @cups[current_pos] << :stone
        num_stones -= 1
      end
    end
    self.render
    next_turn(current_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if [PLAYER_1_BANK, PLAYER_2_BANK].include?(ending_cup_idx)
    return :switch if @cups[ending_cup_idx].count == 1
    return ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    bottom, top = VALID_POSITIONS[0..5],VALID_POSITIONS[6..-1]
    return true if bottom.all?{|idx| @cups[idx].empty?} || top.all?{|idx| @cups[idx].empty?}
    return false
  end

  def winner
    player_1_count = @cups[PLAYER_1_BANK].count
    player_2_count = @cups[PLAYER_2_BANK].count
    return :draw if player_1_count == player_2_count
    player_1_count > player_2_count ? @player_1_name : @player_2_name
  end
end
