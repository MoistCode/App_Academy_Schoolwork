require_relative "card"

POSSIBLE_SUITS = [
  'hearts',
  'diamonds',
  'spades',
  'clubs'
]

POSSIBLE_VALUES = (1..13).to_a


class Deck
  attr_reader :current_deck

  def initialize
    @current_deck = []
    generate_deck
  end

  def generate_deck
    POSSIBLE_SUITS.each do |suits|
      POSSIBLE_VALUES.each do |values|
        @current_deck << Card.new(suits, values)
      end
    end
  end

  def shuffle_current_deck!
    current_deck.shuffle!
  end

end
