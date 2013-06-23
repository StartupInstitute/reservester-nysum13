require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  
	test "index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:restaurant)
	end
end
