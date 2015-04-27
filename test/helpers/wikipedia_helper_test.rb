require 'test_helper'

class WikipediaHelperTest < ActionView::TestCase
  
  test "get manufacturer summary" do
    skip "Awaiting refactor"
    assert_equal get_manufacturer_summary, ""
  end
  
  test "get wikipedia summary" do
    skip "Awaiting refactor"
    urls = ""
    assert_equal get_wikipedia_summary(urls), ""
  end
  
  test "fetch article" do
    skip "Awaiting refactor"
    urls = ""
    assert_equal fetch_article(urls), ""
  end
  
  test "fetch_article_data(urls)" do
    skip "Awaiting refactor"
    urls = ""
    assert_equal fetch_article_data(urls), ""
  end
  
  test "fetch article summary" do
    skip "Awaiting refactor"
    article_data = ""
    assert_equal fetch_article_summary(article_data), ""
  end
  
  test "get model summary" do
    skip "Awaiting refactor"
    assert_equal get_model_summary, ""
  end
  
  test "stanitze model names" do
    skip "Awaiting refactor"
    assert_equal stanitze_model_names, ""
  end
  
end
