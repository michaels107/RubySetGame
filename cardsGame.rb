# frozen_string_literal: true
# File created 5/25/2020 by Sean Michaels
# Edited 5/25/2020 by Sean Michaels
# Edited 5/26/2020 by Caroline Wheeler
# Edited by 5/26/2020 by Sean Michaels
# Debugged 5/26/2020 by Duytan Tran
# Debugged 5/27/2020 by Duytan Tran
# Edited 5/27/2020 by Reema Gupta
# Edited 5/30/2020 by Sean Michaels
# Edited 5/30/2020 By Duytan Tran
# Edited 5/30/2020 By Duytan Tran
# Edited 5/31/2020 By Duytan Tran

require_relative 'cards'

# 2 methods below determine if a given set of three cards is a true set
#
# Author: Caroline Wheeler
# Created on 5/26/2020
# returns true if given array is a set, and false if not
def isSet?(card_arr)
  return false if card_arr.size != 3

  color_arr = [card_arr[0][0], card_arr[1][0], card_arr[2][0]]
  shape_arr = [card_arr[0][1], card_arr[1][1], card_arr[2][1]]
  num_arr = [card_arr[0][2], card_arr[1][2], card_arr[2][2]]
  shade_arr = [card_arr[0][3], card_arr[1][3], card_arr[2][3]]
  same_or_dif?(color_arr) && same_or_dif?(shape_arr) && same_or_dif?(num_arr) && same_or_dif?(shade_arr)
end

# Author: Caroline Wheeler
# Created on 5/26/2020
# returns true if the arr contains all the same element of all different, false otherwise
def same_or_dif?(card_arr)
  card_arr.uniq.size != 2
end

# Author: Reema Gupta
# Created on 5/27/2020
# Edited on 5/31/2020 by Sean Michaels : changed the parameter to contain a integer that would count for current game sets found
# method to count the number of  valid sets found depending on the number of  times you have played
def setCount(count)
  count += 1
  puts "the total number of sets found : #{count}"
end

# Author: Reema Gupta
# Created on 5/30/2020
# Edited on 5/31/2020 by Sean Michaels : fixed printing format
# Method to add 3 new cards when a valid set is found
def putCard(card_ar)
  name = Visualized.new
  (9..11).each do |i|
    card = name.play_deck[i]
    card_ar.push card
    puts if i % 4 == 0 && i != 0
    print "\t#{i}) %-39s " % card[4, 20]

  end
  end

# Author: Sean Michaels
# Created on 5/31/2020
# Method to display high scores
def high_score (count, top_list)
  puts 'Do you want to save your score to the current High Score?[Y/N]'

  if gets.chomp.eql? 'Y'
    print 'Please enter name:'
    name = gets.chomp
    top_list.store(name, count)
  end

  scores_names = top_list.sort { |k, v | k[1] <=> v[1] }.reverse
  puts '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'
  puts '             HIGH SCORE           '
  (0..scores_names.length - 1).each do |i|
    puts "#{i + 1}.)  %-20s --- #{scores_names[i][1]}  " % scores_names[i][0]
  end
  puts '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'
end

# Author: Caroline Wheeler
# Created on 6/3/2020
# Prints the rules of set.
def rules
  puts '12 cards will be laid out. Each card has symbols, which vary in SHAPE, COLOR, NUMBER, and FILL.'
  puts 'SHAPES: Circle, Triangle, & Square'
  puts 'COLORS: Red, Blue, & Green'
  puts 'NUMBERS: One, Two, & Three'
  puts 'FILLS: Empty, Striped, & Solid'
  puts 'You will be asked to identify valid sets of 3, which satisfy the following conditions:'
  puts '- They all have the same number or have three different numbers.'
  puts '- They all have the same shape or have three different shapes.'
  puts '- They all have the same shading or have three different shadings.'
  puts '- They all have the same color or have three different colors.'
end

# Author: Caroline Wheeler 
# Created 6/3/2020
# 
def tutorial
  rules
end


# Author: Sean Michaels
# Created 5/26/2017 By Sean Michaels
# Debugged 5/26/2020 By Duytan Tran: Modified the return value to be an array of strings
# Debugged 5/27/2020 By Duytan Tran: Modified value passed in isSet? to be an array
# Edited 5/27/2020 By Reema Gupta: Added the setCount Method Call
# Edited 5/30/2020 By Sean Michaels:Changed the representation of cards to include the visualized format
# Debugged 5/30/2020 By Duytan Tran: Fixed returning array to be elements of parameter cards
# Edited 5/31/2020 By Reema Gupta: Added putCard Method to push 3 cards in when a valid set is found
# Edited 5/31/2020 By Reema Gupta:Included the code for removing a valid set
# Edited 6/2/2020 By Caroline: Changed some syntax
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
  [cards[card_one.to_i], cards[card_two.to_i], cards[card_three.to_i]]
end

puts 'Welcome to the Set Game!'
name = Visualized.new
print 'Do you want to start playing[Y/N]:'
ask = gets.chomp  # checks if the user wants to play the game, used later for replay.
play = ask.eql? 'Y'
tabled_cards = []
count = 0
all_sets = []
high_score_list = {}
if play
  print 'Would you like a tutorial? [Y/N]'
  tutorial if gets.chomp.eql? 'Y'
  puts
  (0..11).each do |i| # prints the cards into 3 rows with 4 columns
    card = name.play_deck[i]
    tabled_cards.push card
    puts if (i % 4).zero? && i != 0
    print "\t#{i}) %-39s " % card[4, 20]
  end
  puts
  puts "There are #{all_sets.size} possible sets in the given deck."
  puts
  selection = select_cards(tabled_cards)
  if isSet?(selection)
    puts 'That was a valid set!'
    count = setCount(count)
    tabled_cards -= selection
    putCard(tabled_cards)
    puts(tabled_cards)
  else
    puts 'The cards selected were not a valid set, try another selection of cards.'

  end


  high_score(count, high_score_list) # When game has finished will display current high score

end