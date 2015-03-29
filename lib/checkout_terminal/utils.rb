module CheckoutTerminal
  module Utils
    def read_from_file(path)
      if File.exist?(path)
        File.read(path)
      end
    end

    def checkout_formatter(cart, total)
      puts "Scan these items in this order: #{cart.split("\n").join("")}; Verify the total price is $#{total}."
    end
  end
end