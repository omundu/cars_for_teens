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
  end

end
