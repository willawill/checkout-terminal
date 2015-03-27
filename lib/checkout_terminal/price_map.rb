module CheckoutTerminal
  class PriceMap
    attr_reader :container

    def initialize
      @container = {}
    end

    def add(item)
      item = reformat(item)
      if @container[item.product_code].nil?
        @container[item.product_code] = { item.unit => item.price}
      else
        @container[item.product_code][item.unit] = item.price
      end
      @container[item.product_code] = reverse_sort_prices(item)
    end

    def get_price_for(product)
      @container[product]
    end

    private

    def reverse_sort_prices(item)
      @container[item.product_code].sort.reverse.to_h
    end

    def reformat(item)
      item.tap do
        item.price = item.price.to_f
        item.unit = item.unit.to_i
      end
    end
  end
end