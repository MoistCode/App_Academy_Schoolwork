# Time complexity: O(n^2)
# Space complexity: O(1)

def bad_two_sum?(arr, target_sum)

  (0...arr.length).each do |i|
    ((i+1)...arr.length).each do |j|
      next if j == arr.length
      return true if arr[i] + arr[j] == target_sum
    end
  end
  false
end

def okay_two_sum?(arr, target_sum)
  arr.sort!


end

arr = (1..10000).to_a.shuffle
p bad_two_sum?(arr, 19999) # => should be true
p okay_two_sum?(arr, 19999) # => should be false
