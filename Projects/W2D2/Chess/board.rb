require_relative 'piece'
require_relative 'sliding_piece'
require_relative 'null_piece'
require_relative 'pawns'
require_relative 'stepping_piece'
require 'singleton'

class Board

  attr_reader :chess_board

  def initialize
    @chess_board = Array.new(8){Array.new(8)}
    @starting_board = [:rook,
                        :knight,
                        :bishop,
                        :queen,
                        :king,
                        :bishop,
                        :knight,
                        :rook]
    generate_new_board
    create_instances
  end

  def generate_new_board
    8.times do |idx1|
      if idx1 == 1 || idx1 == 6
        8.times do |i|
          @chess_board[idx1][i] = :pawn
        end
      elsif idx1 == 0 || idx1 == 7
        @chess_board[idx1] = @starting_board.dup
      end
    end
  end

  def create_instances
    8.times do |i|
      8.times do |j|
          case @chess_board[i][j]
          when :rook, :bishop, :queen
            SlidingPiece.instance
          when :knight, :king
            SteppingPiece.instance
          when :pawn
            Pawn.instance
          end
      end

    end
  end

  def [](*pos)
    x, y = pos
    @chess_board[x][y]
  end

  def []=(*pos, value)
    x, y = pos
    @chess_board[x][y] = value
  end

  def move_piece(start_pos, end_pos)
    starting_x, starting_y = start_pos
    ending_x, ending_y = end_pos
    self[ending_x, ending_y] = self[starting_x, starting_y]
    self[starting_x, starting_y] = nil
  end


  def valid_play?(start_pos, end_pos)
    starting_x, starting_y = start_pos
    ending_x, ending_y = end_pos
    begin
      raise OutOfRangeError unless (start_pos + end_pos).all?{|el| el.between?(0,7)}
      raise NoPieceError if self[starting_x, starting_y] == nil
      raise SamePositionError if start_pos == end_pos
    rescue => e
      puts e.message
      return false
    end
    true
  end

  def prompt_user

  end
end

class SamePositionError < StandardError
  def message
    puts "End pos can not be same as start pos"
  end
end

class OutOfRangeError < StandardError
  def message
    puts "Out of range position!"
  end
end

class NoPieceError < StandardError
  def message
    puts "No piece here!"
  end
end
