#Checkout Terminal

##To run

Change the content of price.txt or cart.txt to run with other settings.

* `cd checkout-terminal`
* `bundle install`
* `ruby bin/termial`

`bundle exec rake` or `bundle exec rake spec` will run the test suite.


##Solution
This is a really simple solution in Ruby 2.2 (MRI).
* Features

  - Stateless calculator for checkout
  - Error handling for product doesn't exist in the system
  - File based input for setting price and scanning products
  - Built with TDD fashion with Rspec

* TODO:

  * Logging system
  * Better documentation
  * Turning the solution into a terminal interactive app