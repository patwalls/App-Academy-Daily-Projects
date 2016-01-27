require_relative "piece"
require_relative "sliding"
require_relative "pieces/rook"
require 'byebug'
Dir["/pieces/*.rb"].each {|file| require file }
class Board
  attr_accessor :grid

  def initialize(length = 8)
    @length = length
    @grid = Array.new(length) { Array.new(length) { nil } }
    populate
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, mark)
    x, y = pos
    @grid[x][y] = mark
  end

  def move(start_pos, end_pos)
    raise "no piece" if self[start_pos].nil?
    raise "can't move to such position" if self.valid_moves(start_pos).include?(end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  def valid_moves(start_pos)
    possible_moves = self[start_pos].possible_moves
    possible_moves.select do |pos|
      on_the_board?(start_pos + pos) ##&& self[start_pos + pos].class == NullPiece
    end
  end

  def on_the_board?(end_pos)
    end_pos.all? { |el| el.between?(0,7) }
  end

  def rows
    @grid
  end

  def full?
    false
  end

  def in_bounds?(pos)
    x,y = pos
    x.between?(0,@length) && y.between?(0,@length)
  end

  def color(row_number)
    if row_number == 0 || row_number == 1
      "white"
    else
      "black"
    end
  end

  def populate(pawn_row = [1, 6],back_row = [0, 7])
    positions = {
      0 => Rook,
      1 => Knight,
      2 => Bishop,
      3 => Queen,
      4 => King,
      5 => Bishop,
      6 => Knight,
      7 => Rook

    }# debugger


    (0..7).each do |row_idx|
      (0..7).each do |col_idx|
        if pawn_row.include?(row_idx)
          self[[row_idx, col_idx]] = Pawn.new(row_idx, col_idx, self, self.color(row_idx))
        elsif back_row.include?(row_idx)
          self[[row_idx, col_idx]] = positions[col_idx].new(row_idx, col_idx, self, self.color(row_idx))
        else
          self[[row_idx, col_idx]] = NullPiece.new(row_idx, col_idx, self)
        end
      end
    end
  end
end
