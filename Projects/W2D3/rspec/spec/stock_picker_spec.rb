require 'rspec'
require 'stock_picker'

# RSpec.describe StockPicker do
#
# describe "#initialize" do
#
#   it "takes in an array of 7 values"
#
#   it "initializes an array of 7 prices"
#
# end

describe "#calculate_profit_pair" do

  stock_prices = [550, 600, 1000, 400, 520, 600, 620]

  it "raises an error when an array is a length other than 7" do
    expect { calculate_profit_pair([]) }.to raise_error(ArgumentError)
  end

  it "returns a two element array" do
    expect(calculate_profit_pair(stock_prices).length).to eq(2)
  end

  it "returns a pair of elements in which the first value < second value" do
    expect(calculate_profit_pair(stock_prices)).to eq([0, 2])
  end

  it "returns an empty array if there is no profit" do
    no_profit = stock_prices.sort.reverse
    expect(calculate_profit_pair(no_profit)).to eq([])
  end

end



# end
