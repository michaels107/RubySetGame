# File created 5/25/2020 by Sean Michaels
# Edited 5/25/2020 by Sean Michaels
# Edited 5/26/2020 by Caroline Wheeler
# Edited by 5/26/2020 by Sean Michaels
# Debugged 5/26/2020 by Duytan Tran
# Debugged 5/27/2020 by Duytan Tran
# Edited 5/27/2020 by Reema Gupta
# Edited 5/30/2020 by Sean Michaels
# Edited 5/30/2020 By Duytan Tran
# Edited 5/30/2020 By Reema Gupta
# Edited 5/31/2020 By Reema Gupta
# Edited 5/31/2020 By Sean Michaels
# Edited 6/4/2020 By Reema Gupta
# Edited 6/4/2020 By Sean Michaels

require_relative 'cards'
require 'time'

# 2 methods below determine if a given set of three cards is a true set
#
# Author: Caroline Wheeler
# Created on 5/26/2020
# returns true if given array is a set, and false if not
def isSet?(card_arr)
  return true
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
  count
end

# Created on 6/2/202 by Sean Michaels
# Edited on 6/3/2020 by Sean Michaels : Restoring deleted code
# Method to display high scores
def high_score(count, top_list)
  puts 'Do you want to save your score to the current High Score?[Y/N]'

  if gets.chomp.eql? 'Y'
    puts 'Do you have a high score file?[Y/N]'
    if gets.chomp.eql? 'Y'
      print 'Please enter your name (One Word):'
      player = gets.chomp
      print 'Please enter file name plus extension:'
      file_name = gets.chomp
      file = File.open(file_name, 'a') {|f| f.write "#{player} #{count}\n"}
      File.open(file_name, "r") do |f|
        f.each_line do |line|
          player_score = line.split("\n")
          ps = player_score[0].split(" ")
          top_list.store(ps[0], ps[1])
        end
      end
    else #empty

      print 'Please enter your name (One Word):'
      player = gets.chomp
      print 'Please enter name for the file plus a .txt extension:'
      file = File.open(gets.chomp, 'w') {|f| f.write "#{player} #{count}\n" }
      top_list.store(player, count)
    end
    scores_names = top_list.sort { |k, v| k[1] <=> v[1] }.reverse
    puts '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'
    puts '             HIGH SCORE           '
    (0..scores_names.length - 1).each do |i|
      puts "#{i + 1}.)  %-20s --- #{scores_names[i][1]}  " % scores_names[i][0]
    end
  end
end


# Author: Caroline Wheeler
# Created on 6/3/2020
# Displays an example of an invalid set.
def bad1(deck)
  print "\t#{1}) %-39s " % deck[34][4, 20]
  print "\t#{2}) %-39s " % deck[46][4, 20]
  print "\t#{3}) %-39s " % deck[43][4, 20]
  puts 'same color - same number - dif shape'
  puts 'BUT 1 and 3 are both solid, while 2 is striped.'
  puts 'NOT A SET!!'
  puts
end

# Author: Caroline Wheeler
# Created on 6/3/2020
# Displays an example of an invalid set.
def bad2(deck)
  print "\t#{1}) %-39s " % deck[5][4, 20]
  print "\t#{2}) %-39s " % deck[50][4, 20]
  print "\t#{3}) %-39s " % deck[59][4, 20]
  puts 'same color - dif number - same shade'
  puts 'BUT 1 and 3 are both squares, while 2 is triangle.'
  puts 'NOT A SET!!'
  puts
end

# Author: Caroline Wheeler
# Created on 6/3/2020
# Gives examples of invalid sets.
def bad_examples(deck)
  puts 'The following are not valid sets:'
  bad1 deck
  bad2 deck
  print 'Select enter key when done with examples, and game will begin!!'
  gets.chomp.eql? "\n"
end

# Author: Caroline Wheeler
# Created on 6/3/2020
# Displays an example of a valid set.
def valid1(deck)
  print "\t#{1}) %-39s " % deck[12][4, 20]
  print "\t#{2}) %-39s " % deck[9][4, 20]
  print "\t#{3}) %-39s " % deck[15][4, 20]
  puts'same color - same number - same shape - dif shade'
  puts
end

# Author: Caroline Wheeler
# Created on 6/3/2020
# Displays an example of a valid set.
def valid2(deck)
  print "\t#{1}) %-39s " % deck[6][4, 20]
  print "\t#{2}) %-39s " % deck[34][4, 20]
  print "\t#{3}) %-39s " % deck[62][4, 20]
  puts 'dif color - dif number - same shape - same shade'
  puts
end

# Author: Caroline Wheeler
# Created on 6/3/2020
# Displays an example of a valid set.
def valid3(deck)
  print "\t#{1}) %-39s " % deck[0][4, 20]
  print "\t#{2}) %-39s " % deck[50][4, 20]
  print "\t#{3}) %-39s " % deck[70][4, 20]
  puts 'dif color - dif number - dif shape - dif shade'
  puts
end

# Author: Caroline Wheeler
# Created on 6/3/2020
# Displays an example of a valid set.
def valid4(deck)
  print "\t#{1}) %-39s " % deck[13][4, 20]
  print "\t#{2}) %-39s " % deck[46][4, 20]
  print "\t#{3}) %-39s " % deck[61][4, 20]
  puts 'same color - dif number - dif shape - dif shade'
  puts
end

# Author: Caroline Wheeler
# Created on 6/3/2020
# Gives examples of sets.
def examples(deck)
  puts 'The following rows are all examples of valid sets:'
  valid1 deck
  valid2 deck
  valid3 deck
  valid4 deck
  print 'Select enter key when done with examples.'
  gets.chomp.eql? "\n"
end

# Author: Caroline Wheeler
# Created on 6/3/2020
# Prints the rules of set.
def rules
  puts 'Press enter for next instruction.'
  puts
  sleep 0.3
  puts '12 cards will be laid out. Each card has symbols, which vary in SHAPE, COLOR, NUMBER, and SHADE.'
  gets.chomp.eql?"\n"
  puts 'SHAPES: Circle, Triangle, & Square'
  puts 'COLORS: Red, Blue, & Green'
  puts 'NUMBERS: One, Two, & Three'
  puts 'SHADES: Empty, Striped, & Solid'
  gets.chomp.eql?"\n"
  puts 'You will be asked to identify valid sets of 3, which satisfy the following conditions:'
  puts '- They all have the same number or have three different numbers.'
  puts '- They all have the same shape or have three different shapes.'
  puts '- They all have the same shading or have three different shadings.'
  puts '- They all have the same color or have three different colors.'
  puts
  print 'Select enter key when done with instructions.'
  gets.chomp.eql? "\n"
end

# Author: Caroline Wheeler
# Created 6/3/2020
# Runs through rules and examples of how to play.
def tutorial
  puts
  rules
  deck = Visualized.new
  examples deck.base_deck
  bad_examples deck.base_deck
end

def print_all(all)
  (0..all.size).each do |i| # prints the cards into 3 rows with 4 columns
    puts
    print "\t#{i}) %-39s " % all[1][i][4, 20]
    print "\t#{i}) %-39s " % all[2][i][4, 20]
    print "\t#{i}) %-39s " % all[3][i][4, 20]
  end
end
# Created by Sean Michaels and Duytan Tran
# Checks for duplicate cards in the select cards method.
def dupes(*cards)
  card_one, card_two, card_three = *cards
  while card_one.eql?(card_two) || card_one.eql?(card_three) || card_two.eql?(card_three)

    puts 'Duplicates are not allowed. Please select 3 new cards.'
    print 'First card: '
    card_one = gets.chomp
    print 'Second card: '
    card_two = gets.chomp
    print 'Third card: '
    card_three = gets.chomp
  end
  [card_one, card_two, card_three]
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
# Edit 6/3/2020 By Sean Michaels : Got it to quit when the user wants and loop many games
# Method to ask the user for 3 cards to see if they're a set.
def select_cards(cards)
  puts 'Please select 3 cards for your chosen set or enter \'q\' as your first card to quit.'
  printf('First card: ')
  card_one = gets.chomp
  if card_one.eql? 'q'
    puts 'Quiting current game...'
    return ['q']
  else
    printf('Second card: ')
    card_two = gets.chomp
    printf('Third card: ')
    card_three = gets.chomp
    card_one, card_two, card_three = *(dupes card_one, card_two, card_three)
    unless (0...cards.size) === card_one.to_i && (0...cards.size) === card_three.to_i && (0...cards.size) === card_two.to_i

      puts 'A card choice was found to be invalid. Please select 3 new cards.'
      print 'First card: '
      card_one = gets.chomp
      print 'Second card: '
      card_two = gets.chomp
      print 'Third card: '
      card_three = gets.chomp

      card_one, card_two, card_three = *(dupes card_one, card_two, card_three)

    end
    end
  [cards[card_one.to_i], cards[card_two.to_i], cards[card_three.to_i]]

end


# Basically the main
puts 'Welcome to the Set Game!'
name = Visualized.new
print 'Do you want to start playing[Y/N]:'
ask = gets.chomp # checks if the user wants to play the game, used later for replay.
play = ask.eql? 'Y'
count = 0
high_score_list = {}
t_cards = name.tabled_cards
print 'Would you like a tutorial? [Y/N]'
tutorial if gets.chomp.eql? 'Y'

while play && t_cards.size != 0
  t_cards.each_index do |i| # prints the cards into 3 rows with 4 columns
    card = t_cards[i]
    puts if i % 4 == 0 && i != 0
    print "\t#{i}) %-39s " % card[4, 20]
  end
  puts
  all = name.allSets t_cards
  if all.size == 1
  puts "There is 1 possible set in the given deck."
  else if  all.size > 1
  puts "There are #{all.size} possible sets in the given deck."
       else
         "There are no sets in the given deck - we will add more cards."
       end
  end
  puts
  selection = select_cards(t_cards)
  if !selection[0].eql?'q'
    if isSet?(selection)
      puts 'That was a valid set!'
      count = setCount(count)
      t_cards = t_cards-selection
      name.put_cards(t_cards)

   else
    puts 'The cards selected were not a valid set, try another selection of cards.'
   end
  else
    play = false
  end
end



high_score(count, high_score_list) # When game has finished will display current high score