class Deck
  attr_reader :card_deck
  def initialize
    @card_deck = create_deck
  end

  CARD_VALUES = (1..13).to_a
  CARD_SUITS = [:spades,:clubs,:diamonds,:hearts]

  def create_deck
    deck = []
    CARD_VALUES.each do |value|
      CARD_SUITS.each do |suit|
        deck << Card.new(value,suit)
      end
    end
    deck.shuffle
  end
end
