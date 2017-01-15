# Write a method called joinor that will produce the following 
# result:

joinor([1, 2])                   # => "1 or 2"
joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

# Then, use this method in the TTT game when prompting the user
# to mark a square.

#Answer
def joinor(arr, delimiter=',', word='or')
  if arr.size > 2
    arr.insert(-2,word)
    arr_new = arr.join(delimiter + " ").split
    arr_new[-2].delete!(delimiter)
    arr_new.join(' ')
  elsif arr.size == 2
    arr.insert(-2,word).join(' ')
  else
    arr[0].to_s   
  end
end

#-------------------------------------------------------------

player_wins = 0
computer_wins = 0

loop do
  board = initialize_board

  loop do 
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)
  someone_won?(board) ? prompt("#{detect_winner(board)} won!") : prompt("It's a tie!")
  if detect_winner(board) == 'Player' then player_wins += 1 end 
  if detect_winner(board) == 'Computer' then computer_wins += 1 end
  break if player_wins == 5 || computer_wins == 5

  prompt "Score: Player victories (#{player_wins}) vs Computer victories (#{computer_wins}). First to 5! wins the battle!"
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Final score: Player(#{player_wins}) vs Computer(#{computer_wins}). Thanks for playing tic tac tow, Good bye!"


 #5
 loop do
  if ORDER == 'choose'
    prompt "Would you like to go 1st or 2nd? (1 for 1st, 2 for 2nd):"
    answer = gets.chomp.to_i
  end    
  board = initialize_board

  loop do 
    display_board(board)
    answer == 1 || ORDER == 'player' ? player_places_piece!(board) : computer_places_piece!(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
    (answer != 1 && answer != nil) || (ORDER != 'player' && answer != 1) ? player_places_piece!(board) : computer_places_piece!(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
  end