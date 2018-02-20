

class Piece
  attr_reader :piece
  def initialize
    @piece = :piece
  end

  def inspect
    "Piece #{piece}"
  end

  def valid_move?(pos)
    return true
  end
end
