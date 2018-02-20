require_relative "piece"
require 'singleton'

class NullPiece < Piece
  include Singleton

  def initialize
    @piece = :null_
  end

  def inspect
    "#{piece}"
  end
end
