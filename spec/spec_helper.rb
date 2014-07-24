require 'simplecov'
SimpleCov.start

require 'secretkey'
require 'faker'
require 'byebug'

RSpec.configure do |config|

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.color = true

  config.order = :random

end