# Question 1
# Hashes are commonly found to be more complex than the simple one we saw earlier:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# It is often the case that each key points to another hash instead of a single value:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}
# Figure out the total age of just the male members of the family.
male_ages = []
sum_of_males = ''
munsters.map do |name, info|
  male_ages << info['age'] if info['gender'] == 'male'
  sum_of_males = male_ages.inject(:+)
end

p sum_of_males
#or
total_male_age = 0
munsters.each do |name, info|
  total_male_age += info["age"] if info["gender"] == "male"
end

p total_male_age

#----------------------------------------------------------------

# Question 2

# One of the most frequently used real-world string properties is that of 
# "string substitution", where we take a hard-coded string and modify it with 
# various parameters from our program.
# Given this previously seen family hash, print out the name, age and gender of 
# each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# ...like this:
# (Name) is a (age) year old (male or female).
munsters.each do |name, info|
  puts "(#{name}) is a (#{info['age']}) year old (#{info['gender']})"
end

#----------------------------------------------------------------


# Question 3

# In an earlier exercise we saw that depending on variables to be modified by called
# methods can be tricky:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
# We learned that whether the above "coincidentally" does what we think we
# wanted "depends" upon what is going on inside the method.

# How can we refactor this exercise to make the result easier to predict 
# and easier for the next programmer to maintain?

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
not_so_tricky_method(my_string, my_array)
puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
#or LS
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# The original method was mutating the array, in the second method we return the 
# values of a_string_param and an_array_param, my_string and my_array are not
# mutated.


#----------------------------------------------------------------


# Question 4

# A quick glance at the docs for the Ruby String class will have you scratching your head over the absence of any "word iterator" methods.

# Our natural inclination is to think of the words in a sentence as a collection. We would like to be able to operate on those words the same way we operate on the elements of an array. Where are the String#each_word and the String#map_words methods?

# A common idiom used to solve this conundrum is to use the String#split in conjunction with Array#join methods to break our string up and then put it back together again.

# Use this technique to break up the following string and put it back together with the words in reverse order:

sentence = "Humpty Dumpty sat on a wall."
p sentence.delete('.').split.reverse.join(' ') + '.'
#or LS
words = sentence.split(/\W/)
words.reverse!
backwards_sentence = words.join(' ') + '.'

#----------------------------------------------------------------

# Question 5

# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# 34, the variable answer is never modified until the last line of code when we subtract


#----------------------------------------------------------------


# Question 6

# One day Spot was playing with the Munster family's home computer and he wrote a 
# small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
# After writing this method, he typed the following...
# and before Grandpa could stop him, he hit the Enter key with his tail:

# The object id is being passed in the method, mutating the age and gender
# keys and effecting the munsters hash, if he were to reassinged the hash and
# run an iteration on the reassinged hash then munsters would not have been 
# updated as:
def mess_with_demographics(demo_hash)
  new_hash = demo_hash
  new_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
p munsters
# Munsters here is not updated.


#----------------------------------------------------------------


# Question 7

# Method calls can take expressions as arguments. Suppose we define a function called rps as follows, which follows the classic rules of rock-paper-scissors game, but with a slight twist that it declares whatever hand was used in the tie as the result of that tie.

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
# What is the result of the following call?

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

                     #paper                 #rock
     rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
# Then
                  #paper
     rps(rps("paper", "rock"), "rock")
# Last
     rps("paper", "rock")

     => "paper"


#----------------------------------------------------------------


# Question 8

# Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
What would be the output of this code:

bar(foo)

# bar(foo) , here foo's return value is always going to be 'yes', even if a parameter
# is given. Then bar return value will be false, returning 'no'