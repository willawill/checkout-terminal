module CheckoutTerminal
  RSpec.describe Calculator do
    let(:price_units) { { 4 => 7, 1 => 2 } }
    let(:price_map) do
      instance_double(PriceMap, price_for: nil )
    end

    let(:cart) { instance_double(Cart, volume_for: 10, all_products: ["A", "B"] ) }

    subject { Calculator.new(price_map, cart) }

    describe "#initialize" do
      it "has price_map and cart passed in" do
        expect(subject.price_map).to eq(price_map)
        expect(subject.cart).to eq(cart)
      end
    end

    describe "#calculate_for" do
      it "raises an exception when the product doesn't exist" do
        expect{ subject.calculate_for("FOO") }.to raise_error("Product FOO doesn't exist")
      end

      context 'when the product exists in the system' do
        before do
          allow(price_map).to receive(:price_for).and_return(price_units)
        end

        it "gets all the price units from price_map" do
          expect(price_map).to receive(:price_for).with("A")
          subject.calculate_for("A")
        end

        it "gets the volume of the product in the cart" do
          expect(cart).to receive(:volume_for).with("A")
          subject.calculate_for("A")
        end

        it "satisfies the bulk price first" do
          expect(subject.calculate_for("A")).to eq(18)
        end
      end
    end

    describe "#calculate_total" do
      before do
        allow(subject).to receive(:calculate_for).and_return(10)
      end

      it "adds prices for all the product" do
        expect(subject).to receive(:calculate_for).twice
        subject.calculate_total
      end

      it "returns the total price of the cart" do
        expect(subject.calculate_total).to eq(20)
      end
    end
  end
end