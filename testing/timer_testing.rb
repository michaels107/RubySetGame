
describe Cards do
  context "When creating the play_deck of Cards class" do

    it "should produce an array count of 81 elements" do
      set = Cards.new
      count = set.play_deck.count
      expect(count).to eq 81
    end

  end
end