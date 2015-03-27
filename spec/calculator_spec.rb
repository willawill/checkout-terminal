module CheckoutTerminal
  RSpec.describe Calculator do
    let(:price_units) { { 4 => 7, 1 => 2} }
    let(:price_map) do
      instance_double(PriceMap, get_price_for: price_units)
    end

    let(:cart) { instance_double(Cart) }
    subject { Calculator.new(price_map, cart) }

    describe "#initialize" do
      it "has price_map and cart passed in" do
        expect(subject.price_map).to eq(price_map)
        expect(subject.cart).to eq(cart)
      end
    end

    describe "#get_unit_combination" do
      it "returns an array of the number of each unit" do
        allow(price_map).to receive(:get_price_for).and_return(price_units)
        allow(cart).to receive(:get_volume_for).and_return(1)

        combo = subject.get_unit_combination("A")
        expect(combo).to eq([0, 1])
      end
    end
  end
end