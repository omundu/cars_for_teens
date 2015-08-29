require 'test_helper'

class SafetyRatingsTest < ActiveSupport::TestCase
  
  setup do
    @model_hash = {manufacturer: "Mitsubishi", model: "Pajero", year: 2011}
    @safety_ratings = SafetyRatings.new(@model_hash)
  end
  
  test "ratings" do
    ratings = [
      {:rating_type=>"Moderate overlap front", :rating_value=>"G"},
      {:rating_type=>"Side", :rating_value=>"G"},
      {:rating_type=>"Roof strength", :rating_value=>"G"},
      {:rating_type=>"Head restraints & seats", :rating_value=>"A"}
    ]
    
    assert_equal ratings, @safety_ratings.ratings
  end
  
  test "cached_ratings" do
    ratings = [
      {:rating_type=>"Moderate overlap front", :rating_value=>"G"},
      {:rating_type=>"Side", :rating_value=>"G"},
      {:rating_type=>"Roof strength", :rating_value=>"G"},
      {:rating_type=>"Head restraints & seats", :rating_value=>"A"}
    ]
    Rails.cache.clear
    
    assert_nil Rails.cache.read('mitsubishi/pajero/2011')
    assert_equal ratings, @safety_ratings.cached_ratings
    assert_equal ratings, Rails.cache.read('mitsubishi/pajero/2011')
  end
  
  test "ratings_uri" do
    expected_ratings_uri = "http://www.iihs.org/iihs/ratings/vehicle/v/mitsubishi/pajero/2011"
    
    assert_equal expected_ratings_uri, @safety_ratings.ratings_uri
  end
  
  test "report_uri" do
    expected_report_uri = "http://www.iihs.org/iihs/ratings/vehicle/v/mitsubishi/pajero/2011?print-view"
    
    assert_equal expected_report_uri, @safety_ratings.report_uri
  end
  
  class SanitizeManufacturer < SafetyRatingsTest
    
    test "sanitize_manufacturer" do
      manufacturers = %w{Mitsubishi MITSUBISHI MITSUbishi mitsuBISHI mItSuBiShI MiTsUbIsHi mitsubishi}
      
      manufacturers.each do |manufacturer|
        assert_equal "mitsubishi", @safety_ratings.sanitize_manufacturer(manufacturer)
      end
    end
    
  end
  
  class SanitizeModel < SafetyRatingsTest
    
    test "sanitize_model" do
      models = %w{Pajero PAJERO PAJero pajERO pAjErO PaJeRo pajero}
      
      models.each do |model|
        assert_equal "pajero", @safety_ratings.sanitize_model(model)
      end
    end
    
  end
  
  problem_links = [
    #This model was not produced for this year...final model year 2012
    "http://www.iihs.org/iihs/ratings/vehicle/v/saab/9-5/2013",
    "http://www.iihs.org/iihs/ratings/vehicle/v/saab/9-5/2014",
    #No tests by IIHS for some reason but they still included the car
    "http://www.iihs.org/iihs/ratings/vehicle/v/subaru/outback/2010",
    "http://www.iihs.org/iihs/ratings/vehicle/v/subaru/outback/2011",
    "http://www.iihs.org/iihs/ratings/vehicle/v/subaru/outback/2012",
    "http://www.iihs.org/iihs/ratings/vehicle/v/subaru/outback/2013",
    "http://www.iihs.org/iihs/ratings/vehicle/v/subaru/outback/2014",
    #This model was not produced for this year...last model year 2013
    "http://www.iihs.org/iihs/ratings/vehicle/v/audi/a3-4-door-wagon/2014",
    #This model was not produced for this year...final model year 2011
    "http://www.iihs.org/iihs/ratings/vehicle/v/mercury/milan/2011",
    #No models this year
    "http://www.iihs.org/iihs/ratings/vehicle/v/volkswagen/passat/2011",
    #No tests were done for this model on this year
    "http://www.iihs.org/iihs/ratings/vehicle/v/volvo/c30/2014",
    #This model was not produced for this years...final model year 2011
    "http://www.iihs.org/iihs/ratings/vehicle/v/honda/element/2012",
    "http://www.iihs.org/iihs/ratings/vehicle/v/honda/element/2013",
    "http://www.iihs.org/iihs/ratings/vehicle/v/honda/element/2014",
    #This model was not produced for this year...final model year 2013
    "http://www.iihs.org/iihs/ratings/vehicle/v/infiniti/ex/2014",
    #This model was not produced for this years...final model year 2012
    "http://www.iihs.org/iihs/ratings/vehicle/v/acura/rl/2013",
    "http://www.iihs.org/iihs/ratings/vehicle/v/acura/rl/2014",
    #This model was not produced for this years...final model year 2011
    "http://www.iihs.org/iihs/ratings/vehicle/v/volvo/s40/2012",
    "http://www.iihs.org/iihs/ratings/vehicle/v/volvo/s40/2013",
    "http://www.iihs.org/iihs/ratings/vehicle/v/volvo/s40/2014",
    #This model was not produced for this year...final model year 2013
    "http://www.iihs.org/iihs/ratings/vehicle/v/suzuki/kizashi/2014",
    #This model was not produced for this years...final model year 2011
    "http://www.iihs.org/iihs/ratings/vehicle/v/saab/9-3-4-door-sedan/2012",
    "http://www.iihs.org/iihs/ratings/vehicle/v/saab/9-3-4-door-sedan/2013",
    "http://www.iihs.org/iihs/ratings/vehicle/v/saab/9-3-4-door-sedan/2014",
    #This model was not produced for this years...final model year 2011
    "http://www.iihs.org/iihs/ratings/vehicle/v/mazda/tribute/2012",
    "http://www.iihs.org/iihs/ratings/vehicle/v/mazda/tribute/2013",
    "http://www.iihs.org/iihs/ratings/vehicle/v/mazda/tribute/2014",
    #This model was not produced for this year...final model year 2013
    "http://www.iihs.org/iihs/ratings/vehicle/v/suzuki/grand-vitara/2014",
    #No tests by IIHS for some reason but they still included the car
    "http://www.iihs.org/iihs/ratings/vehicle/v/hyundai/veracruz/2007",
    "http://www.iihs.org/iihs/ratings/vehicle/v/hyundai/veracruz/2008",
    "http://www.iihs.org/iihs/ratings/vehicle/v/hyundai/veracruz/2009",
    "http://www.iihs.org/iihs/ratings/vehicle/v/hyundai/veracruz/2010",
    "http://www.iihs.org/iihs/ratings/vehicle/v/hyundai/veracruz/2011",
    "http://www.iihs.org/iihs/ratings/vehicle/v/hyundai/veracruz/2012",
    "http://www.iihs.org/iihs/ratings/vehicle/v/hyundai/veracruz/2013",
    "http://www.iihs.org/iihs/ratings/vehicle/v/hyundai/veracruz/2014",
    #No tests by IIHS for some reason but they still included the car
    "http://www.iihs.org/iihs/ratings/vehicle/v/kia/sedona/2013"
  ]
end