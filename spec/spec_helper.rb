require 'rubygems'
require 'bundler/setup'

require 'mongoid-settings'

Mongoid.configure do |config|
  config.connect_to 'mongoid_settings_test'
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before :each do
    Mongoid.purge!
    Mongoid::IdentityMap.clear
  end
end
