# Created 6/02/2020 by Sean Michaels
# Edited  6/02/2020 by Sean Michaels
# Rspec test cases for the cards.rb source code and cardsGame.rb.

require_relative '../cardsGame.rb'
require_relative '../cards.rb'
require 'colorize'

# Created 5/24/2020 by Sean Michaels
# Test case 1: tabled cards method
describe Cards do
  context "Testing that the tabled deck creating properly" do

    it "should create a tabled deck that has the first 12 shuffled cards" do
      set = Cards.new
      t_cards = set.tabled_cards
      expect(t_cards.length).to be 12
    end

  end
end

# Created 6/05/2020 by Sean Michaels
# Test case 2: checks the hash for the highscores
describe Cards do
  context "checks the hash is right for the high score" do

    it "should have an name and a score as a key and value" do
      set = Cards.new
      high_score_list = {}
      high_score_list.store 'Sean',12
      expect(high_score_list['Sean']).to eq 12
    end

  end
end

# Created 6/05/2020 by Sean Michaels
# Test case 3: checks the hash for the highscores with another value in it
describe Cards do
  context "checks the hash is right for the high score" do

    it "should have an name and a score as a key and value" do
      set = Cards.new
      high_score_list = {}
      high_score_list.store 'Sean',12
      high_score_list.store 'BobbyLee',8
      expect(high_score_list['BobbyLee']).to eq 8
    end

  end
end
