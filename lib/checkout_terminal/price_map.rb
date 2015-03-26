module CheckoutTerminal
  class PriceMap
    attr_reader :container

    def initialize
      @container = {}
    end

    def add(item)
      if @container[item.product_code].nil?
        @container[item.product_code] = { item.unit => item.price }
      else
        @container[item.product_code][item.unit] = item.price
      end
    end
  end
end