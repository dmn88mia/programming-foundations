# # if brd[combo[0]] == PLAYER_MARKER &&
# #         brd[combo[1]] == PLAYER_MARKER &&
# #         brd[combo[2]] == INITIAL_MARKER
# #         square = combo[2] #create winning method and defensive method
# #         return brd[square] = COMPUTER_MARKER
# #       elsif brd[combo[0]] == PLAYER_MARKER &&
# #         brd[combo[2]] == PLAYER_MARKER &&
# #         brd[combo[1]] == INITIAL_MARKER
# #         square = combo[1] #create winning method and defensive method
# #         return brd[square] = COMPUTER_MARKER
# #       elsif brd[combo[1]] == PLAYER_MARKER &&
# #         brd[combo[0]] == PLAYER_MARKER &&
# #         brd[combo[2]] == INITIAL_MARKER
# #         square = combo[2] #create winning method and defensive method
# #         return brd[square] = COMPUTER_MARKER
# #       elsif brd[combo[1]] == PLAYER_MARKER &&
# #         brd[combo[2]] == PLAYER_MARKER &&
# #         brd[combo[0]] == INITIAL_MARKER
# #         square = combo[0] #create winning method and defensive method
# #         return brd[square] = COMPUTER_MARKER
# #       elsif brd[combo[2]] == PLAYER_MARKER &&
# #         brd[combo[0]] == PLAYER_MARKER &&
# #         brd[combo[1]] == INITIAL_MARKER
# #         square = combo[1] #create winning method and defensive method
# #         return brd[square] = COMPUTER_MARKER
# #       elsif brd[combo[2]] == PLAYER_MARKER &&
# #         brd[combo[1]] == PLAYER_MARKER &&
# #         brd[combo[0]] == INITIAL_MARKER
# #         square = combo[0] #create winning method and defensive method
# #         return brd[square] = COMPUTER_MARKER
# #       end

#   brd = {1=> 'X',2=> ' ',3=> 'X',4=> 'X',5=> ' ',6=> 'X',7=> ' ',8=> ' ',9=> ' '}
# # p combos = [[1,2,3],[1,3,2], [2,1,3], [2,3,1],[3,1,2],[3,2,1]]


# # combos.each do |combo|
# #       if brd.values_at(*combo).count('X') == 2
# #         p square = brd.values_at(*combo).index(' ')
    
# #     end
# # end  

# winning_lines = [[1,2,3], [4,5,6], [7,8,9]] + #rows
#                   [[1,4,7], [2,5,8], [3,6,9]] + #cols
#                   [[1,5,9], [3,5,7]]

#   winning_lines.each do |line|
#     p combos = line.permutation.to_a
#     combos.each do |combo|
#       if brd.values_at(*combo).count('X') == 2
#         p square = brd.values_at(*combo).count('X')
#         p "-----"
#        p '=>' 
#        p square = brd.select{|k,v| line.include?(k) && v == ' '}.keys.first
        
          
#       p brd
#       end
      

#     end  
#   end

# Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

# Examples:

# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000



# { a: "ant", b: "bear", c: "cat" }.any? do |key, value|
#   value.size > 4
# end
def fl
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
end
end

p fl