# Created 5/23/2020 By Duytan Tran
=begin
  Test cases for the cards.rb source code.
=end
require_relative 'cards'

# Created 5/22/2020 By Duytan Tran
# Test case 1: base_deck and play_deck formation/count
puts "Test case 1"
set = Cards.new
set.print_base_deck
set.print_play_deck
puts "Expected |base_deck| = 81, Actual |base_deck| = #{set.base_deck.count}"
puts "Expected |play_deck| = 81, Actual |play_deck| = #{set.play_deck.count}"
puts

# Created 5/22/2020 By Duytan Tran
# Test case 2: play_deck is a permutation of base_deck
puts "Test case 2"
set = Cards.new
i = 0
matches = true
while i < 81 && matches
  matches = set.play_deck.include? set.base_deck[i]
  puts "#{set.base_deck[i]} contained in play_deck? #{matches}"
  i += 1
end
puts "All cards in base_deck are represented in play_deck: #{matches}"
puts

