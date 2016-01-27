class Queen < Piece
  include Sliding_piece

  def possible_moves
    slide(pos,board,true,true)
  end

  def to_s
    " ♛ "
  end
end
