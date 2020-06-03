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
# Edited 6/2/2020 By Sean Michaels

require_relative 'cards'

# Below methods determine if a given set of three cards is a true set
# Author: Caroline Wheeler
# Created on 5/26/2020

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

# Author: Reema Gupta
# Created on 5/27/2020
# Edited on 5/31/2020 by Sean Michaels : changed the parameter to contain a integer that would count for current game sets found
# method to count the number of  valid sets found depending on the number of  times you have played
# Edited on 6/2/2020

def setCount(count)
  count += 1
  puts "the total number of sets found : #{count}"
  count
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
# Edited on 6/2/2020 by Sean Michaels : Edited it to either create a .txt file or read from .txt file thats in the directory
# Method to display high scores
#
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
  puts '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'
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

# Main
puts 'Welcome to the Set Game!'
name = Visualized.new
print 'Do you want to start playing[Y/N]:'
ask = gets.chomp # checks if the user wants to play the game, used later for replay.
play = ask.eql? 'Y'
t_cards = name.tabled_cards
count = 0
high_score_list = {}
if play
  t_cards.each_index do |i| # prints the cards into 3 rows with 4 columns
    card = t_cards[i]
    puts if i % 4 == 0 && i != 0
    print "\t#{i}) %-39s " % card[4, 20]
  end
  puts
  selection = select_cards(t_cards)
  if isSet?(selection)
    puts 'That was a valid set!'
    count = setCount(count)
    t_cards -= selection
    putCard(t_cards)
    puts(t_cards)
  else
    puts 'The cards selected were not a valid set, try another selection of cards.'

  end

  high_score(count, high_score_list) # When game has finished will display current high score

end
