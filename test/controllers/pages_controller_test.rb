require 'test_helper'

class PagesControllerTest < ActionController::TestCase

  setup do
    stub_requests
  end

  test "should get home" do
    get :home

    assert_response :success
    assert_select "title", "Home"
  end

  test "should get about" do
    get :about

    assert_response :success
    assert_select "title", "About"
  end

  test "should get help" do
    get :help

    assert_response :success
    assert_select "title", "Help"
  end

end
