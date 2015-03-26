require "ostruct"
def require_helper(path)
  Dir[File.dirname(__FILE__) + "/checkout_terminal#{path}*.rb"].each do |file|
    require file
  end
end

require_helper("/")

module CheckoutTerminal
end
