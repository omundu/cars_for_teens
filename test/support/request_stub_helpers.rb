module RequestStubHelpers

  def stub_requests
    stub_request(:get, 'https://www.iihs.org/iihs/ratings/vehicles-for-teens').
      to_return(:body => "You have arrived")

    stub_request(:get, 'http://dbpedia.org/data/Mitsubishi_Motors.json').
      to_return(:body => File.read(File.expand_path('.', 'test/files/mitsubishi_motors.json')))

    stub_request(:get, 'http://dbpedia.org/data/Mitsubishi_Pajero.json').
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
