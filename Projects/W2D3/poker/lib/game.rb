require_relative "player"
require_relative "deck"

class Game

  attr_reader :players, :deck, :pot

  def initialize(player_one, player_two)

    @players = [player_one, player_two]
    @deck = Deck.new
    @pot = 0
  end

  def set_up
    deck.shuffle_current_deck!
    players.each do |player|
      player.buy_in(100)
      pot += 100
      5.times do
        player.hand << deck.current_deck.pop
      end
    end

  end

  def players_init
    []
  end

  def play
    pass_cards

  end





end
