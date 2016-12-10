# Question 1

# Every named entity in Ruby has an object_id. This is a unique identifier for that object.

# It is often the case that two different things "look the same", but they can be different objects. The "under the hood" object referred to by a particular named-variable can change depending on what is done to that named-variable.

# In other words, in Ruby everything is an object...but it is not always THE SAME object.

# Predict how the values and object ids will change throughout the flow of the code below:

The object ids remain the same when outside and inside the block before any reassignment is done.
After reassigning the values creates new objects and are still referred with the original
variable names. Once leaving the block, the variables defined inside block are not accessible 
outside the block and have no meaning once out the block.


#----------------------------------------------------------------


# Question 2

# Let's look at object id's again from the perspective of a method call instead of a block.

# Here we haven't changed ANY of the code outside or inside of the block/method. We simply took the contents of the block from the previous exercise and moved it to a method, to which we are passing all of our outer variables.

# Predict how the values and object ids will change throughout the flow of the code below:

The method receives the values of the pararmeters passed. However, the pararmeter variables inside
have no relationship outside the method becuase no varialbes are being mutated.


 #----------------------------------------------------------------


#  Question 3

# Let's call a method, and pass both a string and an array as parameters and see how even though they are treated in the same way by Ruby, the results can be different.

# Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# For the string, the += is reassigning and creates a new string object.When creating 
# the new string object through reassignment, the method forgets about the reference of the
# object passed in through the pararmeter. The method now considers this new string object to be the 
# one true string.
# For the array, the variable within the method points at the same object reference as the
# array variable assigned outside the method becuase the method is using the << operator 
# which is a mutating operator.


 #----------------------------------------------------------------


# Question 4

# To drive that last one home...let's turn the tables and have the string show a modified output, while the array thwarts the method's efforts to modify the caller's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}" 

# In this case, we are doing the opposite, now the string object is being mutated and not
# reassinged so no new string object is being created, while the variable is reassigning
# and creating a new object array object


 #----------------------------------------------------------------


# Question 5

# How could the unnecessary duplication in this method be removed?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

#Answer:
def color_valid(color)
  color == "blue" || color == "green"
end