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
  
end