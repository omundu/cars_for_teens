module ApplicationHelper
  def get_wikipedia_summary(urls)
    abstract_url = "http://dbpedia.org/ontology/abstract"
    redirect_url = "http://dbpedia.org/ontology/wikiPageRedirects"
  
    article_data = fetch_article(urls)
    
    unless article_data[redirect_url].nil?
      redirects = article_data[redirect_url]
      urls[:resource_url] = redirects.first["value"]
      urls[:data_url] = urls[:resource_url].gsub("resource", "data") + ".json"
      
      article_data = fetch_article(urls)
    end
    
    summary_data = article_data[abstract_url]
    
    # Extract the summary paragraph in english
    summary_data.select{|data| data["lang"] == "en"}.first["value"]
  end
  
  def fetch_article(urls)
    all_data = JSON.parse(open(urls[:data_url]).read)
    all_data[urls[:resource_url]]
  end
end
