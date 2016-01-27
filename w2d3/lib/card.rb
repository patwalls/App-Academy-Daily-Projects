class Card
  attr_reader :user_value
  attr_accessor :hidden_value, :suit
  
  def initialize(hidden_value, suit)
    @hidden_value = hidden_value
    @suit = suit
    @user_value = assigned_value
  end

  CARD_VALUES = {
    1 => "2",
    2 => "3",
    3 => "4",
    4 => "5",
    5 => "6",
    6 => "7",
    7 => "8",
    8 => "9",
    9 => "10",
    10 => "J",
    11 => "Q",
    12 => "K",
    13 => "A"
  }

  def assigned_value
    CARD_VALUES[hidden_value]
  end
end
