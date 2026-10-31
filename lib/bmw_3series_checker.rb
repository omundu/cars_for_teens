require 'rubygems'
require 'open-uri'
require 'json'

class Bmw3seriesChecker
  def initialize
    puts "\nBMW Models...\n"
    puts print_models
  end
  
  def print_models
    generate_model_hash.each do |key, value|
      puts "=> #{key}:"
      value.each do |model|
        puts "\t#{model['Model']}"
      end
    end
    puts "Done :)"
  end
  
  def generate_model_hash
    model_hash = {}
    (2006..2014).each do |year|
      model_hash[year] = get_models_for_year(year)
    end
    model_hash
  end

  def get_models_for_year(year)
    JSON.parse(open("http://www.nhtsa.gov/webapi/api/SafetyRatings/modelyear/#{year}/make/bmw?format=json").read)["Results"]
  end
end
