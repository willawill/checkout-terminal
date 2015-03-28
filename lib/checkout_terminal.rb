require "ostruct"

require "pry"

def require_helper(path)
  Dir[File.dirname(__FILE__) + "/checkout_terminal#{path}*.rb"].each do |file|
    require file
  end
end


module CheckoutTerminal
end

require_helper("/")
