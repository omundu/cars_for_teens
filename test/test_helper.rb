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
  
  FakeWeb.register_uri(:get, "http://dbpedia.org/data/Mitsubishi_Pajero.json",
    :content_type => "application/json",
    :body => File.open(File.expand_path(".", "test/files/mitsubishi_pajero.json")).read
  )
  
  FakeWeb.register_uri(:get, "http://www.iihs.org/iihs/ratings/vehicle/v/mitsubishi/pajero/2011",
    :body => File.open(File.expand_path(".", "test/files/safety_rating_sample.html")).read
  )
  
  FakeWeb.register_uri(:get, "http://www.nhtsa.gov/webapi/api/SafetyRatings/modelyear/2012/make/Hyundai/model/veracruz?format=json",
    :content_type => "application/json",
    :body => File.open(File.expand_path(".", "test/files/nhtsa_hyundai_veracruz_trims.json")).read
  )
  
  FakeWeb.register_uri(:get, "http://www.nhtsa.gov/webapi/api/SafetyRatings/VehicleId/6751?format=json",
    :content_type => "application/json",
    :body => File.open(File.expand_path(".", "test/files/nhtsa_hyundai_veracruz_trima.json")).read
  )
  
  FakeWeb.register_uri(:get, "http://www.nhtsa.gov/webapi/api/SafetyRatings/VehicleId/6114?format=json",
    :content_type => "application/json",
    :body => File.open(File.expand_path(".", "test/files/nhtsa_hyundai_veracruz_trimb.json")).read
  )
  
end
