module CheckoutTerminal
  RSpec.describe Checkout do
    let(:price_file) { "A|2|1\n" }
    let(:cart_file) { "A\nA\n" }
    let(:terminal) { instance_double(Terminal, set_price: "prices", set_cart: "carts", checkout: "total") }

    before(:each) do
      allow(Terminal).to receive(:new).and_return(terminal)
      allow_any_instance_of(CheckoutTerminal::Utils).to receive(:read_from_file)
      allow_any_instance_of(CheckoutTerminal::Utils).to receive(:checkout_formatter).and_return("total price")
    end

    describe "initialize" do
      it "has an instance of Terminal" do
        expect(Terminal).to receive(:new)
        Checkout.new
      end
    end

    describe "start" do
      it "sets price_map" do
        expect_terminal_to_call(:set_price)
      end

      it "sets cart" do
        expect_terminal_to_call(:set_cart)
      end

      it "checkouts the cart" do
        expect_terminal_to_call(:checkout)
      end
    end

    private

    def expect_terminal_to_call(method)
      expect(terminal).to receive(method)
      Checkout.new.start(price_file, cart_file)
    end
  end
end