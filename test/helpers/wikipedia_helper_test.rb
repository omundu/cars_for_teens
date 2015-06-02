require 'test_helper'

class WikipediaHelperTest < ActionView::TestCase
  
  test "get wikipedia summary" do
    skip "Awaiting refactor"
    urls = ""
    assert_equal get_wikipedia_summary(urls), ""
  end
  
  test "get manufacturer summary" do
    skip "Awaiting refactor"
    assert_equal get_manufacturer_summary, ""
  end
  
  test "get model summary" do
    skip "Awaiting refactor"
    assert_equal get_model_summary, ""
  end
  
  test "fetch article" do
    skip "Awaiting refactor"
    urls = ""
    assert_equal fetch_article(urls), ""
  end
  
  test "fetch article data" do
    skip "Awaiting refactor"
    urls = ""
    assert_equal fetch_article_data(urls), ""
  end
  
  test "fetch article summary" do
    skip "Awaiting refactor"
    article_data = ""
    assert_equal fetch_article_summary(article_data), ""
  end
  
  test "stanitze model names" do
    skip "Awaiting refactor"
    assert_equal stanitze_model_names, ""
  end
  
  test "wikipediarize model" do
    skip "Awaiting refactor"
    assert_equal wikipediarize_model, ""
  end
  
  test "clean up model" do
    skip "Awaiting refactor"
    assert_equal clean_up_model, ""
  end
  
  test "build data url" do
    skip "Awaiting refactor"
    assert_equal build_data_url, ""
  end
  
  test "build resource url" do
    skip "Awaiting refactor"
    assert_equal build_resource_url, ""
  end
end
