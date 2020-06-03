# Created 6/2/2020 By Sean Michaels
# Edited 6/2/2020 By Sean Michaels
# Rspec test cases for the cards.rb source code.
require_relative 'cards'
require 'colorize'

# Created 5/24/2020 By Sean Michaels
# Test case 1: tabled cards method
describe Cards do
  context "Testing that the tabled deck creating properly" do

    it "should create a tabled deck that has the first 12 shuffled cards" do
      set = Cards.new
      first_twelve = []
      (0..11).each {|i|
        first_twelve.push set.play_deck[i]
      }
      t_cards = set.tabled_cards
      expect(t_cards).to eq first_twelve
    end

  end
end
