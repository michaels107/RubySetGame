# File created 5/25/2020 by Sean Michaels
puts "Welcome to the Set Game!"
require_relative 'cards'
name = Cards.new
puts "Do you want to start playing[Y/N]:"
ask = gets.chomp  #checks if the user wants to play the game, used later for replay.
if ask.eql? "Y"
  play = true
else
  play = false
end
while play
  for i in 0..11 # prints the cards into 3 rows with 4 columns
    card = name.play_deck[i]
    if i%4 == 0 && i != 0
      puts ""
    end
    print(card)
    print(' ')
  end
  puts ""

  puts "Do you want to play again[Y/N]:" #for the user to replay
  ask = gets.chomp
  if ask.eql? "Y"
    play = true
  else
    play = false
  end
end

