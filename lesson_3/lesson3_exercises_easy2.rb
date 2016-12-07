# Question 1
# In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# see if "Spot" is present.
p ages['Spot'] #returns nil
p ages.has_key?("Spot")


# Bonus: What are two other hash methods that would work just as well 
# for this solution?
p ages.member?("Spot")
p ages.include?("Spot")

#----------------------------------------------------------------

# Question 2
# Add up all of the ages from our current Munster family hash:

ages = { 

     "Herman" => 32,
     "Lily" => 30,
     "Grandpa" => 5843,
     "Eddie" => 10,
     "Marilyn" => 22,
     "Spot" => 237
   }

ages_arr = []

ages.select do |k,v|
  ages_arr << v
end

idx = 0
total_sum = 0
total_sum2 = 0
total_sum3 = 0
total_age = 0

while idx < ages_arr.size do 
  sum1 = ages_arr[idx]
  sum2 = ages_arr[idx + 1]

  if total_sum == 0 
     total_sum = sum1 + sum2
  elsif total_sum2 == 0
     total_sum2 = sum1 + sum2
  elsif total_sum3 == 0
     total_sum3 = sum1 + sum2
  end
  
  total_age = total_sum + total_sum2 + total_sum3
  idx += 2
end

p total_age
# or
ages.values.inject(:+)

#----------------------------------------------------------------

# Question 3
# In the age hash:

ages = { 

  "Herman" => 32, 
  "Lily" => 30, 
  "Grandpa" => 402, 
  "Eddie" => 10 
}
# throw out the really old people (age 100 or older).
young_ppl = ages.select { |_, v| v < 100 }
p young_ppl
#or
young_ppl = ages.keep_if { |_, age| age < 100 }
p young_ppl

#----------------------------------------------------------------

# Question 4
# Starting with this string:

munsters_description = "The Munsters are creepy in a good way."
# Convert the string in the following ways (code will be executed on original 
# munsters_description above):

# "The munsters are creepy in a good way."
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

munsters_description.capitalize!
munsters_description.swapcase!
munsters_description.downcase!
munsters_description.upcase!

#----------------------------------------------------------------

# Question 5
# We have most of the Munster family in our age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
# add ages for Marilyn and Spot to the existing hash
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

p ages.merge!(additional_ages)

#----------------------------------------------------------------

# Question 6
# Pick out the minimum age from our current Munster family hash:

ages = { 
         "Herman" => 32,
         "Lily" => 30,
         "Grandpa" => 5843, 
         "Eddie" => 10, 
         "Marilyn" => 22, 
         "Spot" => 237 
       }

p ages.values.min
#or
ages_arr = ages.to_a.flatten.select do |num|
    num.is_a? Integer
end

minimum_age = ages_arr.min
p minimum_age

#----------------------------------------------------------------

# Question 7
# See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet 
dinosaur."

p advice.match("Dino")

#----------------------------------------------------------------

# Question 8
# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"
index_of_betty = ''

flintstones.each_with_index do |name,idx|
  index_of_betty = idx if name.downcase.include?('be')
end

p index_of_betty
#or
index_of_betty = flintstones.index { |name| name.downcase[0,2] == "be"}
p index_of_betty

#----------------------------------------------------------------

# Question 9
# Using array#map!, shorten each of these names to just 3 characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |name|
  name[0..2] #or name[0,3]
end

p flintstones

#----------------------------------------------------------------

# Question 10
# Again, shorten each of these names to just 3 characters -- but this time do 
# it all on one line:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name[0,3]  } # or flintstones.map! { |name| name[0..2] }

p flintstones









