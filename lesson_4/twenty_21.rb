WINNING_NUMB = 21
DEALER_HITS_TIL = WINNING_NUMB - 4

def initialize_deck
  deck = [
    [['hearts'], [['2', 2], ['3', 3], ['4', 4], ['5', 5], ['6', 6], ['7', 7], ['8', 8], 
    ['9', 9], ['10', 10], ['jack', 10], ['queen', 10], ['king', 10], ['ace', 11]]],

    [['spades'], [['2',2], ['3', 3], ['4', 4], ['5', 5], ['6', 6], ['7', 7], ['8', 8],
    ['9', 9], ['10', 10], ['jack',10], ['queen',10], ['king',10], ['ace',11]]],

    [['diamonds'],[['2', 2], ['3', 3], ['4',4], ['5', 5], ['6', 6], ['7', 7], ['8', 8],
    ['9', 9], ['10', 10], ['jack', 10], ['queen', 10], ['king', 10], ['ace',11]]],

    [['clubs'], [['2', 2], ['3', 3], ['4', 4], ['5', 5], ['6', 6], ['7', 7], ['8', 8],
    ['9', 9], ['10', 10], ['jack', 10], ['queen', 10], ['king', 10], ['ace', 11]]]
  ]
end

def total(cards)
  sum = 0
  cards.each { |n| sum += n[2] }

  aces = 0
  cards.select { |card| aces += 1 if card.include?('ace') }
  aces.times { sum -= 10 if sum > WINNING_NUM }

  sum
end

def dealer_stay?(total)
  total >= DEALER_HITS_TIL
end

def deal_to_player(deck, player_cards=[])
  deck.shuffle.each do |card|
    if player_cards.empty?
      player_cards << card[0] + card[1].delete_at(card[1].index(card[1].sample))
      break if player_cards.size == 2
    else
      player_cards << card[0] + card[1].delete_at(card[1].index(card[1].sample))
      break
    end
  end
  player_cards
end

def deal_to_dealer(deck, dealer_cards=[])
  deck.shuffle.each do |card|
    if dealer_cards.empty?
      dealer_cards << card[0] + card[1].delete_at(card[1].index(card[1].sample))
      break if dealer_cards.size == 2
    else
      dealer_cards << card[0] + card[1].delete_at(card[1].index(card[1].sample))
      break
    end
  end
  dealer_cards
end

def busted?(total)
  total > WINNING_NUM
end

def player_output(player_cards)
  message = 'You have: '
  if player_cards.size == 2
    player_cards.each { |card| message += "#{card[1]} of #{card[0]} and " }
    message.slice!(-5..-1)
    puts message
  else
    player_cards.each { |card| message += "#{card[1]} of #{card[0]}, " }
    new_m = message.split
    new_m.insert(-4, 'and')
    new_m[-5].chop!
    new_m[-1].chop!
    puts new_m.join(' ')
  end
end

def dealer_output(dealer_cards)
  message = 'Dealer has: '
  if dealer_cards.size == 2
    dealer_cards.each { |card| message += "#{card[1]} of #{card[0]} and " }
    message.slice!(-5..-1)
    puts message
  else
    dealer_cards.each { |card| message += "#{card[1]} of #{card[0]}, " }
    new_m = message.split
    new_m.insert(-4, 'and')
    new_m[-5].chop!
    new_m[-1].chop!
    puts new_m.join(' ')
  end
end

def keep_playing?
  puts '-----------------------------------'
  puts "Would you like to play again? (y/n?)"
  answer = gets.chomp.downcase
  answer
end

def dealing
  puts "Dealing...."
  sleep(2)
end

def compare(player_cards, dealer_cards)
  if total(player_cards) > total(dealer_cards)
    puts "Player Wins!!!"
    sleep(1.5)
    grand_total(player_cards, dealer_cards)
  elsif total(dealer_cards) > total(player_cards)
    puts "Dealer Wins!!!"
    sleep(1.5)
    grand_total(player_cards, dealer_cards)
  else
    puts "Tie:"
    sleep(1.5)
    grand_total(player_cards, dealer_cards)
  end
end

def grand_total(player_cards, dealer_cards)
  puts SEPERATOR
  puts "You have a total of #{total(player_cards)}"
  player_output(player_cards) 
  puts SEPERATOR
  puts "Dealer has a total of #{total(dealer_cards)}"
  dealer_output(dealer_cards)
end

SEPERATOR = "=" * 64
deck = initialize_deck
p player_wins = 0
p dealer_wins = 0

loop do
  player_cards = []
  dealer_cards = []
  player_cards = deal_to_player(deck)
  dealer_cards = deal_to_dealer(deck)

  puts SEPERATOR
  puts "New Game of #{WINNING_NUM}, Lets Go!!!"
  sleep(1.5)
  dealing
  puts SEPERATOR
  puts "Dealer has: #{dealer_cards[0][1]} of #{dealer_cards[0][0]} and unknown card"
  player_output(player_cards)
  puts SEPERATOR

  loop do
    loop do
      answer = []
      loop do
        puts "hit or stay?"
        answer = gets.chomp.downcase
        break if answer.include?('stay') || answer.include?('hit')
      end
      break if answer == 'stay' || busted?(total(player_cards))
      dealing
      deal_to_player(deck, player_cards)
      player_output(player_cards)
      break if busted?(total(player_cards))
    end

    if busted?(total(player_cards))
      puts "Busted!!! Dealer Wins!"
      grand_total(player_cards, dealer_cards)
      dealer_wins += 1
      break
    end
    puts SEPERATOR

    dealer_total = total(dealer_cards)
    loop do
      dealer_total = total(dealer_cards)
      break if busted?(dealer_total)
      if dealer_stay?(dealer_total)
        puts "Dealer stays"
        sleep(2)
        break
      else
        puts "Dealer hits"
        dealing
        deal_to_dealer(deck, dealer_cards)
      end
    end

    if busted?(dealer_total)
      puts "Busted!!! Player Wins!"
      grand_total(player_cards, dealer_cards)
      player_wins += 1
      break
    end

    puts "Lets see who won!!!"
    sleep(2)

    compare(player_cards, dealer_cards)
    player_wins += 1 if total(player_cards) > total(dealer_cards)
    dealer_wins += 1 if total(dealer_cards) > total(player_cards)
    break
  end
  
  puts SEPERATOR
  puts "Player wins (#{player_wins}), Dealer wins (#{dealer_wins}). First to 5 wins!"
  abort("Player wins (#{player_wins}), Dealer wins (#{dealer_wins}). Thank you for playing, Goodbye!") if player_wins == 5 || dealer_wins == 5
  answer = keep_playing?
  abort("Thank you for playing. Goodbye!") unless answer == 'y'
end
