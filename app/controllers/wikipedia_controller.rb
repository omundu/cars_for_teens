class WikipediaController < ApplicationController

  def manufacturer 
    render plain: get_wikipedia_summary(WIKIPEDIA_NAMES.fetch(params[:manufacturer], params[:manufacturer]))
  end
  
  def model
    render plain: get_wikipedia_summary("#{params[:manufacturer]} #{params[:model]}")
  end

  private

  def get_wikipedia_summary(article_title)
    Wikipedia.find(article_title).summary
  end

end
