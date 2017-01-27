# Exercise 1

# For each of these collection objects demonstrate how you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr1[2][1][3] => 'g'

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
p arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
p arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
hsh2[:third].keys # or hsh2[:third].key(0) or hsh2[:third].keys[0] # => 'g'

# -------------------------------------------------------------------------------------

# Exercise 2

# For each of these collection objects where the value 3 occurs, 
# demonstrate how you would change this to 4.

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1.values[0][2][0] = 4 #or hsh1[:first][2][0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4

# -------------------------------------------------------------------------------------

# Exercise 3

# Given this code, what would be the final values of a and b? Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

a # => 2 , replacing 0index from a to 4
b # => [3, 8] , referencing b with 1index and then modifiying that array which 
# changes the value of b.

# -------------------------------------------------------------------------------------

# Exercise 4

# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.values.each do |value|
  value.each do |word|
    word.split('').each do |letter|
      puts letter if "AEIOUaeiou".include?(letter)
    end
  end  
end

#or
vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end

# -------------------------------------------------------------------------------------

# Exercise 5

# Given this data structure, return an new array of the same structure but 
# with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

def descending(arr)
  arr.map do |sub_arr|
    sub_arr.sort { |a, b| b <=> a } 
  end
end

p descending(arr)

# -------------------------------------------------------------------------------------

# Exercise 6

# Given the following data structure and without modifying the original array,
# use the map method to return a new array identical in structure to the 
# original but where the value of each integer is incremented by 1.

original_arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

def new_arr(original_arr)
  new_arr = original_arr.map do |hash|
    new_hash = {}
    hash.each do |k, v|
      new_hash[k] = v + 1
    end
    new_hash
  end

  p original_arr
  new_arr
end

p new_arr(original_arr)

# -------------------------------------------------------------------------------------

# Exercise 7

# Given the following data structure use a combination of methods, 
# including either the select or reject method, to return a new array identical in
# structure to the original but containing only the integers that are 
# multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

def multiplies_of_3(arr)
  arr.map do |sub_arr|
    sub_arr.select do |num|
      num % 3 == 0        
    end
  end
end

p multiplies_of_3(arr)

# -------------------------------------------------------------------------------------

# Exercise 8

# Given the following data structure, and without using the Array#to_h method, 
# write some code that will return a hash where the key is the first item in 
# each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

arr_to_hash = {}
arr.each do |sub_arr|
  arr_to_hash[sub_arr[0]] = sub_arr[1]
end

p arr_to_hash

# -------------------------------------------------------------------------------------

# Exercise 9

# Given the following data structure, return a new array containing the same 
# sub-arrays as the original but ordered logically according to the numeric 
# value of the odd integers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

def odd_order(arr)
  arr.sort_by do |element|
    element.select do |num|
      num.odd?
    end
  end
end

p odd_order(arr)

# -------------------------------------------------------------------------------------

# Exercise 10

# Given this data structure write some code to return an array containing the 
# colors of the fruits and the sizes of the vegetables. The sizes should be 
# uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

def food(hsh)
  colors_sizes = []
  hsh.each do |_, value_hsh|
    value_hsh.each do |k, v|
      colors_sizes << value_hsh[:colors].map { |color| color.capitalize } if value_hsh[k] == 'fruit'
      colors_sizes << value_hsh[:size].upcase if value_hsh[k] == 'vegetable'
    end
  end
  colors_sizes
end

p food(hsh)

# -------------------------------------------------------------------------------------

# Exercise 11

# Given this data structure write some code to return an array which contains only 
# the hashes where all the integers are even.


arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

def even_integers(arr)
  arr.select do |hash|
    hash.values.all? do |arr| 
      arr.all? {|n| n.even?}
    end
  end
end

p even_integers(arr)

# -------------------------------------------------------------------------------------

# Exercise 12

# Given this data structure, and without using the Array#flatten method,
# write some code to return a new array containing all of the items in the 
# original array but in a flat structure.

arr = [['stars', 'river'], 'letter', ['leaves', ['horses', 'table']]]

def flatten_arr(arr)
  flattened_arr = []
  arr.each do |element|
    if element.is_a?(String)
     flattened_arr << element
    elsif element.is_a?(Array)
      element.each do |str|
        str.is_a?(String) ? flattened_arr << str : str.each { |sub_str| flattened_arr << sub_str}
      end
    end
  end
  flattened_arr
end

p flatten_arr(arr)