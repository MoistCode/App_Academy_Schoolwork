# class StorePicker
#
# end

def calculate_profit_pair(arr)
  raise ArgumentError unless arr.length == 7

  profit = 0
  pos = []

  (0...arr.length).each do |i|
    (i + 1...arr.length).each do |j|
      diff = arr[j] - arr[i]
      if profit < diff
        profit = diff
        pos = [i, j]
      end
    end
  end

  pos
end
