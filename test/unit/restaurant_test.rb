require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
    test "the truth" do
        assert true
    end

    test "should not save restaurant without name" do
        restaurant = Restaurant.new({:description => "Description", :address => "Address", :phone => "1-212-555-5555"})
        assert !restaurant.save, "Saved a restaurant without an name"
    end
    
    test "should not save restaurant without address" do
        restaurant = Restaurant.new({:name => "Name", :description => "Description", :phone => "1-212-555-5555"})
        assert !restaurant.save, "Saved a restaurant without an address"
    end
    
    test "should not save restaurant without phone" do
        restaurant = Restaurant.new({:name => "Name", :description => "Description", :address => "Address"})
        assert !restaurant.save, "Saved a restaurant without a phone"
        restaurant = Restaurant.new({:name => "Name", :description => "Description", :address => "Address", :phone => "short"})
        assert !restaurant.save, "Saved a restaurant with a short phone"
    end

    test "should save a restaurant with all data provided" do
        restaurant = Restaurant.new({:name => "Name", :description => "Description", :address => "Address", :phone => "1-212-525-7672"})
        assert restaurant.save, "Didn't save a restaurant when all data was provided"
    end
end
