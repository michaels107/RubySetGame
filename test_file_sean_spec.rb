# Created 6/2/2020 By Sean Michaels
# Edited 6/2/2020 By Sean Michaels
# Rspec test cases for the cards.rb source code and cardsGame.rb.
#
require_relative 'cardsGame'
require_relative 'cards'
require 'colorize'
require 'time'
require 'timeout'

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

# Created 6/5/2020 By Sean Michaels
# Test case 2: dupes method testing to make sure it only returns now dupes.
describe CardsGame do
  context "dupes method testing to make sure it only returns non-dupes." do

    it "should return not duplicate element array" do
      set = Cards.new
      card_one, card_two, card_three = 1,2,3
      card_one, card_two, card_three = *(dupes card_one, card_two, card_three)
      t_cards = set.tabled_cards
      expect(card_one, card_two, card_three).to eq 1,2,3
    end

  end
end

# Created 6/5/2020 By Sean Michaels
# Test case 2: dupes method testing to make sure it only returns now dupes.
describe CardsGame do
  context "dupes method testing to make sure it only returns non-dupes." do

    it "should go into the dupes method and prompt the user to enter new cards because they are dupes" do
      set = Cards.new
      card_one, card_two, card_three = 1,2,2
      card_one, card_two, card_three = *(dupes card_one, card_two, card_three)
      t_cards = set.tabled_cards
      expect(card_one, card_two, card_three).to eq 1,2,3
    end

  end
end
