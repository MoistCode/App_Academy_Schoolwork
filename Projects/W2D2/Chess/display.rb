require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
  def initialize(board)
   @cursor = Cursor.new([0,0], board)
  end

  def render
    start_pos = @cursor.get_input(:blue)
    end_pos = @cursor.get_input(:red)
    [start_pos, end_pos]
  end
end
