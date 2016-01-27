class Rook < Piece
  include Sliding_piece

  def possible_moves
    slide(pos,board,false,true)
  end

  def to_s
    "♜"
  end

end
