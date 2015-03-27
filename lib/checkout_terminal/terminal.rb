module CheckoutTerminal
  class Terminal
    attr_reader :price_map, :cart
    def initialize
      @price_map = PriceMap.new
      @cart = Cart.new
      @calculator = Calculator.new(@price_map, @cart)
    end

    def set_price(input)
      input.split(",").each do |line|
        product_code, unit, price = line.strip.split("|")
        price_unit = OpenStruct.new(product_code: product_code, unit: unit, price: price)
        @price_map.add(price_unit)
      end
      @calculator.price_map = @price_map
    end

    def start_scan(item_list)
      item_list.split("").each do |item|
        @cart.add(item)
      end
      @calculator.cart = @cart
    end

    def checkout
      @calculator.calculate_total
    end
  end
end