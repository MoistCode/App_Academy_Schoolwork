
#Time Complexity: O(n*n!)
#Space Complexity: O(n*n!)
def first_anagram?(str1, str2)
  str1.split(//).permutation(str2.length).include?(str2.split(//))
end

#Time Compexity: O(n^3)
#Space Complexity: O(n)
def second_anagram?(str1, str2)
  str_split = str2.split(//)

  str1.split(//).each do |el1|
    str2.split(//).each do |el2|
      str_split.delete(el1) if el1 == el2
    end
  end

  str_split.empty?
end

#Time Compexity: O(n log n)
#Space Complexity: O(n)
def third_anagram?(str1, str2)
  str1.split(//).sort == str2.split(//).sort
end

#Time Complexity: O(n)
#Space Complexity: O(1)
def fourth_anagram?(str1, str2)
  hsh1 = Hash.new { |hash, key| hash[key] = 0 }

  str1.each_char do |char|
    hsh1[char] += 1
  end

  str2.each_char do |char|
    hsh1[char] -= 1
  end

  hsh1.values.all? { |el| el == 0 }
end

#Time Complexity: O(n)
#Space Complexity: O(1)
def anagram?(str1, str2)
  (str2.split(//) - str1.split(//)).empty?
end

p fourth_anagram?("gizmo", "sally")
p fourth_anagram?("elvis", "lives")
