# frozen_string_literal: true
# Created 5/22/2020 By Duytan Tran
# Edited 5/26/2020 By Duytan Tran
# Edited 5/28/2020 By Duytan Tran
# Edited 5/30/2020 By Duytan Tran
# Edited 6/2/2020 By Sean Michaels
# Edited 6/3/2020 By Duytan Tran
# Class that generates two decks of 81 unique cards, one base-deck
# and one play-deck. The base deck contains an array of all 81 unique cards and
# the play-deck is a shuffled version of the based deck.
require 'colorize'
class Cards
  # Created 5/22/2020 By Duytan Tran
  # Edited 5/25/2020 By Duytan Tran: Reimplemented to be terse
  # Edited 5/26/2020 By Duytan Tran: Elements are a string instead of integers
  # Set base deck and randomized play deck creation
  def initialize
    @base_deck = [1, 2, 3].repeated_permutation(4).to_a
    @base_deck.map!(&:join)
    @play_deck = @base_deck.sample(81)
    @tabled_deck = []
  end

  # Created 5/22/2020 By Duytan Tran
  # Edited 5/30/2020 By Duytan Tran: Reimplemented as attr_accessor(s)
  # Allows access to the base_deck and play_deck
  attr_accessor :base_deck
  attr_accessor :play_deck

  # Created 5/22/2020 By Duytan Tran
  # Edited 5/25/2020 By Duytan Tran: Reimplemented to be terse
  # Edited 5/28/2020 By Duytan Tran: Reimplemented using reduce
  # Prints the cards in the base_deck
  def print_base_deck
    puts 'Base deck: '
    @base_deck.reduce 0 do |i, card|
      puts if i != 0 && i % 5 == 0
      print "#{card}\t"
      i + 1
    end
    puts
  end

  # Created 5/22/2020 By Duytan Tran
  # Edited 5/25/2020 By Duytan Tran: Reimplemented to be terse
  # Edited 5/28/2020 By Duytan Tran: Reimplemented using reduce
  # Prints the cards in the play_deck
  def print_play_deck
    puts 'Play deck: '
    @play_deck.reduce 0 do |i, card|
      puts if i != 0 && i % 5 == 0
      print "#{card}\t"
      i + 1
    end
    puts
  end

  # Created 6/2/202 By Sean Michaels
  def tabled_cards
    (0..11).each { |i| @tabled_deck.push(@play_deck[i]) }
    @tabled_deck
  end

  # Author: Caroline Wheeler
  # Created on 6/2/2020
  # Given an array of table cards returns an array containing all valid sets
  def all_sets
    set_arr = []
    tabled_cards.each do |i|
      tabled_cards.each do |j|
        tabled_cards.each do |k|
          if i != j && j != k && k != i
            set_arr.push [i, j, k] if isSet? [i, j, k]
          end
        end
      end
    end
    set_arr
  end
end

# Created 5/28/2020 By Duytan Tran
# Edited 5/30/2020 By Duytan Tran: Improved code readability
# Subclass of Cards class that includes visualizations of @base_deck and
# @play_deck. Featuring the use of the gem "colorize", the visualizations
# combine unicode characters with colors that form the shape, shading,
# color, and number properties of the Set card game. Also includes a method
# that reshuffles @play_deck.
class Visualized < Cards
  # Created 5/28/2020 By Duytan Tran
  # Edited 6/3/2020 By Duytan Tran: Made symbolized section more readable
  def initialize
    # Square shades
    striped_square = "\u25A7".encode('utf-8')
    open_square = "\u25A2".encode('utf-8')
    solid_square = "\u25A0".encode('utf-8')
    # Circle shades
    striped_circle = "\u25CD".encode('utf-8')
    open_circle = "\u25EF".encode('utf-8')
    solid_circle = "\u2B24".encode('utf-8')
    # Triangle shades
    striped_triangle = "\u2A3A".encode('utf-8')
    open_triangle = "\u25B3".encode('utf-8')
    solid_triangle = "\u25B2".encode('utf-8')

    # Building symbolic cards
    super
    @base_deck.map! do |card|
      # Shape and shade cases
      symbolized = case card[1, 2]
                   when '11' then striped_square
                   when '21' then striped_circle
                   when '31' then striped_triangle
                   when '12' then open_square
                   when '22' then open_circle
                   when '32' then open_triangle
                   when '13' then solid_square
                   when '23' then solid_circle
                   else solid_triangle
                   end

      # Number of shapes
      symbolized = case card[0]
                   when '2' then symbolized = symbolized + ' ' + symbolized
                   when '3' then symbolized = symbolized + ' ' + symbolized + ' ' + symbolized
                   else symbolized
                   end

      # Color cases
      symbolized = case card[3]
                   when '1' then symbolized.colorize(:red)
                   when '2' then symbolized.colorize(:green)
                   else symbolized.colorize(:blue)
                   end

      # Concatenate symbolized version at the end of each card
      card += symbolized
    end

    # form play_deck w/ symbols
    shuffle
  end

  # Created 5/28/2020 By Duytan Tran
  # Shuffles a brand new @play_deck
  def shuffle
    @play_deck = @base_deck.sample(81)
  end
end
