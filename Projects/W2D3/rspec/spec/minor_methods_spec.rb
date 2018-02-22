require 'rspec'
require 'minor_methods'

RSpec.describe MinorMethods do

  subject(:minor_method) { MinorMethods.new }

  describe "#remove_dups" do
    # arr = [1, 2, 1, 3, 3]
    it "returns uniq elements" do
      arr = [1, 2, 1, 3, 3]
      expect(minor_method.remove_dups(arr)).to eq([1, 2, 3])
    end

    it "returns uniq elements in order" do
      arr = [3, 1, 2, 1, 3]
      expect(minor_method.remove_dups(arr)).to eq([3, 1, 2])
    end

  end

  describe "#two_sums" do
    arr = [-1, 0, 2, -2, 1]
    it "does not contain same indices" do
      expect(minor_method.two_sums(arr)).to_not include([1, 1])
    end

    it "returns a pair of indices whose values equate to zero" do
      expect(minor_method.two_sums(arr)).to include([0, 4], [2, 3])
    end

    it "return indices in dictionary-wise order" do
      expect(minor_method.two_sums(arr)).to_not eq([[2, 3], [0, 4]])
    end

  end

  describe "#my_transpose" do
    rows = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
           ]

    it "raises an error if the argument is not an array" do
      expect { minor_method.my_transpose("cow") }.to raise_error(ArgumentError)
    end

    it "equates to #transpose" do
      expect(minor_method.my_transpose(rows)).to eq(rows.transpose)
    end

    it "does use #transpose" do
      expect(rows).to receive(:transpose)
      minor_method.my_transpose(rows)
    end

  end

end
