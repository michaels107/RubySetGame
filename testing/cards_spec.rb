# Created 5/24/2020 by Duytan Tran
# Edited 5/29/2020  by Duytan Tran
# Rspec test cases for the cards.rb source code.
require_relative '../cards.rb'
require 'colorize'

# Created 5/24/2020 by Duytan Tran
# Test case 1: base_deck count
describe Cards do
  context "When creating the base_deck of Cards class" do

    it "should produce an array count of 81 elements" do
      set = Cards.new
      count = set.base_deck.count
      expect(count).to eq 81
    end

  end
end

# Created 5/24/2020 by Duytan Tran
# Test case 2: base_deck composition
describe Cards do
  context "When creating the base_deck of Cards class" do

    it "should produce an array consisting of 81 unique Set cards" do
      set = Cards.new
      expSet = ['1111', '1112', '1113', '1121', '1122', '1123', '1131', '1132', '1133', '1211',
		'1212', '1213', '1221', '1222', '1223', '1231', '1232', '1233', '1311', '1312',
		'1313', '1321', '1322', '1323', '1331', '1332', '1333', '2111', '2112', '2113',
		'2121', '2122', '2123', '2131', '2132', '2133', '2211', '2212', '2213', '2221',
		'2222', '2223', '2231', '2232', '2233', '2311', '2312', '2313', '2321', '2322',
		'2323', '2331', '2332', '2333', '3111', '3112', '3113', '3121', '3122', '3123',
		'3131', '3132', '3133', '3211', '3212', '3213', '3221', '3222', '3223', '3231',
		'3232', '3233', '3311', '3312', '3313', '3321', '3322', '3323', '3331', '3332', '3333']
      expect(set.base_deck == expSet).to eq true      
    end

  end
end

# Created 5/24/2020 by Duytan Tran
# Test case 3: play_deck count
describe Cards do
  context "When creating the play_deck of Cards class" do

    it "should produce an array count of 81 elements" do
      set = Cards.new
      count = set.play_deck.count
      expect(count).to eq 81
    end

  end
end

# Created 5/24/2020 by Duytan Tran
# Test case 4: play_deck composition
describe Cards do
  context "When creating the play_deck of Cards class" do

    it "should produce an permutation of base_deck" do
      set = Cards.new
      expSet = ['1111', '1112', '1113', '1121', '1122', '1123', '1131', '1132', '1133', '1211',
		'1212', '1213', '1221', '1222', '1223', '1231', '1232', '1233', '1311', '1312',
		'1313', '1321', '1322', '1323', '1331', '1332', '1333', '2111', '2112', '2113',
		'2121', '2122', '2123', '2131', '2132', '2133', '2211', '2212', '2213', '2221',
		'2222', '2223', '2231', '2232', '2233', '2311', '2312', '2313', '2321', '2322',
		'2323', '2331', '2332', '2333', '3111', '3112', '3113', '3121', '3122', '3123',
		'3131', '3132', '3133', '3211', '3212', '3213', '3221', '3222', '3223', '3231',
		'3232', '3233', '3311', '3312', '3313', '3321', '3322', '3323', '3331', '3332', '3333']
      expect(set.play_deck.sort == expSet.sort).to eq true      
    end

  end
end

# Created 5/29/2020 by Duytan Tran
# Test case 5: visualized base_deck count
describe Cards do
  context "When creating the base_deck of Visualized class" do

    it "should produce an array count of 81 elements" do
      set = Visualized.new
      count = set.base_deck.count
      expect(count).to eq 81
    end

  end
end

# Created 5/29/2020 by Duytan Tran
# Test case 6: visualized play_deck count
describe Cards do
  context "When creating the play_deck of Visualized class" do

    it "should produce an array count of 81 elements" do
      set = Visualized.new
      count = set.play_deck.count
      expect(count).to eq 81
    end

  end
end

# Created 5/29/2020 by Duytan Tran
# Test case 7: visualized play_deck is a permutation of base_deck
describe Cards do
  context "When creating the play_deck of Visualized class" do

    it "should produce an permutation of base_deck" do
      set = Visualized.new
      expect(set.play_deck.sort == set.base_deck.sort).to eq true      
    end

  end
end

