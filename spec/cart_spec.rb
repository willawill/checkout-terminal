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

        it "adds new product to the container" do
          subject.add("A")
          subject.add("B")
          expect(subject.container).to eq({ "A" => 1, "B" => 1 })
        end
      end

      context "when the product exists in the cart" do
        it "updates the cart by incrementing the number of the product by one" do
          2.times { subject.add("A") }
          expect(subject.container).to eq({ "A" => 2 })
        end
      end
    end

    describe "#all_products" do
      it "returns an array of all the product in the cart" do
        subject.add("A")
        subject.add("B")

        expect(subject.all_products).to eq(["A", "B"])
      end
    end
  end
end