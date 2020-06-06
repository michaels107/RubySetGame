# Created 5/26/2020 by Caroline Wheeler
# Rspec test cases for isSet? and same_or_dif?

require_relative '../cards.rb'

describe Cards do
  describe 'allSets' do
    deck = Cards.new
    context 'given []' do
      it 'returns []' do
        expect(deck.allSets([]).eql?([]))
      end
    end

    context 'given []' do
      it 'returns []' do
        expect(deck.base_deck.allSets([deck.base_deck[0], deck.base_deck[1], deck.base_deck[2]])).eql?([deck.base_deck[0], deck.base_deck[1], deck.base_deck[2]])
      end
    end
  end
end
