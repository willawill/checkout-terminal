module CheckoutTerminal
  class Terminal
    attr_reader :price_map, :cart

    def initialize
      @price_map = PriceMap.new
      @cart = Cart.new
    end

    def set_price(input)
      input.split("\n").each do |line|
        product_code, unit, price = line.strip.split("|")
        price_unit = OpenStruct.new(product_code: product_code, unit: unit, price: price)
        @price_map.add(price_unit)
      end
    end

    def set_cart(item_list)
      item_list.split("\n").each do |item|
        @cart.add(item.strip)
      end
    end

    def checkout
      Calculator.new(@price_map, @cart).calculate_total
    end
  end
end