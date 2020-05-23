# Created 5/22/2020 By Duytan Tran
=begin
Class that generates two decks of 81 unique cards, one base-deck
and one play-deck. The base deck contains an array of all 81 unique cards and
the play-deck starts with a shuffled version of the based deck. The
play-deck can then be reduced in intervals of 12 as it distributes cards 
in the game of Set. The properties of each card is represented as a single
integer in each digit position.
=end
class Cards

  # Created 5/22/2020 By Duytan Tran
  # Set base deck and randomized play deck creation
  def initialize
    @base_deck = Array.new 41
    pos = 0
    for color in 1..3
      for number in 1..3
        for shape in 1..3
          for shade in 1..3
            @base_deck.insert(pos, "#{color}#{number}#{shape}#{shade}".to_i)
            pos += 1
          end
        end
      end
    end
    @base_deck = @base_deck.compact
    @play_deck = @base_deck.sample(81).compact
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
  # Prints the cards in the base_deck
  def print_base_deck
    puts "Base deck: "
    for i in 0...81
      puts if i % 10 == 0 && i != 0
      print "#{@base_deck[i]} "
    end
    puts
  end

  # Created 5/22/2020 By Duytan Tran
  # Prints the cards in the play_deck
  def print_play_deck
    puts "Play deck: "
    for i in 0...@play_deck.length
      puts if i %10 == 0 && i != 0
      print "#{@play_deck[i]} "
    end
    puts
  end

end

