require "checkout_terminal/utils.rb"

module CheckoutTerminal
  class Checkout
    include CheckoutTerminal::Utils

    def initialize
      @terminal = Terminal.new
    end

    def start(price_file, cart_file)
      prices = read_from_file(price_file)
      cart = read_from_file(cart_file)

      @terminal.set_price(prices)
      @terminal.set_cart(cart)

      results = @terminal.checkout

      checkout_formatter(cart, results)
    end
  end
end