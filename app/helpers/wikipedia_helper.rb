module WikipediaHelper
  ABSTRACT_URL = "http://dbpedia.org/ontology/abstract"
  DISAMBIGUTION_URL = "http://dbpedia.org/ontology/wikiPageDisambiguates"
  REDIRECT_URL = "http://dbpedia.org/ontology/wikiPageRedirects"
  WIKIPEDIA_NAMES = {
    "Saab" => "Saab_Automobile",
    "Lincoln" => "Lincoln_Motor_Company",
    "Buick" => "Buick",
    "Ford" => "Ford_Motor_Company",
    "Volvo" => "Volvo_Cars",  
    "Toyota" => "Toyota",
    "Mercedes-Benz" => "Mercedes-Benz",
    "Honda" => "Honda",
    "Audi" => "Audi",
    "Subaru" => "Subaru",
    "Kia" => "Kia_Motors",
    "Hyundai" => "Hyundai_Motor_Company", 
    "Dodge" => "Dodge",
    "Volkswagen" => "Volkswagen_Group",
    "Chevrolet" => "Chevrolet",
    "Chrysler" => "Chrysler",
    "Mercury" => "Mercury_(automobile)",
    "Mitsubishi" => "Mitsubishi_Motors",
    "GMC" => "GMC_(automobile)",
    "Infiniti" => "Infiniti" ,
    "Acura" => "Acura",
    "BMW" => "BMW",
    "Mazda" => "Mazda",
    "Saturn" => "Saturn_Corporation",
    "Suzuki" => "Suzuki",
    "Nissan" => "Nissan_Motor_Company"
  }
  
  def get_wikipedia_summary(urls)
    article_data = fetch_article(urls)
    
    # Extract the summary paragraph in english
    if article_data[DISAMBIGUTION_URL].nil?
      summary_data = article_data[ABSTRACT_URL]
      summary_data.select{|data| data["lang"] == "en"}.first["value"]
    else
      fetch_article_summary(article_data)
    end
  end
  
  def get_manufacturer_summary(manufacturer = params[:manufacturer])   
    data_url = build_data_url(WIKIPEDIA_NAMES[manufacturer])
    resource_url = build_resource_url(WIKIPEDIA_NAMES[manufacturer])
    
    get_wikipedia_summary({data_url: data_url, resource_url: resource_url})
  end
  
  def get_model_summary(manufacturer = params[:manufacturer])
    model = stanitze_model_names
    
    data_url = build_data_url(model)
    resource_url = build_resource_url(model)
    
    get_wikipedia_summary({data_url: data_url, resource_url: resource_url})
  end
  
  def fetch_article(urls)
    article_data = fetch_article_data(urls)
    
    if article_data[REDIRECT_URL].nil?
      article_data
    else
      redirects = article_data[REDIRECT_URL]
      urls[:resource_url] = redirects.first["value"]
      urls[:data_url] = urls[:resource_url].gsub("resource", "data") + ".json"
      fetch_article_data(urls)
    end
  end
  
  def fetch_article_data(urls)
    all_data = JSON.parse(open(urls[:data_url]).read)
    all_data[urls[:resource_url]]
  end
  
  def fetch_article_summary(article_data)
    possible_articles = article_data[DISAMBIGUTION_URL]
    disabmiguous_urls = possible_articles.map{|url| url["value"]}
    
    url_groups = disabmiguous_urls.map do |url|
      {
        resource_url: url,
        data_url: url.gsub("resource", "data") + ".json"
      }
    end
    
    url_groups.map{|urls| get_wikipedia_summary(urls) }.join("\n")    
  end
  
  def stanitze_model_names(model = params[:model], manufacturer = params[:manufacturer])
    # we need to remove "sedan" and join with underscore
    [
      manufacturer,
      model.split(" ").reject{|word| word == "sedan" || word == "Tribeca/B9"}.join("_").gsub("3-series", "3_Series")
    ].join("_")
  end
  
  def build_data_url(item)
    "http://dbpedia.org/data/#{item}.json"
  end
  
  def build_resource_url(item)
    "http://dbpedia.org/resource/#{item}"
  end
end
