class TowersOfHanoi

  attr_reader :board, :from_stack, :to_stack

  def initialize
    @board = [[3,2,1], [], []]
    @from_stack = nil
    @to_stack = nil
  end

  def play

    until won?
      display_board
      move
    end

  end

  def move

  end

  def won?

  end

end
