VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def abbr(choice)
  if choice == 'r'
    'rock'
  elsif choice == 'p'
    'paper'
  elsif choice == 's'
    'scissors'
  elsif choice == 'sp'
    'spock'
  elsif choice == 'l'
    'lizard'
  end
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'lizard' && (second == 'paper' || second == 'spock')) ||
    (first == 'spock' && (second == 'rock' || second == 'scissors'))
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You win!")
  elsif win?(computer, player)
    prompt("You lose!")
  else
    prompt("It is a tie")
  end
end

prompt("Welcome to rock,paper,scissors,spock and lizard.")
prompt("The first to 5 wins, is the winner, get ready!")

player_wins = 0
computer_wins = 0
choice = ''

while player_wins < 5 && computer_wins < 5 do
  loop do
    prompt("Select one: #{VALID_CHOICES.join(', ')}, r:rock, p:paper, s:scissors, l:lizard, sp:spock.")
    choice = Kernel.gets().chomp()
    choice = abbr(choice)
          
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That is not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}, computer chose #{computer_choice}.")

  display_result(choice, computer_choice)
    
  if win?(choice, computer_choice)
    player_wins += 1
  else
    computer_wins += 1
  end

  prompt("The score is player wins:[#{player_wins}] vs computer wins: [#{computer_wins}]")
    
end

prompt("Thank you for playing, Good bye!")