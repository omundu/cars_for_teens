ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
require "minitest/osx"
# require "minitest/pride"
require "fakeweb"

Minitest::Reporters.use!

class ActiveSupport::TestCase
  FakeWeb.register_uri(:get, "http://www.iihs.org/iihs/ratings/vehicles-for-teens", :body => "You have arrived")
  FakeWeb.register_uri(:get, "http://dbpedia.org/data/Mitsubishi_Motors.json",
    :content_type => "application/json",
    :body => File.open(File.expand_path(".", "test/files/mitsubishi_motors.json")).read
  )
end
