require 'test_helper'

class WikipediaHelperTest < ActionView::TestCase

  setup do
    stub_requests
  end

  test "get wikipedia summary" do
    skip('using a gem now so needs to change')
    urls = {
      data_url: "https://dbpedia.org/data/Mitsubishi_Motors.json",
      resource_url: "https://dbpedia.org/resource/Mitsubishi_Motors"
    }

    assert_equal "Error Fectching information....we are looking into it", get_wikipedia_summary(urls)
  end

  test "get manufacturer summary" do
    skip('mocking data required')
    assert_equal "Error Fectching information....we are looking into it", get_manufacturer_summary('Mitsubishi')
  end

  test "get model summary" do
    skip("mocking data required")
    assert_equal ":(", get_model_summary("Mitsubishi", "")
  end

  test "wikipediarize model names returns wikipedia-friendly names" do
    assert_equal "Mitsubishi Lancer", wikipediarize_model("Mitsubishi", "Lancer")
    assert_equal "Mitsubishi Lancer Evolution X", wikipediarize_model("Mitsubishi", "Lancer Evolution X")
  end

  test "sanitize model only replace '-' for ' ' with '3-series'" do
    assert_equal "C-Class", stanitize_model_names("C-Class sedan")
    assert_equal "3 Series", stanitize_model_names("3-series sedan")
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

end
