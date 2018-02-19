require 'byebug'

class Array

  def my_each(&prc)
    self.length.times do |el|
      prc.call(self[el])
    end
    self
  end

  def my_select(&prc)
    selects = []

    self.my_each do |el|
      selects << el if prc.call(el)
    end

    selects
  end

  def my_reject(&prc)
    rejects = []

    self.my_each do |el|
      rejects << el unless prc.call(el)
    end

    rejects
  end

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |el|
      return false if !prc.call(el)
    end
    true
  end

  def my_flatten
    flatten = []
    self.each do |el|
      if el.is_a?(Array)
        flatten += el.my_flatten
      else
        flatten << el
      end
    end
    flatten
  end

  def my_zip(*arrays)
    zipped = []

    self.length.times do |i|
      subzip = [self[i]]

      arrays.my_each do |array|
        subzip << array[i]
      end

      zipped << subzip
    end
    zipped
  end

  def my_rotate(positions = 1)
    split_idx = positions % self.length

    self.drop(split_idx) + self.take(split_idx)
  end

  def my_join(separator = "")
    join = ""

    self.length.times do |i|
      join += self[i]
      join += separator unless i == self.length - 1
    end

    join
  end

  def my_reverse
    reversed = []

    self.my_each do |el|
      reversed.unshift(el)
    end

    reversed
  end
end
