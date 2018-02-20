class Board

  def initialize
    @chess_board = Array.new(8){Array.new(8)}
    @rook = [[0,0], [0,7], [7,0], [7,7]]
    @knight = [[0,1], [0,6], [7,1], [7,6]]
    @bishop = [[0,2], [0,5], [7,2], [7,5]]
    @queen = [[0,3], [7,3]]
    @king = [[0,4], [7,4]] 
  end

  def generate_new_board
    8.times do |idx1|
      if idx1 == 1 || idx1 == 6
        8.times do |i|
          @chess_board[idx1][i] = :pawn
        end
      end
    end
  end

  def [](pos)

  end

  def move_piece(start_pos, end_pos)

  end

  def valid_play?(start_pos, end_pos)


  end

  def prompt_user

  end
end
