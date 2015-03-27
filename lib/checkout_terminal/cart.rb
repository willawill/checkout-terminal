module CheckoutTerminal
  class Cart
    attr_reader :container

    def initialize
      @container = {}
    end

    def add(item)
      @container[item] = @container[item].nil? ? 1 : @container[item] + 1
    end
  end
end