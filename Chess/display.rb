require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display

  attr_reader :board, :cursor

  def initialize(board)
    @cursor = Cursor.new([0, 0], board)
    @board = board
  end

  def cursor_square?(pos)
    if cursor.cursor_pos == board[pos]
      return true
    end

    false
  end

  def render
    board.each_index do |row|
      board.each_index do |col|
        pos = [row, col]
        if (row + col).even?
          board[pos].colorize(:light_black)
        else
          board[pos].colorize(:light_yellow)
        end
      end
    end
    board[cursor.cursor_pos].colorize(:lightred)
    board[cursor.selected].colorize(:red)
  end

  def display
    loop
    render
    cursor.get_input
  end

end


display
