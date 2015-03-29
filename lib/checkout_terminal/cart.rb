module CheckoutTerminal
  class Cart
    attr_reader :container

    def initialize
      @container = Hash.new(0)
    end

    def add(product)
      @container[product] = @container[product] + 1
    end

    def volume_for(product)
      @container[product]
    end

    def all_products
      @container.keys
    end
  end
end