class King < Piece
  include Stepping

  def possible_moves
    step(pos,board,true,false)
  end

  def to_s
    "♚"
  end
end
