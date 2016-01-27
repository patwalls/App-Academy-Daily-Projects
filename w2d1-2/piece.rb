class Piece
  attr_reader :pos
  attr_reader :board

  def initialize(row, col, board, color=nil)
    @pos = row, col
    @board = board
    @color = color
  end

  def to_s
    "x"
  end

  def moves

  end
end

class NullPiece < Piece

  def to_s
    "  "
  end
end
