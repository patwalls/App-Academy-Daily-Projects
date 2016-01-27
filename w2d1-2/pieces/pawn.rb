class Pawn < Piece
  include Stepping

  def possible_moves
    step(pos,board,false,true)
  end

  def to_s
    "♟"
  end
end
