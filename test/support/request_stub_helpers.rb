module RequestStubHelpers

  def stub_requests
    stub_request(:get, 'https://www.iihs.org/iihs/ratings/vehicles-for-teens').
      to_return(:body => "You have arrived")

    stub_request(:get, 'http://dbpedia.org/data/Mitsubishi_Motors.json').
      to_return(:body => File.open(File.expand_path('.', 'test/files/mitsubishi_motors.json')).read)

    stub_request(:get, 'http://dbpedia.org/data/Mitsubishi_Pajero.json').
      to_return(:body => File.open(File.expand_path('.', 'test/files/mitsubishi_pajero.json')).read)

    stub_request(:get, 'https://www.iihs.org/iihs/ratings/vehicle/v/mitsubishi/pajero/2011').
      to_return(:body => File.open(File.expand_path('.', 'test/files/safety_rating_sample_uno.html')).read)

    stub_request(:get, 'https://www.iihs.org/iihs/ratings/vehicle/v/mitsubishi/lancer-evolution/2020').
      to_return(:body => File.open(File.expand_path('.', 'test/files/safety_rating_sample_dos.html')).read)

    stub_request(:get, 'https://www.iihs.org/iihs/ratings/vehicle/v/mitsubishi/lancer-evolution/2010').
      to_return(:body => File.open(File.expand_path('.', 'test/files/safety_rating_sample_dos.html')).read)
  end

end
