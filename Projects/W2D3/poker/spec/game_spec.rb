require 'rspec'
require 'game'

RSpec.describe Game do
  let(:player_one) { double("p1") }
  let(:player_two) { double("p2") }
  subject(:game) { Game.new(player_one, player_two) }

  describe '#initialize' do

    it "sets players into an array" do
      expect(game.players).to eq([player_one, player_two])
    end

    it "initializes a deck" do
      expect(game.deck.class).to eq(Deck)
    end

    it "initializes pot to 0" do
      expect(game.pot).to eq(0)
    end

  end

  describe '#set_up' do

    it 'shuffles the current deck' do
      allow('p1').
      expect(game.deck).to receive(:shuffle_current_deck)
      game.set_up
    end

    it 'passes out 5 cards per player'

    it 'removes 5 cards per player from the deck'

    it 'takes a buy in amount from each player'

    it 'increments the pot by 100 for each player'

  end

end
