answer =  "How can we find out? If I don't know, I first take a guess then look it up on the Ruby docs
           and play with the code in irb."

# Exercise 1

# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# Earlier we learned that select chooses an element out of the array/hash based 
# on it being 'truthy'. In this example 'hi' a string will always be a 'truthy' 
# value and so for each iteration the block returns true. Each element in the array
# is therefore chosen, giving us a new array with all the original elements
# => [1,2,3]

# ----------------------------------------------------------------------------------------------------

# Exercise 2

# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# Counts the number of elements for which the block returns a true value
# In this case, 'ant' and 'bat' meet the criteria of being less than 4
# so a total of 2 elements are true and that is what is returned.
# count considers the truthiness of the block's return value.
  answer

# ----------------------------------------------------------------------------------------------------

# Exercise 3

# What is the return value of reject? Why?

[1, 2, 3].reject do |num|
  puts num
end

# reject returns a new array containing the items in the array if the
# return value is not true. Here nil is returned so each return value
# meets the criteria for being not true. A new array containing all
# the orignal elements is returned

# ----------------------------------------------------------------------------------------------------

# Exercise 4

# What is the return value of each_with_object? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# Here this method returns the initially given object which would be a hash
# Through each iteration we are selecting the first letter of each value
# as the key and assinging the value to be the value of each iteration
# within the array. Final output is the initially given hash, in this 
# case the hash as been modified {"a"=>"ant", "b"=>"bear", "c"=>"cat"}

# ----------------------------------------------------------------------------------------------------

# Exercise 5

# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# shift removes the first key-value pair and returns it as a two-tem array
# This method mutates the object, leaving the hash with one key-value pair
  answer

# ----------------------------------------------------------------------------------------------------

# Exercise 6

# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

# pop destructively removes the last element in the array. Here we chain
# the method size to pop. size will now count the last item removed by pop
# which is 'caterpillar' and return 11 for the 11 characters in 'caterpillar'.

# ----------------------------------------------------------------------------------------------------

# Exercise 7

# What is the block's return value in the following code? 
# How is it determined?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# any? returns true if the block ever returns a value other than
# false or nil. num.odd? retuns true on its 1st and 3rd iteration,
# meeting the requirement of returning a value other than false or nil.

# ----------------------------------------------------------------------------------------------------

# Exercise 8

# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# take retuns the first element or elements in the array, here we have
# specified it to take the first 2 elements by giving the method an
# argument of 2. If no argument or a negative argument is given then
# it raises an ArguementError. This method is not destructive. 
  answer

# ----------------------------------------------------------------------------------------------------

# Exercise 9

# What is the return value of map? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# map returns a new array containing the results of each iteration.
# In this case, nil is the result of the first iteration and 'bear' 
# is the result of the second iteration. Both are placed into a new
# array and returned.

# ----------------------------------------------------------------------------------------------------

# Exercise 10

# What is the block's return value in the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# The block returns [1, nil, nil]. The first iteration num is returned while
# the next two iterations retun nil.

# ----------------------------------------------------------------------------------------------------

# Exercise 11

# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

#answer, to modify the original array
arr = arr.map { |num| num.to_i }.sort { |a, b| b <=> a }

#answer, to order the arr without mutating the orignal array
new_arr = arr.map { |num| num.to_i }.sort { |a, b| b <=> a }

# Here I am using map to return a new array that converts the array
# of stings to an array of integers. Then chaining sort with with a block
# that reverses the arrays order.

# Here is the answer provided by LS:
arr.sort do |a,b|
  b.to_i <=> a.to_i
end

# ----------------------------------------------------------------------------------------------------

# Exercise 12

# How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysees', author: 'James Joyce', published: '1922'}
]

#answer
books.sort_by do |hash|
  hash[:published].to_i
end
# I realized later that I could compare the string numbers that were equal 
# in length.





































































