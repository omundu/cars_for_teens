namespace :investigate do

  desc "Checks for all the BMW models from 2006 to 2011 the NNTSA ratings website"
  task :bmw_models => :environment do
    require_relative '../bmw_3series_checker'
    Bmw3seriesChecker.new
  end
  
end