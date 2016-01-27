class Player

  attr_reader :name
  attr_accessor :chip_count, :player_hand, :deck

  def initialize(name, deck = [])
    @name = name
    @chip_count = 500
    @player_hand = []
    @deck = deck
  end

  def receive_hand
    Deal.new(self, @deck.card_deck)
  end

  def bet
    until valid_bet?


    end
  end

  def prompt

  end

  def valid_bet?
    
  end

end
