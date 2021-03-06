require_relative "board"
require_relative "cursorable"
require 'colorize'

class Display
  include Cursorable

  def initialize(board = Board.new)
    @board = board
    @cursor_pos = [0, 0]
  end

  def run
    until game_over?
      get_input
      self.render
    end
  end

  def game_over?
    false # need to fix this
  end

  def selected?

  end

  def build_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :blue
    end
    { background: bg, color: :black }
  end

  def render
    system("clear")
    puts "Fill the grid!"
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each { |row| puts row.join }
  end
end
