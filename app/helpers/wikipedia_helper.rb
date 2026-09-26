module WikipediaHelper

  def get_wikipedia_summary(urls)
    article_data = fetch_article(urls)

    # Extract the summary paragraph in english
    if article_data[WIKIPEDIA_DISAMBIGUTION_URL].nil?
      summary_data = article_data[WIKIPEDIA_ABSTRACT_URL].detect{|data| data["lang"] == "en"}
      # This is caused by the Subaru Outback article not having an english version
      summary_data.nil? ? "Error Fectching information....we are looking into it" : summary_data["value"]
    else
      fetch_article_summary(article_data)
    end
  end

  def get_manufacturer_summary(manufacturer)
    data_url = build_data_url(WIKIPEDIA_NAMES[manufacturer])
    resource_url = build_resource_url(WIKIPEDIA_NAMES[manufacturer])
    
    get_wikipedia_summary({data_url: data_url, resource_url: resource_url})
  end

  def get_model_summary(manufacturer, make)
    model = wikipediarize_model(manufacturer, make)

    data_url = build_data_url(model)
    resource_url = build_resource_url(model)

    get_wikipedia_summary({data_url: data_url, resource_url: resource_url})
  end

  def fetch_article(urls)
    article_data = fetch_article_data(urls)

    if article_data[WIKIPEDIA_REDIRECT_URL].nil?
      article_data
    else
      redirects = article_data[WIKIPEDIA_REDIRECT_URL]
      urls[:resource_url] = redirects.first["value"]
      urls[:data_url] = urls[:resource_url].gsub("resource", "data") + ".json"
      fetch_article_data(urls)
    end
  end

  def fetch_article_data(urls)
    all_data = JSON.parse(URI.open(urls[:data_url]).read)
    all_data[urls[:resource_url]]
  end

  def fetch_article_summary(article_data)
    possible_articles = article_data[WIKIPEDIA_DISAMBIGUTION_URL]
    disabmiguous_urls = possible_articles.map{|url| url["value"]}

    url_groups = disabmiguous_urls.map do |url|
      {
        resource_url: url,
        data_url: url.gsub("resource", "data") + ".json"
      }
    end

    url_groups.map{|urls| get_wikipedia_summary(urls) }.join("\n")
  end

  def wikipediarize_model(manufacturer, model)
    # we need to remove "sedan" and join with underscore
    [
      manufacturer,
      stanitize_model_names(model)
    ].join("_")
  end

  def stanitize_model_names(model)
    clean_up_model(model).join("_").gsub("3-series", "3_Series")
  end

  def clean_up_model(model)
    model.split(" ").reject{|word| word == "sedan" || word == "Tribeca/B9"}
  end

  def build_data_url(item)
    "https://dbpedia.org/data/#{item}.json"
  end

  def build_resource_url(item)
    "https://dbpedia.org/resource/#{item}"
  end

  def wikipedia_histories
    # uses wikipedia-client gem
    WIKIPEDIA_NAMES.values.map do |x|
      Wikipedia.find(x).sanitized_content.split('<p>==History==</p>').first
    end
  end

end
