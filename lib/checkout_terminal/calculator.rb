module CheckoutTerminal
  class Calculator
    attr_accessor :price_map, :cart

    def initialize(price_map, cart)
      @price_map = price_map
      @cart = cart
    end

    def get_unit_combination(product)
      units = @price_map.get_price_for(product).keys
      volume = @cart.get_volume_for(product)
      units.map do |unit|
        number = 0
        while volume >= unit do
          number = number + 1
          volume = volume - unit
        end
        number
      end
    end

    def calculate_total
      sum = 0
      @cart.container.each do |item, volume|
        results = @price_map.get_price_for(item).values().zip(get_unit_combination(item))
        sum += results.inject(0){ |acc, pair| acc += pair[0] * pair[1]}
      end
      sum
    end
  end
end

