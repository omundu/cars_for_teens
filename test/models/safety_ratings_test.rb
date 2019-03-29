require 'test_helper'

class SafetyRatingsTest < ActiveSupport::TestCase

  setup do
    @model_hash = {manufacturer: "Mitsubishi", model: "Pajero", year: 2011}
    @safety_ratings = SafetyRatings.new(@model_hash)

    stub_requests
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
    expected_ratings_uri = "https://www.iihs.org/iihs/ratings/vehicle/v/mitsubishi/pajero/2011"

    assert_equal expected_ratings_uri, @safety_ratings.ratings_uri
  end

  test "report_uri" do
    expected_report_uri = "https://www.iihs.org/iihs/ratings/vehicle/v/mitsubishi/pajero/2011?print-view"

    assert_equal expected_report_uri, @safety_ratings.report_uri
  end

  class SanitizeManufacturer < SafetyRatingsTest

    test "sanitize_manufacturer makes a string parameter friendly" do
      manufacturers = %w{Mitsubishi MITSUBISHI MITSUbishi mitsuBISHI mItSuBiShI MiTsUbIsHi mitsubishi}

      manufacturers.each do |manufacturer|
        assert_equal "mitsubishi", @safety_ratings.sanitize_manufacturer(manufacturer)
      end
    end

    test "sanitize_manufacturer updates 'mercedes-benz' with 'mercedes'" do
      assert_equal "mercedes", @safety_ratings.sanitize_manufacturer("Mercedes-Benz")
    end

  end

  class SanitizeModel < SafetyRatingsTest

    test "sanitize_model makes a string parameter friendly" do
      models = %w{Pajero PAJERO PAJero pajERO pAjErO PaJeRo pajero}

      models.each do |model|
        assert_equal "pajero", @safety_ratings.sanitize_model(model)
      end
    end

    test "sanitize_model updates '9-5 sedan' to '9-5'" do
      assert_equal "9-5", @safety_ratings.sanitize_model("9-5 sedan")
    end

    test "sanitize_model updates 'C-Class sedan' to 'c-class'" do
      assert_equal "c-class", @safety_ratings.sanitize_model("C-Class sedan")
    end

    test "sanitize_model updates 'Accord sedan' to 'accord-4-door-sedan'" do
      assert_equal "accord-4-door-sedan", @safety_ratings.sanitize_model("Accord sedan")
    end

    test "sanitize_model updates 'Accord coupe' to 'accord-2-door-coupe'" do
      assert_equal "accord-2-door-coupe", @safety_ratings.sanitize_model("Accord coupe")
    end

    test "sanitize_model updates 'A3' to 'a3-4-door-wagon'" do
      assert_equal "a3-4-door-wagon", @safety_ratings.sanitize_model("A3")
    end

    test "sanitize_model updates '200 sedan' to '200-4-door-sedan'" do
      assert_equal "200-4-door-sedan", @safety_ratings.sanitize_model("200 sedan")
    end

    test "sanitize_model updates 'Tribeca/B9 Tribeca' to 'tribeca'" do
      assert_equal "tribeca", @safety_ratings.sanitize_model("Tribeca/B9 Tribeca")
    end

    test "sanitize_model updates 'A6 sedan' to 'a6'" do
      assert_equal "a6", @safety_ratings.sanitize_model("A6 sedan")
    end

    test "sanitize_model updates '3-series sedan' to '3-series-4-door-sedan'" do
      assert_equal "3-series-4-door-sedan", @safety_ratings.sanitize_model("3-series sedan")
    end

    test "sanitize_model updates '9-3' to '9-3-4-door-sedan'" do
      assert_equal "9-3-4-door-sedan", @safety_ratings.sanitize_model("9-3")
    end

    test "'sanitize_model' updates 'Town & Country' to 'town--n--country'" do
      assert_equal "town--n--country-minivan", @safety_ratings.sanitize_model("Town & Country")
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
