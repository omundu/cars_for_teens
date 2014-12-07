ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
require "minitest/osx"
require "fakeweb"

Minitest::Reporters.use!

class ActiveSupport::TestCase
  
  FakeWeb.register_uri(:get, "http://www.iihs.org/iihs/ratings/vehicles-for-teens", :body => "You have arrived")
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end
