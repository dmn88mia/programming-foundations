# Question 1
# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# uniq returns a new array and does not mutate the numbers array
# output:
# 1
# 2
# 2
# 3

#----------------------------------------------------------------

# Question 2
# Describe the difference between ! and ? in Ruby. 
# And explain what would happen in the following scenarios:

# what is != and where should you use it? This means does not equal, should be used loops and conditionals.

# put ! before something, like !user_name. Changes the variable into the opposite boolean value, exp. false to true

# put ! after something, like words.uniq! This is part of the method and not syntax, in some cases it means the method is going to mutate the caller but you must read docs to confirm.

# put ? before something. The ternary operoator for conditional if..else

# put ? after something. Part of the method

# put !! before something, like !!user_name. Meant to turn object into its boolean value, going from opposite back to its original boolean value.

#----------------------------------------------------------------

# Question 3
# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house 
training your pet dinosaur."

advice_mod = advice.split()
advice_mod[6] = 'urgent'
p advice_mod.join(" ")

#or

advice_mod = advice.split.map do |word|
  word = 'urgent' if word == 'important'
  word = word
end

p advice_mod.join(' ')

#or 

advice.gsub!('important', 'urgent')

#or

advice_mod2 = []

advice.split.each do |v|
  v = 'urgent' if v == 'important'
  advice_mod2 << v
end

p advice_mod2.join(" ")

#----------------------------------------------------------------

# Question 4
# The Ruby Array class has several methods for removing items 
# from the array. Two of them have very similar names. 
# Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do 
# (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1) # deletes at index 1, removing 2 from array
numbers.delete(1) # removes the number 1 from the array


#----------------------------------------------------------------

# Question 5
# Programmatically determine if 42 lies between 10 and 100.

# hint: Use Ruby's range object in your solution.

forty_two = (10..100).to_a
#or
p forty_two ? forty_two.include?(42) : false
#or
p forty_two.include?(42)
#or
forty_two.each do |n|
  puts "This range contains #{n}!" if n == 42
end
#or
p (10..100).cover?(42)

#----------------------------------------------------------------

#6
# Question 6
# Starting with the string:

famous_words = "seven years ago..."
# show two different ways to put the expected 
# "Four score and " in front of it.

famous_words.prepend('Four score and ')
p famous_words
# or
famous_words.insert(0, 'Four score and ')
p famous_words
# or
first_part = ['Four score and']

famous_words.split.each do |word|
  first_part << word
end

full_sentence = first_part.join(' ')
p full_sentence
# or
"Four score and " + famous_words
# or
famous_words.prepend("Four score and ")
#or
"Four score and " << famous_words

#----------------------------------------------------------------

# Question 7
# Fun with gsub:

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
# This gives us a string that looks like a "recursive" method call:

"add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"
# If we take advantage of Ruby's Kernel#eval method to have it 
# execute this string as if it were a "recursive" method call

eval(how_deep)
# what will be the result?
# It will be 42:

#  #42       #34       #26       #18       #10      #2
add_eight(add_eight(add_eight(add_eight(add_eight(number)))))

#----------------------------------------------------------------

# Question 8
# If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
# We will end up with this "nested" array:

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
# Make this into an un-nested array.
p unested_flintstones =  flintstones.compact.flatten

#----------------------------------------------------------------

# Question 9
# Given the hash below

flintstones = { 

          "Fred" => 0,
          "Wilma" => 1,
          "Barney" => 2,
          "Betty" => 3,
          "BamBam" => 4,
          "Pebbles" => 5 
        }
# Turn this into an array containing only two elements: 
# Barney's name and Barney's number

barney_info = flintstones.flatten.select do |o|
                o == 'Barney' || o == 2
              end

p barney_info

#or
barney_info = flintstones.assoc("Barney")

p barney_info
#or
barney_info = []

flintstones.each do |k,v|
  barney_info << k if k == 'Barney'
  barney_info << v if v == 2
end

p barney_info

#----------------------------------------------------------------

# Question 10
# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys and the values
# are the position

flintstones_hash = {}

flintstones.each_with_index do |v,idx|
  flintstones_hash[v.to_sym] = idx
end

p flintstones_hash