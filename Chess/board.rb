require_relative "piece"
require_relative "start_pos"
require_relative "null_piece"
require "byebug"


class Board
  include Moveable
  attr_reader :grid

  def self.fresh_board
    Array.new(8) { Array.new(8) }
  end

  def initialize
    @grid = self.class.fresh_board
    populate
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  def populate
    @grid.each_index do |row|
      @grid.each_index do |column|
        pos = row, column
        if Moveable::STARTING_POS.include?(pos)
          self[pos] = Piece.new
        else
          self[pos] = NullPiece.new
        end
      end
    end
  end


  def move_piece(start_pos, end_pos)
    raise NoStartError if self[start_pos].nil?
    raise MoveError unless self[start_pos].valid_move?(end_pos)
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    @grid
  end

end

class NoStartError < StandardError
  def message
    "There is nothing here. Sorry ):"
  end
end

class MoveError < StandardError
  def message
    "You can't sit with us!"
  end
end
