def require_helper(path)
  Dir[File.dirname(__FILE__) + "/checkout_terminal#{path}*.rb"].each { |file| require file }
end
require_helper("/")
module CheckoutTerminal
end