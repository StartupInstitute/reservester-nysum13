require 'test_helper'

class StaticsControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get welcome" do
      get :welcome
      assert_response :success
  end
end
