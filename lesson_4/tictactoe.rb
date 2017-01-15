require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
ORDER = 'choose'

def choose_player(order)
  if order == 'choose'
    prompt "Select 1 to go first or 2 to go 2nd:"
    answer = gets.chomp.to_i
    answer == 1 ? current_player = 'player' : current_player = 'computer'
  else
    order == 'player' ? current_player = 'player' : current_player = 'computer'
  end
end

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
  
def initialize_board
  new_board = {}
  (1..9).each {|num| new_board[num] = INITIAL_MARKER}
  new_board
end

def empty_squares(brd)
  brd.keys.select{|num| brd[num] == INITIAL_MARKER}
end

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

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def offensive_attack(brd, winning_lines)
  winning_lines.each do |line|
    combos = line.permutation.to_a
    combos.each do |combo|
      if brd[combo[0]] == COMPUTER_MARKER &&
        brd[combo[1]] == COMPUTER_MARKER &&
        brd[combo[2]] == INITIAL_MARKER
        square = combo[2] #create winning method and defensive method
        return brd[square] = COMPUTER_MARKER
      elsif brd[combo[0]] == COMPUTER_MARKER &&
        brd[combo[2]] == COMPUTER_MARKER &&
        brd[combo[1]] == INITIAL_MARKER
        square = combo[1] #create winning method and defensive method
        return brd[square] = COMPUTER_MARKER
      elsif brd[combo[1]] == COMPUTER_MARKER &&
        brd[combo[0]] == COMPUTER_MARKER &&
        brd[combo[2]] == INITIAL_MARKER
        square = combo[2] #create winning method and defensive method
        return brd[square] = COMPUTER_MARKER
      elsif brd[combo[1]] == COMPUTER_MARKER &&
        brd[combo[2]] == COMPUTER_MARKER &&
        brd[combo[0]] == INITIAL_MARKER
        square = combo[0] #create winning method and defensive method
        return brd[square] = COMPUTER_MARKER
      elsif brd[combo[2]] == COMPUTER_MARKER &&
        brd[combo[0]] == COMPUTER_MARKER &&
        brd[combo[1]] == INITIAL_MARKER
        square = combo[1] #create winning method and defensive method
        return brd[square] = COMPUTER_MARKER
      elsif brd[combo[2]] == COMPUTER_MARKER &&
        brd[combo[1]] == COMPUTER_MARKER &&
        brd[combo[0]] == INITIAL_MARKER
        square = combo[0] #create winning method and defensive method
        return brd[square] = COMPUTER_MARKER
      end
    end  
  end
  nil
end

def defensive_block(brd, winning_lines)
  winning_lines.each do |line|
    combos = line.permutation.to_a
    combos.each do |combo|
      if brd[combo[0]] == PLAYER_MARKER &&
        brd[combo[1]] == PLAYER_MARKER &&
        brd[combo[2]] == INITIAL_MARKER
        square = combo[2] #create winning method and defensive method
        return brd[square] = COMPUTER_MARKER
      elsif brd[combo[0]] == PLAYER_MARKER &&
        brd[combo[2]] == PLAYER_MARKER &&
        brd[combo[1]] == INITIAL_MARKER
        square = combo[1] #create winning method and defensive method
        return brd[square] = COMPUTER_MARKER
      elsif brd[combo[1]] == PLAYER_MARKER &&
        brd[combo[0]] == PLAYER_MARKER &&
        brd[combo[2]] == INITIAL_MARKER
        square = combo[2] #create winning method and defensive method
        return brd[square] = COMPUTER_MARKER
      elsif brd[combo[1]] == PLAYER_MARKER &&
        brd[combo[2]] == PLAYER_MARKER &&
        brd[combo[0]] == INITIAL_MARKER
        square = combo[0] #create winning method and defensive method
        return brd[square] = COMPUTER_MARKER
      elsif brd[combo[2]] == PLAYER_MARKER &&
        brd[combo[0]] == PLAYER_MARKER &&
        brd[combo[1]] == INITIAL_MARKER
        square = combo[1] #create winning method and defensive method
        return brd[square] = COMPUTER_MARKER
      elsif brd[combo[2]] == PLAYER_MARKER &&
        brd[combo[1]] == PLAYER_MARKER &&
        brd[combo[0]] == INITIAL_MARKER
        square = combo[0] #create winning method and defensive method
        return brd[square] = COMPUTER_MARKER
      end
    end  
  end
  nil
end

def computer_places_piece!(brd)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9]] + #rows
                  [[1,4,7], [2,5,8], [3,6,9]] + #cols
                  [[1,5,9], [3,5,7]]
  
  return if !!(offensive_attack(brd, winning_lines)) 
  return if !!(defensive_block(brd, winning_lines))
  if empty_squares(brd).include?(5) 
    square = 5
    brd[square] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9]] + #rows
                  [[1,4,7], [2,5,8], [3,6,9]] + #cols
                  [[1,5,9], [3,5,7]]

  winning_lines.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
       return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
       brd[line[1]] == COMPUTER_MARKER &&
       brd[line[2]] == COMPUTER_MARKER
       return 'Computer'
    end
  end
  nil
end

def alternate_player(current_player)
  current_player == 'player' ? current_player = 'computer' : current_player = 'player'
end

def place_piece!(brd, current_player)
  current_player == 'player' ? player_places_piece!(brd) : computer_places_piece!(brd)
end


player_wins = 0
computer_wins = 0

loop do
  
  current_player = choose_player(ORDER)  
  board = initialize_board
  loop do 
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
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