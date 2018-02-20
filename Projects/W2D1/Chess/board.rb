class Board

  def initialize
    @chess_board = Array.new(8){Array.new(8)}
  end

  def generate_new_board

  end

  def add_pieces(piece, pos)
    @chess_board[pos.first][pos.last] = piece
  end

  def [](pos)
    x,y = pos[0], pos[1]
    @chess_board[x][y]
  end

  def move_piece(start_pos, end_pos)
    update_board if valid_play?(start_pos, end_pos)
  end

  def valid_play?(start_pos, end_pos)


  end

  def prompt_user

  end
end
