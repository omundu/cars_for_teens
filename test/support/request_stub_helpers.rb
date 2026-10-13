module RequestStubHelpers

  def stub_requests
    stub_request(:get, IIHS_TEEN_CAR_WEBPAGE).
      to_return(:body => File.read(File.expand_path('.', 'test/files/safe_vehicles_for_teens.html')))

    stub_request(:get, 'https://dbpedia.org/data/Mitsubishi_Motors.json').
      to_return(:body => File.read(File.expand_path('.', 'test/files/mitsubishi_motors_old.json')))

    stub_request(:get, 'https://en.wikipedia.org/w/api.php?action=query&explaintext=&format=json&inprop=url&lllimit=500&pithumbsize=200&prop=info%7Crevisions%7Clinks%7Cextlinks%7Cimages%7Ccategories%7Ccoordinates%7Ctemplates%7Cextracts%7Cpageimages%7Clanglinks&rvprop=content&titles=Mitsubishi_Motors').
      to_return(:body => File.read(File.expand_path('.', 'test/files/mitsubishi_motors.json')))

    stub_request(:get, 'https://en.wikipedia.org/w/api.php?action=query&explaintext=&format=json&inprop=url&lllimit=500&pithumbsize=200&prop=info%7Crevisions%7Clinks%7Cextlinks%7Cimages%7Ccategories%7Ccoordinates%7Ctemplates%7Cextracts%7Cpageimages%7Clanglinks&rvprop=content&titles=Mitsubishi%20Pajero').
      to_return(:body => File.read(File.expand_path('.', 'test/files/mitsubishi_pajero.json')))

    stub_request(:get, 'https://www.iihs.org/iihs/ratings/vehicle/v/mitsubishi/pajero/2011').
      to_return(:body => File.read(File.expand_path('.', 'test/files/safety_rating_sample_uno.html')))

    stub_request(:get, 'https://www.iihs.org/iihs/ratings/vehicle/v/mitsubishi/pajero/2019').
      to_return(:body => File.read(File.expand_path('.', 'test/files/safety_rating_sample_tres.html')))

    stub_request(:get, 'https://www.iihs.org/iihs/ratings/vehicle/v/mitsubishi/lancer-evolution/2020').
      to_return(:body => File.read(File.expand_path('.', 'test/files/safety_rating_sample_tres.html')))

    stub_request(:get, 'https://www.iihs.org/iihs/ratings/vehicle/v/mitsubishi/lancer-evolution/2010').
      to_return(:body => File.read(File.expand_path('.', 'test/files/safety_rating_sample_dos.html')))
    
    stub_request(:get, 'https://api.nhtsa.gov/SafetyRatings/modelyear/2012/make/hyundai/model/veracruz?format=json').
      to_return(:body => File.open(File.expand_path(".", "test/files/nhtsa_hyundai_veracruz_trims.json")).read)

    stub_request(:get, 'https://api.nhtsa.gov/SafetyRatings/modelyear/2010/make/mitsubishi/model/lancer%20evolution?format=json').
      to_return(:body => File.open(File.expand_path(".", "test/files/nhtsa_2015_mitsubishi_lancer_evolution.json")).read)

    stub_request(:get, 'https://api.nhtsa.gov/SafetyRatings/modelyear/2015/make/mitsubishi/model/lancer%20evolution?format=json').
      to_return(:body => File.open(File.expand_path(".", "test/files/nhtsa_2015_mitsubishi_lancer_evolution.json")).read)
    
    stub_request(:get, 'https://api.nhtsa.gov/SafetyRatings/VehicleId/6751?format=json').
      to_return(:body => File.open(File.expand_path(".", "test/files/nhtsa_hyundai_veracruz_trima.json")).read)
    
    stub_request(:get, 'https://api.nhtsa.gov/SafetyRatings/VehicleId/6114?format=json').
      to_return(:body => File.open(File.expand_path(".", "test/files/nhtsa_hyundai_veracruz_trimb.json")).read)

    stub_request(:get, 'https://api.nhtsa.gov/SafetyRatings/VehicleId/9715?format=json').
      to_return(:body => File.open(File.expand_path(".", "test/files/nhtsa_2015_mitsubishi_lancer_evolution_rating.json")).read)
  end

end
