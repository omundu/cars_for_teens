require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  setup do
    stub_requests
  end

  test "should get index" do
    get :index

    assert_response :success
    assert_select "title", "Categories"
  end

  test "should get show" do
    get :show, :params => {:category => "Rally Car"}

    assert_response :success
    assert_select "title", "Rally Car"
  end

  test "should get model" do
    get :model, :params => {:category => "Rally Car", :model => "Mitsubishi Lancer Evolution"}

    assert_response :success
    assert_select "title", "Mitsubishi Lancer Evolution"
  end

  test "should get year" do
    get :year, :params => {:category => "Rally Car", :model => "Mitsubishi Lancer Evolution", :year => "2010"}

    assert_response :success
    assert_select "title", "Mitsubishi Lancer Evolution 2010"
  end

end
