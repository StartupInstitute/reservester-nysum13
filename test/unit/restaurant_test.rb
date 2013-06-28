require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save without name" do
  	restaurant = Restaurant.new()
  	assert !restaurant.save, "Saved restaurant without a name"
  end

  test "should save with all fields" do
  	restaurant = Restaurant.new({:name => "Wendy's", :description => "Great!", :address => "81st Street and Broadway", :phone => "1234567890"})
  	assert restaurant.save, "Could not save with all fields"
  end

end
