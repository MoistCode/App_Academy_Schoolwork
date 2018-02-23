class Array

  #O(n^2)
  def my_min
    min = 0
    self.each do |el1|
      self.each do |el2|
         min = el1 if el1 <= el2 && el1 < min
      end
    end
    min
  end

  #O(n)
  def my_min_revamped
    min = self.first
    self.each {|el| min = el if el < min}
    min
  end

  #O(n^3)
  def each_cons_revamped
    max = self.first
    arr = []
    (1...self.length).each do |i|
      self.each_cons(i).each do |subs|
        arr << subs
        sum = subs.inject(:+)
        max = sum if sum > max
      end
    end
    max
  end

  #Time Complexity: O(n)
  #Space COmplexity: O(1)
  def actual_sub_sum
    current_max = 0
    actual_max = 0

    self.each do |el|
      if (current_max + el) < 0
        current_max = 0
        next
      else
        current_max += el
        actual_max = current_max if current_max > actual_max
      end
    end

    actual_max
  end
end


 muh_list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
 muh_list_two = [5, 3, -7]

p muh_list.my_min
p muh_list.my_min_revamped
p muh_list.each_cons_revamped
p muh_list_two.each_cons_revamped
p muh_list.actual_sub_sum
p muh_list_two.actual_sub_sum
