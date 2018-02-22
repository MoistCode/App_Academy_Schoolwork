class Player

  attr_accessor :hand, :money

  def initialize(money)
    @money = money
    @hand = []
  end

  def buy_in(amount)
    money -= amount
  end
end
