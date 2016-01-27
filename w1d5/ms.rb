require 'pp'
class Tile

  attr_reader :bomb
  attr_accessor :revealed, :display
  def initialize (location, bomb = false)
    @bomb = bomb
    @revealed = false
    @display = "*"
    @location = location
  end

  def reveal
    @revealed = true
    @display = "_"
  end

  def to_s

  end

  def neighbors
    x = [1,0,-1]
    y = [1,0,-1]
    neighbor_arr = []
    x.each do |i|
      y.each do |j|

        xpos = @location[0] + i
        ypos = @location[1] + j
        if xpos < 9 && xpos >= 0 && ypos < 9 && ypos >= 0 && [xpos,ypos] != @location
          neighbor_arr << [xpos, ypos]
        end
      end
    end
    neighbor_arr
  end

  def neighbor_bomb_count(board)
    neighbor_arr = neighbors
    bomb_count = 0
    neighbor_arr.each do |el|
      bomb_count += 1 if board.grid[el[0]][el[1]].bomb
    end
    #p bomb_count
    bomb_count
  end

  def change_display(num_of_bombs)
    @display = num_of_bombs
  end

end

class Board

  attr_reader :no_of_bombs, :size, :grid
  def initialize (size = 9,no_of_bombs = 5)
    @size = size
    @grid = Array.new(size) {Array.new(size)}
    @no_of_bombs = no_of_bombs
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def generate_grid
    bomb_array = []
    no_of_bombs.times do
      bomb_array << [rand(size),rand(size)]
    end
    0.upto(size - 1) do |row|
      0.upto(size - 1) do |col|
        # if )
        bombed = bomb_array.include?([row,col])
        @grid[row][col] = Tile.new([row,col], bombed)
        # else
        #   @grid[i][j] = Tile.new([i,j])
        # end
      end
    end
  end

  def display
    display_grid = Array.new(size) {Array.new(size)}
    0.upto(size - 1) do |i|
      0.upto(size - 1) do |j|
        display_grid[i][j] = @grid[i][j].display
      end
    end
    display_grid.each do |row|
      p row
    end
  end

  def lost_game?(pos)
    # @grid[pos[0]][pos[1]].bomb
    self[pos].bomb
  end

  def game_won?
    @grid.each do |row|
      return false if row.any? { |tile| !tile.revealed && !tile.bomb }
    end
    true
    #Hopefully This Works
  end

  def update_board(pos)
    center_tile = @grid[pos[0]][pos[1]]
    if center_tile.bomb
      return
    end
    # center_tile.reveal
    neighbor_bomb = center_tile.neighbor_bomb_count(self)
    if neighbor_bomb > 0
      center_tile.change_display("#{neighbor_bomb}")
      return
    end
    center_tile.reveal
    neighbor_arr = center_tile.neighbors
    # p neighbor_arr
    neighbor_arr.each do |neighbor|
      update_board(neighbor) unless self[neighbor].revealed
      # if !@grid[neighbor[0]][neighbor[1]].revealed
        # p neighbor.display
      # end
    end
  end


end
class Game

  attr_accessor :board

  def initialize(size = 9)
    @board = Board.new(size)
  end

  def play
    board.generate_grid
    until board.game_won?
      board.display
      position = get_move
      break if board.lost_game?(position)
      board.update_board(position)
    end
    puts "Game Over!"
  end
  def get_move
    puts "What position would you like to move to? (x,y)"
    position = gets.chomp
    position = position.split(",")
    position = position.map {|el| Integer(el)}
    position
  end

end

game = Game.new
game.play
