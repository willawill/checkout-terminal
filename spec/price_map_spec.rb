module CheckoutTerminal
  RSpec.describe PriceMap do
    subject { PriceMap.new }

    describe "#initialize" do
      it "creates an empty container" do
        expect(subject.container).to eq({})
      end
    end
  end
end