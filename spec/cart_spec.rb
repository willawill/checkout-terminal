module CheckoutTerminal
  RSpec.describe Cart do
    subject { Cart.new }

    describe "#initialize" do
      it "creates an empty cart" do
        expect(subject.container).to eq({})
      end
    end

    describe "#add" do
      context "when the product doesn't exist in the cart" do
        it "adds new product to the container" do
          subject.add("A")
          expect(subject.container).to eq({ "A" => 1 })
        end
      end

      context "when the product exists in the cart" do
        it "updates the cart by incrementing the number of the product by one" do
          subject.add("A")
          subject.add("A")
          expect(subject.container).to eq({ "A" => 2 })
        end
      end
    end
  end
end