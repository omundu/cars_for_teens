require 'test_helper'

class WikipediaHelperTest < ActionView::TestCase

  test "get wikipedia summary" do
    urls = {
      data_url: "http://dbpedia.org/data/Mitsubishi_Motors.json",
      resource_url: "http://dbpedia.org/resource/Mitsubishi_Motors"
    }

    assert_equal "Error Fectching information....we are looking into it", get_wikipedia_summary(urls)
  end

  test "get manufacturer summary" do
    assert_equal "Error Fectching information....we are looking into it", get_manufacturer_summary("Mitsubishi")
  end

  test "get model summary" do
    skip("mocking data required")
    assert_equal ":(", get_model_summary("Mitsubishi", "")
  end

  test "fetch article" do
    skip("mocking data required")
    urls = {
      data_url: "http://dbpedia.org/data/Mitsubishi_Motors.json",
      resource_url: "http://dbpedia.org/resource/Mitsubishi_Motors"
    }

    assert_equal "Allow me to introduce myself", fetch_article(urls)
  end

  test "fetch article data" do
    skip("mocking data required")
    urls = {
      data_url: "http://dbpedia.org/data/Mitsubishi_Motors.json",
      resource_url: "http://dbpedia.org/resource/Mitsubishi_Motors"
    }

    assert_equal "This is where we end it", fetch_article_data(urls)
  end

  test "fetch article summary" do
    skip("mocking data required")
    article_data = {"http://dbpedia.org/resource/Mitsubishi_Motors" => []}

    assert_equal "", fetch_article_summary(article_data)
  end

  test "wikipediarize model names returns wikipedia-friendly names" do
    assert_equal "Mitsubishi_Lancer", wikipediarize_model("Mitsubishi", "Lancer")
    assert_equal "Mitsubishi_Lancer_Evolution_X", wikipediarize_model("Mitsubishi", "Lancer Evolution X")
  end

  test "sanitize model replaces spaces with underscores" do
    assert_equal "Outlander_sport", stanitize_model_names("Outlander sport")
    assert_equal "Lancer_sportback", stanitize_model_names("Lancer sportback")
    assert_equal "Lancer_Evolution_X", stanitize_model_names("Lancer Evolution X")
  end

  test "sanitize model only replace '-' for '_' with '3-series'" do
    assert_equal "C-Class", stanitize_model_names("C-Class sedan")
    assert_equal "3_Series", stanitize_model_names("3-series sedan")
    assert_equal "CX-5", stanitize_model_names("CX-5")
  end

  test "clean up model leaves accaptable names alone" do
    assert_equal ["Lancer"], clean_up_model("Lancer")
    assert_equal ["Lancer", "sportback"], clean_up_model("Lancer sportback")
    assert_equal ["Lancer", "evolution", "X"], clean_up_model("Lancer evolution X")
  end

  test "clean up model removes 'sedan'" do
    assert_equal ["Lancer"], clean_up_model("Lancer sedan")
    assert_equal ["Lancer", "sportback"], clean_up_model("Lancer sportback sedan")
  end

  test "clean up model removes 'Tribeca/B9'" do
    assert_equal ["Tribeca"], clean_up_model("Tribeca/B9 Tribeca")
  end

  test "build data url" do
    assert_equal "http://dbpedia.org/data/Banana.json", build_data_url("Banana")
  end

  test "build resource url" do
    assert_equal "http://dbpedia.org/resource/Apple", build_resource_url("Apple")
  end

end
