module Stepping
  def step(pos,board,king=nil,knight=nil)

    knight_directions = [
      [-2, -1],
      [-2,  1],
      [-1, -2],
      [-1,  2],
      [ 1, -2],
      [ 1,  2],
      [ 2, -1],
      [ 2,  1]
    ]

    king_directions = [
      [1,  0],
      [1, -1],
      [0, -1],
      [-1,-1],
      [-1, 0],
      [-1, 1],
      [0,  1],
      [1,  1]
    ]

    moves = []
    if king
      king_directions.each do |move|
        new_pos = [pos,move].transpose.map{ |a| a.reduce(:+) }
        moves << new_pos if board[new_pos].class == NullPiece #or is opponents piece
      end
    end
    if knight
      knight_directions.each do |move|
        new_pos = [pos,move].transpose.map{ |a| a.reduce(:+) }
        moves << new_pos if board[new_pos].class == NullPiece #or is opponents piece
      end
    end
    moves
  end

end
