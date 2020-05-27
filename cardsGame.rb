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


# Below methods determine if a given set of three cards is a true set
# Author: Caroline Wheeler
# 5/26/2020

# Let's assume a card looks like this - [green, oval, two, empty]

# returns true if given array is a set, and false if not
def isSet?(card_arr)
  return false if card_arr.size != 3

  color_arr = [card_arr[0][0], card_arr[1][0], card_arr[2][0]]
  shape_arr = [card_arr[0][1], card_arr[1][1], card_arr[2][1]]
  num_arr = [card_arr[0][2], card_arr[1][2], card_arr[2][2]]
  shade_arr = [card_arr[0][3], card_arr[1][3], card_arr[2][3]]
  same_or_dif?(color_arr) && same_or_dif?(shape_arr) && same_or_dif?(num_arr) && same_or_dif?(shade_arr)
end

# returns true if the arr contains all the same element of all different, false otherwise
def same_or_dif?(card_arr)
  card_arr.uniq.size != 2
end

# Author: Sean Michaels
# Debugged 5/26/2020 By Duytan Tran: Modified the return value to be an array of strings
# Debugged 5/27/2020 By Duytan Tran: Modified value passed in isSet? to be an array
# Method to ask the user for 3 cards to see if they're a set.
def select_cards(cards)
  puts 'Please select 3 cards for your chosen set.'
  printf('First card: ')
  card_one = gets.chomp
  printf('Second card: ')
  card_two = gets.chomp
  printf('Third card: ')
  card_three = gets.chomp

  while card_one.eql?(card_three) || card_one.eql?(card_two) || card_two.eql?(card_three)

    puts 'There was a duplicate card selected. Please select non-duplicate cards.'
    puts 'Please select 3 cards for your chosen set.'
    printf('First card: ')
    card_one = gets.chomp
    printf('Second card: ')
    card_two = gets.chomp
    printf('Third card: ')
    card_three = gets.chomp
  end
  [card_one, card_two, card_three]
end

puts 'Welcome to the Set Game!'
name = Cards.new
puts 'Do you want to start playing[Y/N]:'
ask = gets.chomp  # checks if the user wants to play the game, used later for replay.
play = ask.eql? 'Y'
tabled_cards = []
while play
  (0..11).each do |i| # prints the cards into 3 rows with 4 columns
    card = name.play_deck[i]
    tabled_cards.push card
    puts if i % 4 == 0 && i != 0
    print card + " "
  end
  puts ''
  selection = select_cards(tabled_cards)
  if isSet?(selection)
    puts 'That was a valid set!'
  else
    puts 'The cards selected were not a valid set, try another selection of cards.'
  end

  puts 'Do you want to play again[Y/N]:' # for the user to replay
  ask = gets.chomp
  play = ask.eql? 'Y'
end
