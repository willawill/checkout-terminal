module CheckoutTerminal
  class Checkout
    def initialize
      @terminal = Terminal.new
    end

    def start_checkout(price_file, cart_file)
      prices = read_from_file(price_file)
      cart = read_from_file(cart_file)

      @terminal.set_price(prices)
      @terminal.set_cart(cart)

      results = @terminal.checkout

      checkout_formatter(cart, results)
    end

    def read_from_file(path)
      if File.exist?(path)
        File.read(path)
      end
    end

    def checkout_formatter(cart, total)
      puts "Scan these items in this order: #{cart.split("\n").join("")}; Verify the total price is $#{total}."
    end
  end
end