# Author: Caroline Wheeler
# 5/26/2020
# Rspec test cases for isSet? and same_or_dif?

require_relative '../cardsGame'
require_relative '../cards'

describe Cards do
  describe 'isSet?' do
    deck = Cards.new
    context 'given [1 empty red circle, 1 striped red circle, 1 solid red circle]' do
      it 'returns true' do
        expect(isSet?([deck.base_deck[12], deck.base_deck[9], deck.base_deck[15]])).eql?(true)
      end
    end

    context 'given [1 solid red square, 2 solid green squares, 3 solid blue squares]' do
      it 'returns true' do
        expect(isSet?([deck.base_deck[6], deck.base_deck[34], deck.base_deck[62]])).eql?(true)
      end
    end

    context 'given [1 solid red square, 2 empty blue triangles, 3 solid green circles]' do
      it 'returns true' do
        expect(isSet?([deck.base_deck[0], deck.base_deck[50], deck.base_deck[70]])).eql?(true)
      end
    end

    context 'given [1 empty green circle, 2 striped green triangles, 3 solid green squares]' do
      it 'returns true' do
        expect(isSet?([deck.base_deck[13], deck.base_deck[46], deck.base_deck[61]])).eql?(true)
      end
    end

    context 'given [2 solid green squares, 2 striped green triangles, 2 solid green circles]' do
      it 'returns false' do
        expect(isSet?([deck.base_deck[34], deck.base_deck[46], deck.base_deck[43]])).eql?(true)
      end
    end

    context 'given [1 empty blue square, 2 empty blue triangles, 3 empty blue squares]' do
      it 'returns false' do
        expect(isSet?([deck.base_deck[5], deck.base_deck[50], deck.base_deck[59]])).eql?(true)
      end
    end

  end
end

