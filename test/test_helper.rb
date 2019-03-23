ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
# require "minitest/notification"
require "minitest/pride"
require "fakeweb"

Minitest::Reporters.use!

class ActiveSupport::TestCase
  FakeWeb.register_uri(:get, "https://www.iihs.org/iihs/ratings/vehicles-for-teens", :body => "You have arrived")

  FakeWeb.register_uri(:get, "http://dbpedia.org/data/Mitsubishi_Motors.json",
    :content_type => "application/json",
    :body => File.open(File.expand_path(".", "test/files/mitsubishi_motors.json")).read
  )

  FakeWeb.register_uri(:get, "http://dbpedia.org/data/Mitsubishi_Pajero.json",
    :content_type => "application/json",
    :body => File.open(File.expand_path(".", "test/files/mitsubishi_pajero.json")).read
  )

  FakeWeb.register_uri(:get, "https://www.iihs.org/iihs/ratings/vehicle/v/mitsubishi/pajero/2011",
    :body => File.open(File.expand_path(".", "test/files/safety_rating_sample.html")).read
  )
end
