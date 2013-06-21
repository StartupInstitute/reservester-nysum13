require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurants)
  end

  test "should get show" do
    get :show, id: @restaurant
    assert_response :success

    get :show, id: "-1"
    assert_redirected_to restaurant_path
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post :create, restaurant: {
        name: @restaurant.name, 
        description: @restaurant.description, 
        address: @restaurant.address, 
        phone: @restaurant.phone}
      end
      assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should update restaurant" do
    put :update, id: @restaurant, restaurant: {
      name: @restaurant.name,
      description: @restaurant.description,
      address: @restaurant.address,
      phone: @restaurant.phone}
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete :destroy, id: @restaurant
    end
    assert_redirected_to restaurants_path
  end

end
