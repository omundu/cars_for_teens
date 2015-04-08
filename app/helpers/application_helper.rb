module ApplicationHelper
  ABSTRACT_URL = "http://dbpedia.org/ontology/abstract"
  DISAMBIGUTION_URL = "http://dbpedia.org/ontology/wikiPageDisambiguates"
  REDIRECT_URL = "http://dbpedia.org/ontology/wikiPageRedirects"
  
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
  
  def fetch_article(urls)
    article_data = fetch_article_data(urls)
    
    unless article_data[REDIRECT_URL].nil?
      redirects = article_data[REDIRECT_URL]
      urls[:resource_url] = redirects.first["value"]
      urls[:data_url] = urls[:resource_url].gsub("resource", "data") + ".json"
    end
    
    fetch_article_data(urls)
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
end
