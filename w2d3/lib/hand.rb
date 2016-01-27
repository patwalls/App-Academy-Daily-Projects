require_relative 'card.rb'
require 'byebug'

class Hands
  attr_reader :five_cards, :hand_strength, :high_card

  def initialize(five_cards)
    @five_cards = five_cards
    @hand_strength = check_strength
  end

  def high_card_hand
    five_cards.map{|card| card.hidden_value}.max
    set_general_high_card
  end

  def x_of_a_kind
    hand = five_cards.each_with_object(Hash.new(0)) do |card, my_hash|
      my_hash[card.hidden_value] += 1
    end
    my_hand = hand.values.max
    @high_card = hand.select{|key, value| value == my_hand}.keys[0]
    hand.values.max
  end

  def two_pairs
    pairs = five_cards.each_with_object(Hash.new(0)) do |card, my_hash|
      my_hash[card.hidden_value] += 1
    end
    my_hand = pairs.values.select{|el| el == 2}
    @high_card = pairs.select{|key, value| value == 2}.keys.sort[1]
    debugger
    my_hand == [2,2]
  end

  def flush
    first_card_suit = five_cards.first.suit
    five_cards.all? { |card| card.suit == first_card_suit }
    set_general_high_card
  end

  def straight
    hidden_values = five_cards.map { |card| card.hidden_value }.sort
    return true if hidden_values == [1,2,3,4,13]
    return false if hidden_values.uniq.count != 5
    (hidden_values.min..hidden_values.max).to_a.all?{|val| hidden_values.include?(val)}
    set_general_high_card
  end

  def full_house
    pairs = five_cards.each_with_object(Hash.new(0)) do |card, my_hash|
      my_hash[card.hidden_value] += 1
    end
    my_hand = pairs.values
    @high_card = pairs.select{|key, value| value == 2}.keys[0]
    my_hand.sort == [2,3]
  end

  def straight_flush
    straight && flush
    set_general_high_card
  end

  def set_general_high_card
    @high_card = five_cards.map{|card| card.value}.max
  end

  def check_strength
    if straight_flush
      9
    elsif x_of_a_kind == 4
      8
    elsif full_house
      7
    elsif flush
      6
    elsif straight
      5
    elsif x_of_a_kind == 3
      4
    elsif two_pairs
      3
    elsif x_of_a_kind == 2
      2
    else
      1
    end
  end
end
