module CheckoutTerminal
  class Terminal
    attr_reader :price_map, :cart
    def initialize
      @price_map = PriceMap.new
      @cart = Cart.new
    end

    def set_price(input)
      input.split(",").each do |line|
        product_code, unit, price = line.strip.split("|")
        price_unit = OpenStruct.new(product_code: product_code, unit: unit, price: price)
        @price_map.add(price_unit)
      end
    end

    def start_scan(item_list)
      item_list.split("").each do |item|
        @cart.add(item)
      end
    end

    def checkout
      sum = 0
      @cart.container.each do |item, volume|
        p results = get_prices(item).values().zip(price_combination(item, volume))
        sum += results.inject(0){ |acc, pair| acc += pair[0] * pair[1]}
      end
      sum
    end

    def get_prices(item)
      @price_map.get_price_for(item)
    end

    def price_combination(item, volume)
      units = get_prices(item).keys
      units.map do |unit|
        number = 0
        while volume >= unit do
          number = number + 1
          volume = volume - unit
        end
        number
      end
    end
  end
end