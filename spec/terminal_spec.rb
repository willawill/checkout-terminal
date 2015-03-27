module CheckoutTerminal
  RSpec.describe Terminal do
    let(:price_input) do
      %Q{ A|1|2,
          B|1|12,
          A|4|7,
          C|1|1.25,
          C|6|6,
          D|1|0.15}
    end

    let(:price_output) do
      { "A" => { 1 => 2, 4 => 7 },
        "B" => { 1 => 12 },
        "C" => { 1 => 1.25, 6 => 6 },
        "D" => { 1 => 0.15 }
      }
    end

    let(:item_list) { "CCCCCCC" }

    describe "#initialize" do
      it "has a PriceMap, Cart" do
        expect(PriceMap).to receive(:new)
        expect(Cart).to receive(:new)
        Terminal.new
      end
    end

    describe "#set_price" do
      it "creates the PriceMap" do
        subject.set_price(price_input)
        expect(subject.price_map.container).to eq(price_output)
      end
    end

    describe "#scan_item" do
      it "reads a stream of items and add to the cart" do
        subject.start_scan(item_list)
        expect(subject.cart.get_volume_for("C")).to eq(7)
      end
    end

    describe "#checkout" do
       { "CCCCCCC" => 7.25,
            "ABCDABAA" => 32.40,
            "ABCD" => 15.40 }
        .each do |item_list, total|
        it "returns the total price for the list of items" do
          subject.set_price(price_input)
          subject.start_scan(item_list)
          total = subject.checkout

          expect(total).to eq(total)
        end
      end
    end
  end
end