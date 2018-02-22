require 'rspec'
require 'deck'

RSpec.describe Deck do

  subject(:deck) { Deck.new }

  describe '#initialize' do

    it 'generates a deck of 52 cards' do
      expect(deck.current_deck.length).to eq(52)
    end

  end

  describe '#generate_deck' do

    it 'generates each card as an Card object' do
      boolean = deck.current_deck.all? { |el| el.is_a?(Card) }
      expect(boolean).to eq(true)
    end

  end

  describe '#shuffle_current_deck' do

    it 'shuffles the deck' do
      before_shuffled_deck = deck.current_deck.dup
      deck.shuffle_current_deck!
      expect(before_shuffled_deck).to_not eq(deck.current_deck)
    end

  end

end
