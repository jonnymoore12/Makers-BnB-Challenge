describe Space do
  let!(:space) { Space.create(name: "Villa",
                             price: 123,
                             available_from: "1/12/2019",
                             available_to: "30/12/2019")
  }

  describe "#is_available?" do
    it "returns true if the date is available to book" do
      expect(space.is_available?("13/12/2019")).to eq true
    end
    it "returns false if the date is not available to book" do
      expect(space.is_available?("1/11/2019")).to eq false
    end
  end
end
