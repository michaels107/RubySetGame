# File created 5/25/2020 by Sean Michaels
# Edited 5/26/202 by Sean Michaels: Refactored some lines implemented a new method prompting for cards


# Below methods determine if a given set of three cards is a true set
# Author: Caroline Wheeler

# Let's assume a card looks like this - [green, oval, two, empty]

# returns true if given array is a set, and false if not
def isSet?(card_one, card_two, card_three)
  card_arr = [card_one, card_two, card_three]
  # Note: Below line only necessary if we decide to pass an arr instead of individual cards
  return false if card_arr.size != 3
  color_arr = [card_one[0], card_two[0], card_three[0]]
  shape_arr = [card_one[1], card_two[1], card_three[1]]
  num_arr = [card_one[2], card_two[2], card_three[2]]
  shade_arr = [card_one[3], card_two[3], card_three[3]]
  return same_or_dif?(color_arr) && same_or_dif?(shape_arr) && same_or_dif?(num_arr) && same_or_dif?(shade_arr)
end

# returns true if the arr contains all the same element of all different, false otherwise
def same_or_dif? (card_array)
  return card_array.uniq.size != 2
end

# Method to ask the user for 3 cards to see if they're a set.
# Author: Sean Michaels

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
  [cards[card_one.to_i], cards[card_two.to_i], cards[card_three.to_i]]
end

puts 'Welcome to the Set Game!'
require_relative 'cards'
name = Cards.new
puts 'Do you want to start playing[Y/N]:'
ask = gets.chomp  # checks if the user wants to play the game, used later for replay.
play = if ask.eql? 'Y'
         true
       else
         false
       end
tabled_cards = []
while play
  (0..11).each do |i| # prints the cards into 3 rows with 4 columns
    card = name.play_deck[i]
    tabled_cards.push(card)
    if i % 4 == 0 && i != 0
      puts ''
    end
    print(card)
    print(' ')
  end
  puts ''
  selection = select_cards(tabled_cards)
  if isSet?(selection[0], selection[1], selection[2])
    puts 'That was a valid set!'
  else
    puts 'The cards selected were not a valid set, try another selection of cards.'
  end

  puts 'Do you want to play again[Y/N]:' # for the user to replay
  ask = gets.chomp
  play = if ask.eql? 'Y'
           true
         else
           false
         end

  end



