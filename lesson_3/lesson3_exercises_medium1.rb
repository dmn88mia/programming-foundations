# Question 1
# Let's do some "ASCII Art" (a stone-age form of nerd artwork from back 
# in the days before computers had video screens).
# For this exercise, write a one-line program that creates the following 
# output 10 times, with the subsequent line indented 1 space to the right:

10.times { |iterate| puts "The Flinstines Rock!".rjust(iterate + 20) }
#or
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

#----------------------------------------------------------------

# Question 2
# Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"

count_letters = {}
statement.delete(' ').split(//).each do |l|
  count_letters[l] = statement.delete(' ').count(l)
end

p count_letters
#or LS solution:
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

p result

#----------------------------------------------------------------

# Question 3
# The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?

# An error is prompted because you can not add a string and an integer. 
# You must add the integers first then convert into a string before 
# adding the two objects.

puts "the value of 40 + 2 is " + (40 + 2).to_s
sum = 40 + 2
puts "the value of 40 + 2 is #{sum}" #or #{40 + 2}

#----------------------------------------------------------------

# Question 4
# What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
# ( output: 1,3 ) The first number '1' will be printed and then '2' will be deleted so the 
# iteration goes on to '3' and finishes there becuase the block deletes '4' after
#

# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
#  ( output: 1,2 ) The first number printed '1' is followed by the pop method which deletes
# '4'. The iteration is ran again printed out '2' and again pop deletes '3' which is the last
# number in the array so the iteration comes to a halt. 

#----------------------------------------------------------------

# Question 5
# Alan wrote the following method, which was intended to show all of the factors 
# of the input number:

def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end
# Alyssa noticed that this will fail if the input is 0, or a negative number, 
# and asked Alan to change the loop. How can you change the loop construct 
# (instead of using begin/end/until) to make this work? Note that we're not 
# looking to find the factors for 0 or negative numbers, but we just want to 
# handle it gracefully instead of raising an exception or going into an infinite loop.
def factors(number)
  dividend = number
  divisors = []
  while number > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end
#or
def factors(number)
  dividend = number
  divisors = []
  if number > 0
    loop do 
      divisors << number / dividend if number % dividend == 0
      dividend -= 1
      break if dividend == 0
    end
  else
    puts "Number must be greater than 0!"
  end
  divisors
end
# Bonus 1
# What is the purpose of the number % dividend == 0 ?
# To see whether or not there is a remainder
# Bonus 2

# What is the purpose of the second-to-last line in the method (the divisors before the 
# method's end)?
# This returns divisors which becomes the return value of the method. If the line
# is removed the return value of the method would be nil

#----------------------------------------------------------------

# Question 6

# Alyssa was asked to write an implementation of a rolling buffer. 
# Elements are added to the rolling buffer and if the buffer becomes full, 
# then new elements that are added will displace the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick. Do you like << or + for 
# modifying the buffer?". Is there a difference between the two, other than what 
# operator she chose to use to add an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

# They both are the same in the sense that they both return the same value. However,
# in buffer1, buffer 'the array entered' is being mutated by <<. In buffer2, input_array
# is not mutated, buffer is assigned to the result of input_array & [new_element].

#----------------------------------------------------------------

# Question 7
# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator, 
# A user passes in two numbers, and the calculator will keep computing the sequence 
# ntil some limit is reached.
# Ben coded up this implementation but complained that as soon as he ran it, 
# he got an error. Something about the limit variable. What's wrong with the code?

limit = 15

def fib(first_num, second_num)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
# How would you fix this so that it works?
# limit is defined out of the methods scope, in order to fix the code,
# we would need to define limit inside the method.

#----------------------------------------------------------------


# Question 8
# In another example we used some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...titleize! This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:

words = "the flintstones rock"
# would be:

words = "The Flintstones Rock"
# Write your own version of the rails titleize implementation.
def titleize!(title)
   title.split.map { |word| word.gsub(word[0],word[0].upcase) }.join(' ')
end
# or
words.split.map { |word| word.capitalize }.join(' ')


#----------------------------------------------------------------

# Question 9
# Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.
# hint: try using a case statement along with Ruby Range objects in your solution

munsters.each do |name,info|
   if info['age'] <= 17
     info['age_group'] = 'kid'
   elsif info['age'] <= 64
     info['age_group'] = 'adult'
   elsif info['age'] > 65
     info['age_group'] = 'senior'
   end
end
#or
munsters.each do |name,info|
  case info['age']
  when 0...18
    info['age_group'] = 'kid'
  when 18...65
    info['age_group'] = 'adult'
  else
    info['age_group'] = 'senior'
  end
end