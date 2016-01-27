class Game

  def initialize
    create_player
    play
  end

  def create_player
    @players = [Player.new("abc"), Player.new("def")]
  end

  def play
    until win?
      @deck = Deck.new

      @players.each do |player|
        player.deck = @deck
        player.receive_hand
      end

    end
  end

  def take_turns()

  end

  def win?
    false
  end


end
