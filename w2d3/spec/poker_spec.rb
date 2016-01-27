require 'card'
require 'deck'
require 'hand'

describe "poker" do
  describe "deck#initialize" do
    let (:deck) {Deck.new}
    it "has a full deck" do
      expect(deck.card_deck.length).to eq(52)
    end

    it "has all suits" do
      num = deck.card_deck.map {|card| card.suit}.uniq.count
      expect(num).to eq(4)
    end

    it "has all cards" do
      num = deck.card_deck.map {|card| card.user_value}.uniq.count
      expect(num).to eq(13)
    end

    it "has all unique cards" do
      num = deck.card_deck.map {|card| [card.user_value, card.suit]}.uniq.count
      expect(num).to eq(52)
    end
  end
end

#   describe "hand" do
#     context "hand logic" do
#       it "properly understands four of a kind hand" do
#         four_of_kind_hand = [Card.new(1,:diamonds),Card.new(1,:diamonds),Card.new(1,:diamonds),Card.new(1,:diamonds),Card.new(5,:hearts)]
#         hand = Hand.new(four_of_kind_hand)
#         expect(hand.hand_strength).to eq(8)
#       end
#     end
#   end
# end
