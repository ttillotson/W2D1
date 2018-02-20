require_relative "piece"

class NullPiece < Piece
  # extend Singleton

  def initialize
    @piece = :null_ 
  end

  def inspect
    "#{piece}"
  end
end
