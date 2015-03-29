module CheckoutTerminal
  RSpec.describe PriceMap do
    let(:price_item_for_A) { OpenStruct.new(product_code: "A", unit: "3", price: "5") }
    let(:another_price_item_for_A) { OpenStruct.new(product_code: "A", unit: "1", price: "3") }

    before(:each) do
      subject { PriceMap.new }

    end
    describe "#initialize" do
      it "creates an empty container" do
        expect(subject.container).to eq({})
      end
    end

    describe "#add" do
      context "when the product doesn't exist in the system" do
        it "adds new item when a new product code comes in" do
          subject.add(price_item_for_A)
          expect(subject.container).to eq( {"A" => { 3 => 5 } })
        end
      end

      context "when the product exists in the system" do
        it "updates the product code with new price item" do
          subject.add(price_item_for_A)
          subject.add(another_price_item_for_A)

          expect(subject.container).to eq( { "A" => { 3 => 5, 1 => 3 } })
        end
      end
    end

    describe "#price_for" do
      it "returns the hash of all the prices" do
        subject.add(price_item_for_A)

        expect(subject.price_for("A")).to eq({ 3 => 5 })
      end
    end
  end
end
