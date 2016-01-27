require 'hand'

describe "hand" do
  context "hand logic" do
    it "properly understands four of a kind hand" do
      four_of_kind_hand = [Card.new(1,:diamonds),Card.new(1,:diamonds),Card.new(1,:diamonds),Card.new(1,:diamonds),Card.new(5,:hearts)]
      hand = Hands.new(four_of_kind_hand)
      expect(hand.hand_strength).to eq(8)
    end
    it "properly understands full house hand" do
      full_house_hand = [Card.new(1,:diamonds),Card.new(1,:hearts),Card.new(1,:spades),Card.new(3,:hearts),Card.new(3,:spades)]
      hand = Hands.new(full_house_hand)
      expect(hand.hand_strength).to eq(7)
    end
    it "properly understands two pairs" do
      two_pairs_hand = [Card.new(1,:diamonds),Card.new(1,:hearts),Card.new(2,:spades),Card.new(3,:hearts),Card.new(3,:spades)]
      hand = Hands.new(two_pairs_hand)
      expect(hand.hand_strength).to eq(3)
      expect(hand.high_card).to eq(3)
    end
  end
end
