# 1.) Why can't we just replace all calls to total with a local variable? What's the key to watch out for 
# when using a local variable to cache expensive calculations?

# We won't be able to access our local variable within our methods if we plan to replace the total method
# The key is figuring out when to invalidate that cached value (the variable) and recalculate it

# 2.) We use the play_again? three times: after the player busts, after the dealer busts, or after both
# participants stay and compare cards. Why is the last call to play_again? a little different from the previous two?
# The first two breaks will run next if they are true and skip back up to the top,
# the last break statement will break the loop and end the game if false, no need
# to use next , being that it is the last line of code.

# 3.) Ending the round. As mentioned above, there are 3 places where the round can end
 # and we call play_again? each time. But another improvement we'd like to make is to give
 # it a consistent end-of-round output. Right now, we get a grand output only after comparing cards.
 #  Can we extract this to a method and use it in the other two end-of-round areas?

def grand_output(player_cards, dealer_cards)
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts "=============="
end

if busted?(player_cards)
  grand_output(player_cards, dealer_cards)
  display_result(dealer_cards, player_cards)
  play_again? ? next : break
else
  prompt "You stayed at #{total(player_cards)}"
end

if busted?(dealer_cards)
  prompt "Dealer total is now: #{total(dealer_cards)}"
  grand_output(player_cards, dealer_cards)
  display_result(dealer_cards, player_cards)
  play_again? ? next : break
else
  prompt "Dealer stays at #{total(dealer_cards)}"
end

# 4 is has been added to the twenty_21.rb file
# 5 is has been added to the twenty_21.rb file