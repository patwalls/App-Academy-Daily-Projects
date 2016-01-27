require 'towers_of_hanoi'

describe "Towers of Hanoi" do
  let(:hanoi_game) {TowersOfHanoiGame.new}

  describe "initialize" do
    context "when initialized with argument" do
      it "sets stacks to be a custom height" do
        custom_stacks = [[4, 3, 2, 1], [], []]
        hanoi_game = TowersOfHanoiGame.new(custom_stacks)

        expect(hanoi_game.stacks).to be(custom_stacks)
      end
    end

    context "when initialized without argument" do
      it "sets stacks to be a default height" do
        default_stacks = [[3, 2, 1], [], []]
        hanoi_game = TowersOfHanoiGame.new
        expect(hanoi_game.stacks).to eq(default_stacks)
      end
    end
  end

  # describe "valid_move?" do
  #   context "move stack from empty tower" do
  #     it "raises an error" do
  #       expect(hanoi_game.valid_move?(2,0)).to be_falsey
  #     end
  #   end
  # end

  describe "move" do
    context "move stack from empty tower" do
      it "raises an error" do
        expect{hanoi_game.move(2,0)}.to raise_error("cannot move from empty stack")
      end
    end
  end

  describe "game won" do
    # context "player wins game after series of moves" do
    it "ends game after correct series of moves (default height)" do
      array_of_moves = [[0,1],[0,2],[1,2],[0,1],[2,0],[2,1],[0,1]]
      array_of_moves.each do |move|
        hanoi_game.move(move.first,move.last)
      end
      expect(hanoi_game.won?).to be_truthy
    end
  end

  describe "render" do
    it "render correct game state" do
      expect(hanoi_game.render).to eq("Tower 0:  3  2  1\nTower 1:  \nTower 2:  \n")
    end
  end

  describe "render2" do
    it "render correct game state" do
      expect(hanoi_game.render).to include("Tower 0", "Tower 1")
    end
  end
end

# it "raises an error when index is not in array" do
#   arr = [1,2,3]
#   expect{ arr[4] }.to raise_error("")
# end
