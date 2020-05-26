# Created 5/22/2020 By Duytan Tran
# Edited 5/26/2020 By Duytan Tran
=begin
Class that generates two decks of 81 unique cards, one base-deck
and one play-deck. The base deck contains an array of all 81 unique cards and
the play-deck is a shuffled version of the based deck. 
=end
class Cards

  # Created 5/22/2020 By Duytan Tran
  # Edited 5/25/2020 By Duytan Tran: Reimplemented to be terse
  # Edited 5/26/2020 By Duytan Tran: Elements are a string instead of integers
  # Set base deck and randomized play deck creation
  def initialize
    @base_deck = [1, 2, 3].repeated_permutation(4).to_a
    @base_deck.map! { |element_array| element_array.join }
    @play_deck = @base_deck.sample(81)
  end

  # Created 5/22/2020 By Duytan Tran
  # Allows access to the baseDeck
  def base_deck
    @base_deck
  end

  # Created 5/22/2020 By Duytan Tran
  # Allows access to the play_deck
  def play_deck
    @play_deck
  end

  # Created 5/22/2020 By Duytan Tran
  # Edited 5/25/2020 By Duytan Tran: Reimplemented to be terse
  # Prints the cards in the base_deck
  def print_base_deck
    puts "Base deck: "
    @base_deck.each_with_index { |card, i| puts if i != 0 && i % 10 == 0; print "#{card} " }
    puts
  end

  # Created 5/22/2020 By Duytan Tran
  # Edited 5/25/2020 By Duytan Tran: Reimplemented to be terse
  # Prints the cards in the play_deck
  def print_play_deck
    puts "Play deck: "
    @play_deck.each_with_index { |card, i| puts if i != 0 && i % 10 == 0; print "#{card} " }
    puts
  end

end

