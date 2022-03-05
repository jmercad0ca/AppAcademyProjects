require_relative 'board.rb'
require_relative 'cursor.rb'
require 'colorize'
class Display
  attr_accessor :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.rows.each.with_index do |row,idx_row|
      row.each.with_index do |col,idx_col|
        if !@board[[idx_row,idx_col]].nil?
          print @board[[idx_row,idx_col]].symbol + " ".colorize(:color => :red, :background => :light_black)
        else
          print "* ".colorize(:color => :red, :background => :light_black)
        end
      end
      print "\n"
    end
  end
end