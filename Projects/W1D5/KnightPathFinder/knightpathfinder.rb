class KnightPathFinder

  attr_reader :start_pos, :visited_positions

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_positions = []
  end

  def self.valid_moves(pos)
    x, y = pos
    possible_moves = [
      [x+1, y+2],
      [x+1, y-2],
      [x-1, y+2],
      [x-1, y-2],
      [x+2, y+1],
      [x+2, y-1],
      [x-2, y+1],
      [x-2, y-1]
    ]

    possible_moves.select do |el|
      (el.first >= 0 && el.first <= 7) && (el.last >=0 && el.last <= 7)
    end
  end

  def new_move_position(pos)
    valid_moves = KnightPathFinder.valid_moves(pos)
    non_repeats = valid_moves.reject{ |move| @visited_positions.include?(move)}

    if non_repeats.include?(pos)
      @visited_positions << @start_pos
      @start_pos = pos
    else
      puts "Does not work"
    end
  end
end


# initialize knight([0,0])
# try to move knight to pos
#   KnightPathFinder.valid_moves(pos)
