module CheckoutTerminal
  class PriceMap
    attr_reader :container

    def initialize
      @container = Hash.new({})
    end

    def add(product)
      product = reformat(product)
      @container[product.product_code][product.unit] = product.price
      @container[product.product_code] = sort_by_bulk(product)
    end

    def price_for(product)
      @container[product]
    end

    private

    def sort_by_bulk(product)
      @container[product.product_code].sort.reverse.to_h
    end

    def reformat(product)
      product.tap do
        product.price = product.price.to_f
        product.unit = product.unit.to_i
      end
    end
  end
end