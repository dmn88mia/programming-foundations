# Question 1

# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = “hello world”
end

greeting

# I expected an error to raise becuase the variable is initialized within an if statement
# which happens to be false, however; when initializing a local variable within an if
# block even if it is not executed, the local variable is indeed initialized to nil

#----------------------------------------------------------------


# Question 2

# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# The output is { :a => "hi there"}
# When we mutate informal_greeting with the << operator we are mutating the original object
# because informal_greeting is a reference to the original object.


#----------------------------------------------------------------


# Question 3

# In other exercises we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.

# To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

# What will be printed by each of these code groups?

# A:
"one is: one"
"two is: two"
"three is: three"
# Because the method is not mutating any of our one,two and three variables we defined
# outside the method. It is simply assinging new variables to the values of our one,two
# and three variables that are being passed in the parameters, the new variables inside the
# method are only reassignment. They may point at the same reference of the objects we defined
# outside the method but again, nothing within the method is being mutated and changing our
# varialbes object outside the method.

# B:
"one is: one"
"two is: two"
"three is: three"
# Here, we have new variables being assinged to new strings creating new object ids, nothing
# here is mutating our variables outside of the method, they remain intact.

# C:
"one is: two"
"two is: three"
"three is: one"
# In this case, the method is modifying the reference of the objects we defined outside
# the method by using a mutating method, gsub! and thus changing the original objects.


#----------------------------------------------------------------


# Question 4

# A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

# It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.

def uuid
  char = (0..9).collect { |n| n.to_s }
  char += ('a'..'f').to_a
  blocks = [8,4,4,4,12]
  
  uuid = ''
  blocks.each do |num|
    while num >= 0
      uuid << char.sample
      num -= 1
    end
    uuid += '-' 
  end
  uuid.chop
end

#or LS

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end


#----------------------------------------------------------------


# Question 5

# Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called is_an_ip_number? that determines if a string is a valid ip address number and asked Ben to use it.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end
# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition, and you're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

# Help Ben fix his code.

def dot_seperated_ip_address?(input_string)
  numbers = input_string.split('.')
  return false if numbers.size != 4

  numbers.each do |num|
     return false if is_an_ip_number?(num) == false
   end
  true
end

def is_an_ip_number?(num)
  range = (0..255).to_a
  num.to_i.to_s == num && range.include?(num.to_i)
end

#or LS

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end
