class Deal

  def initialize(player, deck, amount = 5)
    @player = player
    @amount = amount
    @deck = deck
    deal_cards
  end

  def deal_cards
    @amount.times {|card| @player.player_hand << @deck.pop}
  end
end
