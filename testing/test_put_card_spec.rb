# Created 6/06/2020 by Reema Gupta
# Rspec test cases for the cards.rb source code.
require_relative '../cards.rb'

# Created 6/06/2020 by Reema Gupta
# Test case 1: put cards method
require 'colorize'
describe Cards do
  context "testing put_cards is working correctly" do

    it "should pop three elements from the playdeck to t_cards" do
      set = Cards.new
      card=[]
      t_cards=set.put_cards card
      count = t_cards.count
      expect(count).to eq 3
    end
  end
end

