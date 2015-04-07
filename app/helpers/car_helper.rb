module CarHelper
  
  def get_model_summary
    manufacturer = params[:manufacturer]
    model = stanitze_model_names
    
    data_url = "http://dbpedia.org/data/#{manufacturer}_#{model}.json"
    resource_url = "http://dbpedia.org/resource/#{manufacturer}_#{model}"
    
    puts data_url
    puts resource_url
    
    get_wikipedia_summary({data_url: data_url, resource_url: resource_url})
  end
  
  def stanitze_model_names
    # we need to remove "sedan" and join with underscore
    model = params[:model].split(" ").reject{|word| word == "sedan"}.join("_").gsub("3-series", "3_Series")
  end
    
end
