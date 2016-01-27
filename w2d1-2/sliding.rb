require 'byebug'

module Sliding_piece

  def slide(pos,board,diagonal=nil,straight=nil)

    straight_directions = {
      "up" => [0,-1],
      "right" => [1,0],
      "down" => [0,1],
      "left" => [-1,0]
    }

    diagonal_directions = {
      "up_right" => [1,-1],
      "up_left" => [-1,-1],
      "down_right" => [1,1],
      "down_left" => [-1,1]
    }

    moves = []
    if straight
      straight_directions.each do |direction, move|
        new_pos = [pos,move].transpose.map{ |a| a.reduce(:+) }
        while board[new_pos].class == NullPiece #or is opponents piece
          moves << new_pos
          new_pos = [new_pos,move].transpose.map{ |a| a.reduce(:+) }
        end
      end
    end
    if diagonal
      diagonal_directions.each do |direction, move|
        new_pos = [pos,move].transpose.map{ |a| a.reduce(:+) }
        while board[new_pos].class == NullPiece #or is opponents piece
          moves << new_pos
          new_pos = [new_pos,move].transpose.map{ |a| a.reduce(:+) }
        end
      end
    end
    moves
  end

end
