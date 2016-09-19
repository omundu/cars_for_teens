require 'test_helper'

class NhtsaSafetyRatingTest < ActiveSupport::TestCase
  setup do
    @model_hash = {manufacturer: "Hyundai", model: "Veracruz", year: 2012}
    @nhtsa_safety_ratings = NhtsaSafetyRating.new(@model_hash)
  end
  
  test "cached_ratings" do
    hyundai_veracruz = [
      {
        "OverallRating" => "Not Rated",
        "OverallFrontCrashRating" => "Not Rated",
        "FrontCrashDriversideRating" => "Not Rated",
        "FrontCrashPassengersideRating" => "Not Rated",
        "OverallSideCrashRating" => "Not Rated",
        "SideCrashDriversideRating" => "Not Rated",
        "SideCrashPassengersideRating" => "Not Rated",
        "RolloverRating" => "4",
        "RolloverRating2" => "Not Rated",
        "RolloverPossibility" => 0.159,
        "RolloverPossibility2" => 0,
        "SidePoleCrashRating" => "Not Rated",
        "NHTSAElectronicStabilityControl" => "Standard",
        "NHTSAForwardCollisionWarning" => "No",
        "NHTSALaneDepartureWarning" => "No",
        "ComplaintsCount" => 2,
        "RecallsCount" => 1,
        "InvestigationCount" => 0,
        "ModelYear" => 2012,
        "Make" => "HYUNDAI",
        "Model" => "VERACRUZ",
        "VehicleDescription" => "2012 Hyundai Veracruz SUV AWD",
        "VehicleId" => 6751
      },
      {
        "OverallRating" => "Not Rated",
        "OverallFrontCrashRating" => "Not Rated",
        "FrontCrashDriversideRating" => "Not Rated",
        "FrontCrashPassengersideRating" => "Not Rated",
        "OverallSideCrashRating" => "Not Rated",
        "SideCrashDriversideRating" => "Not Rated",
        "SideCrashPassengersideRating" => "Not Rated",
        "RolloverRating" => "4",
        "RolloverRating2" => "Not Rated",
        "RolloverPossibility" => 0.169,
        "RolloverPossibility2" => 0,
        "SidePoleCrashRating" => "Not Rated",
        "NHTSAElectronicStabilityControl" => "Standard",
        "NHTSAForwardCollisionWarning" => "No",
        "NHTSALaneDepartureWarning" => "No",
        "ComplaintsCount" => 2,
        "RecallsCount" => 1,
        "InvestigationCount" => 0,
        "ModelYear" => 2012,
        "Make" => "HYUNDAI",
        "Model" => "VERACRUZ",
        "VehicleDescription" => "2012 Hyundai Veracruz SUV FWD",
        "VehicleId" => 6114
      }
    ]
    Rails.cache.clear
    
    assert_nil Rails.cache.read('nhtsa/hyundai/veracruz/2012')
    assert_equal hyundai_veracruz, @nhtsa_safety_ratings.cached_ratings
    assert_equal hyundai_veracruz, Rails.cache.read('nhtsa/hyundai/veracruz/2012')
  end
  
  test "get_ratings" do
    hyundai_veracruz = [
      {
        "OverallRating" => "Not Rated",
        "OverallFrontCrashRating" => "Not Rated",
        "FrontCrashDriversideRating" => "Not Rated",
        "FrontCrashPassengersideRating" => "Not Rated",
        "OverallSideCrashRating" => "Not Rated",
        "SideCrashDriversideRating" => "Not Rated",
        "SideCrashPassengersideRating" => "Not Rated",
        "RolloverRating" => "4",
        "RolloverRating2" => "Not Rated",
        "RolloverPossibility" => 0.159,
        "RolloverPossibility2" => 0,
        "SidePoleCrashRating" => "Not Rated",
        "NHTSAElectronicStabilityControl" => "Standard",
        "NHTSAForwardCollisionWarning" => "No",
        "NHTSALaneDepartureWarning" => "No",
        "ComplaintsCount" => 2,
        "RecallsCount" => 1,
        "InvestigationCount" => 0,
        "ModelYear" => 2012,
        "Make" => "HYUNDAI",
        "Model" => "VERACRUZ",
        "VehicleDescription" => "2012 Hyundai Veracruz SUV AWD",
        "VehicleId" => 6751
      },
      {
        "OverallRating" => "Not Rated",
        "OverallFrontCrashRating" => "Not Rated",
        "FrontCrashDriversideRating" => "Not Rated",
        "FrontCrashPassengersideRating" => "Not Rated",
        "OverallSideCrashRating" => "Not Rated",
        "SideCrashDriversideRating" => "Not Rated",
        "SideCrashPassengersideRating" => "Not Rated",
        "RolloverRating" => "4",
        "RolloverRating2" => "Not Rated",
        "RolloverPossibility" => 0.169,
        "RolloverPossibility2" => 0,
        "SidePoleCrashRating" => "Not Rated",
        "NHTSAElectronicStabilityControl" => "Standard",
        "NHTSAForwardCollisionWarning" => "No",
        "NHTSALaneDepartureWarning" => "No",
        "ComplaintsCount" => 2,
        "RecallsCount" => 1,
        "InvestigationCount" => 0,
        "ModelYear" => 2012,
        "Make" => "HYUNDAI",
        "Model" => "VERACRUZ",
        "VehicleDescription" => "2012 Hyundai Veracruz SUV FWD",
        "VehicleId" => 6114
      }
    ]
    
    assert_equal hyundai_veracruz, @nhtsa_safety_ratings.get_ratings
  end
  
  test "get_trim_information" do
    hyundai_veracruz = [
      {
        "Count" => 1,
        "Message" => "Results returned successfully",
        "Results" => [
          {
            "OverallRating" => "Not Rated",
            "OverallFrontCrashRating" => "Not Rated",
            "FrontCrashDriversideRating" => "Not Rated",
            "FrontCrashPassengersideRating" => "Not Rated",
            "OverallSideCrashRating" => "Not Rated",
            "SideCrashDriversideRating" => "Not Rated",
            "SideCrashPassengersideRating" => "Not Rated",
            "RolloverRating" => "4",
            "RolloverRating2" => "Not Rated",
            "RolloverPossibility" => 0.159,
            "RolloverPossibility2" => 0,
            "SidePoleCrashRating" => "Not Rated",
            "NHTSAElectronicStabilityControl" => "Standard",
            "NHTSAForwardCollisionWarning" => "No",
            "NHTSALaneDepartureWarning" => "No",
            "ComplaintsCount" => 2,
            "RecallsCount" => 1,
            "InvestigationCount" => 0,
            "ModelYear" => 2012,
            "Make" => "HYUNDAI",
            "Model" => "VERACRUZ",
            "VehicleDescription" => "2012 Hyundai Veracruz SUV AWD",
            "VehicleId" => 6751
          }
        ]
      },
      {
        "Count" => 1,
        "Message" => "Results returned successfully",
        "Results" => [
          {
            "OverallRating" => "Not Rated",
            "OverallFrontCrashRating" => "Not Rated",
            "FrontCrashDriversideRating" => "Not Rated",
            "FrontCrashPassengersideRating" => "Not Rated",
            "OverallSideCrashRating" => "Not Rated",
            "SideCrashDriversideRating" => "Not Rated",
            "SideCrashPassengersideRating" => "Not Rated",
            "RolloverRating" => "4",
            "RolloverRating2" => "Not Rated",
            "RolloverPossibility" => 0.169,
            "RolloverPossibility2" => 0,
            "SidePoleCrashRating" => "Not Rated",
            "NHTSAElectronicStabilityControl" => "Standard",
            "NHTSAForwardCollisionWarning" => "No",
            "NHTSALaneDepartureWarning" => "No",
            "ComplaintsCount" => 2,
            "RecallsCount" => 1,
            "InvestigationCount" => 0,
            "ModelYear" => 2012,
            "Make" => "HYUNDAI",
            "Model" => "VERACRUZ",
            "VehicleDescription" => "2012 Hyundai Veracruz SUV FWD",
            "VehicleId" => 6114
          }
        ]
      }
    ]
    
    assert_equal hyundai_veracruz, @nhtsa_safety_ratings.get_trim_information
  end
  
  test "get_trim_ids" do
    assert_equal [6751, 6114], @nhtsa_safety_ratings.get_trim_ids
  end
  
  test "get_trims" do
    hyundai_veracruz_result = {
      "Count" => 2,
      "Message" => "Results returned successfully",
      "Results" => [
        {
          "VehicleDescription" => "2012 Hyundai Veracruz SUV AWD",
          "VehicleId" => 6751
        },
        {
          "VehicleDescription" => "2012 Hyundai Veracruz SUV FWD",
          "VehicleId" => 6114
        }
      ]
    }
      
    assert_equal hyundai_veracruz_result, @nhtsa_safety_ratings.get_trims
  end
  
  test "trim_uri" do
    hyundai_uri = "http://www.nhtsa.gov/webapi/api/SafetyRatings/modelyear/2012/make/hyundai/model/veracruz?format=json"
    
    assert_equal hyundai_uri, @nhtsa_safety_ratings.trim_uri
  end
  
  test "ratings_uri" do
    double_0_7 = "http://www.nhtsa.gov/webapi/api/SafetyRatings/VehicleId/1007?format=json"
    boom = "http://www.nhtsa.gov/webapi/api/SafetyRatings/VehicleId/boom?format=json"
    palindrome = "http://www.nhtsa.gov/webapi/api/SafetyRatings/VehicleId/12321?format=json"
    
    assert_equal double_0_7, @nhtsa_safety_ratings.ratings_uri(1007)
    assert_equal boom, @nhtsa_safety_ratings.ratings_uri("boom")
    assert_equal palindrome, @nhtsa_safety_ratings.ratings_uri(12321)
  end
   
end

class SanitizeManufacturer < ActiveSupport::TestCase
  setup do
    @model_hash = {manufacturer: "Hyundai", model: "Veracruz", year: 2012}
    @nhtsa_safety_ratings = NhtsaSafetyRating.new(@model_hash)
  end
  
  test "The hypen in Mercedes-Benz is left intact" do    
    assert_equal "mercedes-benz", @nhtsa_safety_ratings.sanitize_manufacturer("Mercedes-Benz")
  end
  
  test "all caps manufacturer name is simply lowercased 'BMW' -> 'bmw'" do
    assert_equal "bmw", @nhtsa_safety_ratings.sanitize_manufacturer("BMW")
  end
  
  test "titlecase manufacturer name is transformed to lowercase 'Saab' -> 'saab'" do
    assert_equal "saab", @nhtsa_safety_ratings.sanitize_manufacturer("Saab")
  end
end

class SanitizeModel < ActiveSupport::TestCase
  
  setup do
    @model_hash = {manufacturer: "Hyundai", model: "Veracruz", year: 2012}
    @nhtsa_safety_ratings = NhtsaSafetyRating.new(@model_hash)
  end
  
  test "'9-5 sedan' is transformed to '9-5'" do
    assert_equal "9-5", @nhtsa_safety_ratings.sanitize_model("9-5 sedan")
  end
  
  test "all caps model name is simply lowercased 'MKS' -> 'mks'" do
    assert_equal "mks", @nhtsa_safety_ratings.sanitize_model("MKS")
  end
  
  test "titlecase model name is transformed to lowercase 'Sportage' -> 'sportage'" do
    assert_equal "sportage", @nhtsa_safety_ratings.sanitize_model("Sportage")
  end
  
  test "mixed case model name is transformed to all lowercase 'LaCrosse' -> 'lacrosse'" do
    assert_equal "lacrosse", @nhtsa_safety_ratings.sanitize_model("LaCrosse")
  end
  
  test "alphanumeric model names are tranformed to have lowercase letters, numbers left intact" do
    assert_equal "s80", @nhtsa_safety_ratings.sanitize_model("S80")
    assert_equal "a4", @nhtsa_safety_ratings.sanitize_model("A4")
    assert_equal "xc60", @nhtsa_safety_ratings.sanitize_model("XC60")
    assert_equal "xl7", @nhtsa_safety_ratings.sanitize_model("XL7")
  end
  
  test "model names spaces are preserved...in a uri encoded manner" do
    assert_equal "prius%20v", @nhtsa_safety_ratings.sanitize_model("Prius v")
    assert_equal "jetta%20sportwagen", @nhtsa_safety_ratings.sanitize_model("Jetta SportWagen")
    assert_equal "outlander%20sport", @nhtsa_safety_ratings.sanitize_model("Outlander Sport")
  end
  
  test "'C-Class sedan' is transformed to 'c-class'" do
    assert_equal "c-class", @nhtsa_safety_ratings.sanitize_model("C-Class sedan")
  end
  
  test "'Accord sedan' is transformed to 'accord'" do
    assert_equal "accord", @nhtsa_safety_ratings.sanitize_model("Accord sedan")
  end
  
  test "'Accord coupe' is transformed to 'accord'" do
    assert_equal "accord", @nhtsa_safety_ratings.sanitize_model("Accord coupe")
  end
    
  test "'200 sedan' is transformed to '200'" do
    assert_equal "200", @nhtsa_safety_ratings.sanitize_model("200 sedan")
  end
  
  test "hypens are left unchanged as letters are transformed" do
    assert_equal "cr-v", @nhtsa_safety_ratings.sanitize_model("CR-V")
    assert_equal "9-4x", @nhtsa_safety_ratings.sanitize_model("9-4X")
    assert_equal "9-3", @nhtsa_safety_ratings.sanitize_model("9-3")
    assert_equal "cx-7", @nhtsa_safety_ratings.sanitize_model("CX-7")
  end
  
  test "'Tribeca/B9 Tribeca' is transformed to 'tribeca'" do
    assert_equal "tribeca", @nhtsa_safety_ratings.sanitize_model("Tribeca/B9 Tribeca")
  end
  
  test "'Town & Country' is transformed to uri encoded 'town and country" do
    assert_equal "town%20and%20country", @nhtsa_safety_ratings.sanitize_model("Town & Country")
  end
  
  test "'A6 sedan' is transformed to 'a6'" do
    assert_equal "a6", @nhtsa_safety_ratings.sanitize_model("A6 sedan")
  end
  
  test "'6' is transformed to 'mazda6'" do
    assert_equal "mazda6", @nhtsa_safety_ratings.sanitize_model("6")
  end
end

class SanitizeBmwModel < ActiveSupport::TestCase
  setup do
    @model_hash = {manufacturer: "BMW", model: "3-series sedan", year: 2012}
    @nhtsa_safety_ratings = NhtsaSafetyRating.new(@model_hash)
  end
  
  test "Unaffected 3-Series sedans recieve the generic treatment" do
    (2006..2010).each do |year|
      model_hash = {manufacturer: "BMW", model: "3-series sedan", year: year}
      nhtsa_safety_ratings = NhtsaSafetyRating.new(model_hash)
      
      assert_equal "3%20series", nhtsa_safety_ratings.sanitize_model("3-series sedan")
    end
  end

  # BMW 3 series needs customized handling for 2011 - 2014 model years

  # {"ModelYear":2011,"Make":"BMW","Model":"328I","VehicleId":0}
  # {"ModelYear":2011,"Make":"BMW","Model":"328I XDRIVE","VehicleId":0}
  # {"ModelYear":2011,"Make":"BMW","Model":"335 IS","VehicleId":0}
  # {"ModelYear":2011,"Make":"BMW","Model":"335D","VehicleId":0}
  # {"ModelYear":2011,"Make":"BMW","Model":"335I","VehicleId":0}
  # {"ModelYear":2011,"Make":"BMW","Model":"335I XDRIVE","VehicleId":0}

  # {"ModelYear":2012,"Make":"BMW","Model":"328I","VehicleId":0}
  # {"ModelYear":2012,"Make":"BMW","Model":"328I XDRIVE","VehicleId":0}
  # {"ModelYear":2012,"Make":"BMW","Model":"335I","VehicleId":0}
  # {"ModelYear":2012,"Make":"BMW","Model":"335I XDRIVE","VehicleId":0}
  # {"ModelYear":2012,"Make":"BMW","Model":"335IS HP","VehicleId":0}

  # {"ModelYear":2013,"Make":"BMW","Model":"135IS","VehicleId":0}
  # {"ModelYear":2013,"Make":"BMW","Model":"328I","VehicleId":0}
  # {"ModelYear":2013,"Make":"BMW","Model":"328I XDRIVE","VehicleId":0}
  # {"ModelYear":2013,"Make":"BMW","Model":"335I","VehicleId":0}
  # {"ModelYear":2013,"Make":"BMW","Model":"335I XDRIVE","VehicleId":0}
  # {"ModelYear":2013,"Make":"BMW","Model":"335IS","VehicleId":0}
  # {"ModelYear":2013,"Make":"BMW","Model":"335IS HP","VehicleId":0}
  # {"ModelYear":2013,"Make":"BMW","Model":"528I","VehicleId":0}

  # {"ModelYear":2014,"Make":"BMW","Model":"320I","VehicleId":0}
  # {"ModelYear":2014,"Make":"BMW","Model":"320I XDRIVE","VehicleId":0}
  # {"ModelYear":2014,"Make":"BMW","Model":"328D","VehicleId":0}
  # {"ModelYear":2014,"Make":"BMW","Model":"328D XDRIVE","VehicleId":0}
  # {"ModelYear":2014,"Make":"BMW","Model":"328I","VehicleId":0}
  # {"ModelYear":2014,"Make":"BMW","Model":"328I XDRIVE","VehicleId":0}
  # {"ModelYear":2014,"Make":"BMW","Model":"328I XDRIVE GT","VehicleId":0}
  # {"ModelYear":2014,"Make":"BMW","Model":"335I","VehicleId":0}
  # {"ModelYear":2014,"Make":"BMW","Model":"335I XDRIVE","VehicleId":0}
  # {"ModelYear":2014,"Make":"BMW","Model":"335I XDRIVE GT","VehicleId":0}
end
