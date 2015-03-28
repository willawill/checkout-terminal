module CheckoutTerminal
  class Calculator
    attr_reader :price_map, :cart
    def initialize(price_map, cart)
      @price_map = price_map
      @cart = cart
    end

    def calculate_for(product)
      raise "Product #{product} doesn't exist" if @price_map.get_price_for(product).nil?

      result = 0
      prices = @price_map.get_price_for(product)
      volume = @cart.get_volume_for(product)
      prices.each do |unit, price|
        result += price * (volume / unit)
        volume = volume % unit
      end
      result
    end

    def calculate_total
      @cart.get_all_products.inject(0) { |acc, product| acc += calculate_for(product) }
    end
  end
end

