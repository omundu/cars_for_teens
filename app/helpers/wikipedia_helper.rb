module WikipediaHelper

  def get_wikipedia_summary(article_title)
    Wikipedia.find(article_title).summary
  end

  def get_manufacturer_summary(manufacturer)
    manufacturer_name = WIKIPEDIA_NAMES.fetch(manufacturer, manufacturer)

    get_wikipedia_summary(manufacturer_name)
  end

  def get_model_summary(manufacturer, make)
    model_name = wikipediarize_model(manufacturer, make)

    get_wikipedia_summary(model_name)
  end

  def wikipediarize_model(manufacturer, model)
    [
      manufacturer,
      stanitize_model_names(model)
    ].join(' ')
  end

  def stanitize_model_names(model)
    clean_up_model(model).join(' ').gsub("3-series", "3 Series")
  end

  def clean_up_model(model)
    model.split(' ').reject{ |word| ['sedan', 'Tribeca/B9'].include?(word) }
  end

  def wikipedia_histories
    WIKIPEDIA_NAMES.values.map do |name|
      Wikipedia.find(name).sanitized_content.split('<p>==History==</p>').first
    end
  end

end
