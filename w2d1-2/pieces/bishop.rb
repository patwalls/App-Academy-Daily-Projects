class Bishop < Piece
  include Sliding_piece

  def possible_moves
    slide(pos,board,true,false)
  end

  def to_s
    "♝"
  end

end
