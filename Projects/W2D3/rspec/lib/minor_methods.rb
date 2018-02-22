class MinorMethods

  def remove_dups(arr)
    arr.uniq
  end

  def two_sums(arr)
    result = []
    (0...arr.length).each do |i|
      (i + 1...arr.length).each do |j|
        result << [i, j] if arr[i] + arr[j] == 0
      end
    end
    result
  end

  def my_transpose(array)
    raise ArgumentError unless array.is_a?(Array)
    array.transpose
  end

end
