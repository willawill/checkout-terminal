module CheckoutTerminal
  RSpec.describe PriceMap do
    subject { PriceMap.new }
    let(:item) { OpenStruct.new(product_code: "A", unit: "3", price: "5") }

    describe "#initialize" do
      it "creates an empty container" do
        expect(subject.container).to eq({})
      end
    end

    describe "#add" do
      it "adds new item when a new product code comes in" do
        subject.add(item)
        expect(subject.container).to eq( {"A" => { "3" => "5" } })
      end
    end
  end
end
