module CheckoutTerminal
  class PriceMap
    attr_reader :container

    def initialize
      @container = {}
    end

    def add(item)
      @container[item.product_code] = { item.unit => item.price }
    end
  end
end