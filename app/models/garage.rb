class Garage
  class << self
    def fetch_cached_garage
      Rails.cache.fetch("garage", expires_in: 7.days) do
        Garage.fetch_uncached_garage
      end
    end
    
    def fetch_uncached_garage
      CarExtractor.new.cars
    end
  end
end
