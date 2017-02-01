# Exercise 1

# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the 
# values are the positions in the array.

hsh = {}

flintstones.each_with_index do |name, index|
  hsh[name] = index
end

p hsh

# Or --------------------------------------------------------------------

def arr_to_hsh(arr)
  counter = 0

  arr.each_with_object({}) do | name, hsh |
    hsh[name] = counter
    counter += 1
  end
end

p arr_to_hsh(flintstones)

# Or --------------------------------------------------------------------

p flintstones.each_with_index.to_h

# Or --------------------------------------------------------------------
 
counter = 0
hsh = {}

loop do
  break if counter == flintstones.size
  hsh[flintstones[counter]] = counter
  counter += 1
end

p hsh

# Or --------------------------------------------------------------------

counter = 0
hsh = {}

while counter < flintstones.size do
  hsh[flintstones[counter]] = counter
  counter += 1
end

p hsh

# --------------------------------------------------------------------

# Exercise 2

# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages_arr = ages.map { |element1| element1.pop }.inject(0, :+)
p ages_arr

# Or --------------------------------------------------------------------

p ages.values.inject(0, :+)

# Or --------------------------------------------------------------------

ages_sum = 0
ages.each_value { |age| sum += age }
p ages_sum

# Or --------------------------------------------------------------------

ages_sum = 0
ages.flatten.each { |item| sum += item if item.to_s.to_i == item }
p ages_sum

# --------------------------------------------------------------------

# Exercise 3

# In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# throw out the really old people (age 100 or older).

ages.reject! { |_, v| v > 100 }
# Or --------------------------------------------------------------------
ages.keep_if { |_, v| v < 100 }
# Or --------------------------------------------------------------------
ages.delete_if { |_, v| v > 100 }
# Or --------------------------------------------------------------------
new_hash = {}
ages.each do |k,v| 
  new_hash[k] = v if v < 100
end

# --------------------------------------------------------------------

# Exercise 4

# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

youngest = ages.map { |k, v| v }.min

# Or --------------------------------------------------------------------

youngest = 0
ages.each do |k, v| 
  youngest += v if youngest == 0
  youngest = v if youngest > v
end

p youngest
# Or --------------------------------------------------------------------

youngest = []

ages.each do |k, v|
  youngest << v if youngest.empty?
  youngest[0] = v  if youngest.first > v
end

p youngest.first
# Or --------------------------------------------------------------------

ages.values.min

# --------------------------------------------------------------------

# Exercise 5

# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"

flintstones.each_with_index do |name, index|
  p index if name.include?('Be')
end

# Or --------------------------------------------------------------------

counter = 0
index = nil
flintstones.each do |name|
  index = counter if name.start_with?('Be')
  counter += 1
end

p index

# Or --------------------------------------------------------------------

flintstones.index { |name| name[0, 2] == "Be" }

# --------------------------------------------------------------------

# Exercise 6

# Amend this array so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each { |name| name.size == 3 ? name : name.chop! while name.size > 3 }
# Or ------------------------------------------------------------------------------
flintstones.each_with_index { |name, idx| flintstones[idx] = name[0,3] }
# Or ------------------------------------------------------------------------------
flintstones.map! { |name| name[0,3] }

p flintstones

# --------------------------------------------------------------------

# Exercise 7

# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

new_hsh = {}
counter = 0
compact_str = statement.delete(' ')

while counter < compact_str.size
  new_hsh[compact_str[counter]] = compact_str.scan(compact_str[counter]).size
  counter += 1
end

p new_hsh

# Or ------------------------------------------------------------------------------

new_hsh = {}
str_arr = statement.delete(' ').chars

str_arr.each { |l| new_hsh.keys.include?(l) ? next : new_hsh[l] = str_arr.join.scan('T').count }

p new_hsh

# Or ------------------------------------------------------------------------------

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_repitition = statement.scan(letter).count
  result[letter] = letter_repitition if letter_repitition > 0
end

# --------------------------------------------------------------------

# Exercise 8
1
3 
# --
1
2

# Iterators do not work on a copy of the original array. They work on the original array 
# in real time. It is best to not mutate the array when iterating.

# --------------------------------------------------------------------

# Exercise 9

# Write your own version of the rails titleize implementation.

words = "the flintstones rock"

def titleize!(title)
  titleized = title.split.map { |name| name.capitalize }.join(' ')
end

p titleize!(words)

# --------------------------------------------------------------------

# Exercise 10

# Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an additional "age_group" 
# key that has one of three values describing the age group the family member is
# in (kid, adult, or senior).

munsters.each do |name, details|
  case details['age']
  when (0..17)
    munsters[name]['age_group'] = 'kid'
  when (18..64)
    munsters[name]['age_group'] = 'adult'
  else
    munsters[name]['age_group'] = 'senior'
  end  
end

p munsters

# Or ------------------------------------------------------------------------------

munsters.each do |name, details|
  if details['age'] <= 17
    munsters[name]['age_group'] = 'kid'
  elsif details['age'] <= 64
    munsters[name]['age_group'] = 'adult'
  else
    munsters[name]['age_group'] = 'senior'
  end  
end

p munsters

# --------------------------------------------------------------------

# Exercise 11

# Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}
# figure out the total age of just the male members of the family.

total_ages = []

munsters.each { |name, details| total_ages << details['age'] if details['gender'] == 'male' }

p total_ages.inject(0,:+)

# Or ------------------------------------------------------------------------------

total_ages = 0

munsters.each do |name, details|
  details.each { |k, v| total_ages += details['age'] if v == 'male' }
end

p total_ages

# --------------------------------------------------------------------

# Exercise 12

# One of the most frequently used real-world string properties is that of "string substitution", where we take a hard-coded string and modify it with various parameters from our program.

# Given this previously seen family hash, print out the name, age and gender of each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  puts "#{name} is a #{details['age']} year old #{details['gender']}"
end

# --------------------------------------------------------------------

# Exercise 13

# A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

# It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.


def generate_UUID
  uuid_arr = [[8],[],[4],[],[4],[],[4],[],[12]]
  chars =  ('a'..'f').to_a + (0..9).to_a.map! { |n| n.to_s }

  uuid_arr.each do |sub_arr|
    if sub_arr.empty?
      sub_arr << '-'
    else
      section_size = sub_arr.first
      sub_arr.clear
      sub_arr << chars.sample while sub_arr.size < section_size
    end
  end
  uuid_arr.flatten.join
end

p generate_UUID

# Or ------------------------------------------------------------------------------
  # This instead of the top answer; Earlier in the lesson it was stated that it is best
  # not to modify the array while iterating, so I have created a clone arr
  # that I would iterate with but modify the origanal arr by utilizing the 
  # each_with_index to access the orginal array as I iterate the clone arr 
  # Avoiding the problem of iterating and modifying the object at the same time

def generate_UUID
  uuid_arr = [[8],[],[4],[],[4],[],[4],[],[12]]
  uuid_arr_clone = [[8],[],[4],[],[4],[],[4],[],[12]]
  chars =  ('a'..'f').to_a + (0..9).to_a.map! { |n| n.to_s }

  uuid_arr_clone.each_with_index do |sub_arr, idx|
    if sub_arr.empty?
      uuid_arr[idx] << '-'
    else
      section_size = sub_arr.first
      uuid_arr[idx].clear
      uuid_arr[idx] << chars.sample while uuid_arr[idx].size < section_size
    end
  end
  uuid_arr.flatten.join
end

p generate_UUID

# Or ------------------------------------------------------------------------------

def generate_UUID
  characters = ('a'..'f').to_a + (0..9).to_a.map! { |n| n.to_s }
  uuid = ""
  sections = [8, 4, 4, 4, 12]
  
  sections.each do |section|
    section.times { uuid += characters.sample }
    uuid += '-' unless section == sections[-1]
  end
  uuid
end

p generate_UUID

# Or ------------------------------------------------------------------------------

def generate_UUID
  chars =  ('a'..'f').to_a + (0..9).to_a.map! { |n| n.to_s }
  uuid = ''
  
  eight_char = ''
  four_char1 = ''
  four_char2 = ''
  four_char3 = ''
  twelve_char = ''

  eight_char += chars.sample while eight_char.size < 8
  four_char1 += chars.sample while four_char1.size < 4
  four_char2 += chars.sample while four_char2.size < 4
  four_char3 += chars.sample while four_char3.size < 4
  twelve_char += chars.sample while twelve_char.size < 12

  uuid = "#{eight_char}-#{four_char1}-#{four_char2}-#{four_char3}-#{twelve_char}"
end

p generate_UUID