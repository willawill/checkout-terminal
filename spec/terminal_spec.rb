module CheckoutTerminal
  RSpec.describe Terminal do
    let(:price_input) do
      %Q{ A|1|2
          B|1|12
          A|4|7
          C|1|1.25
          C|6|6
          D|1|0.15}
    end

    let(:price_output) do
      { "A" => { 4 => 7, 1 => 2 },
        "B" => { 1 => 12 },
        "C" => { 6 => 6, 1 => 1.25 },
        "D" => { 1 => 0.15 }
      }
    end

    let(:item_list) { "C\nC\nC\nC\nC\nC\nC\n" }

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

    describe "#set_cart" do
      it "reads a stream of items and add to the cart" do
        subject.set_cart(item_list)
        expect(subject.cart.quantity_for("C")).to eq(7)
      end
    end

    describe "#checkout" do
       {
        %Q{C\nC\nC\nC\nC\nC\nC\n}=> 7.25,
        %Q{A\nB\nC\nD\nA\nB\nA\nA\n} => 32.40,
        %Q{A\nB\nC\nD\n} => 15.40,
        %Q{} => 0 }
        .each do |item_list, total_price|
        it "returns the total price for the list of #{item_list.split("\n").join("")}" do
          subject.set_price(price_input)
          subject.set_cart(item_list)
          total = subject.checkout

          expect(total).to eq(total_price)
        end
      end
    end
  end
end