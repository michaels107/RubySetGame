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
  end
end
