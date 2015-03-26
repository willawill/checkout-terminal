require_relative "../lib/checkout_terminal"

RSpec.configure do |config|
  config.order = :random
  config.color = true
  config.default_formatter = :documentation
  Kernel.srand config.seed
end