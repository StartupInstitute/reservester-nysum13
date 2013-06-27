class DashboardController < ApplicationController
  before_filter :authenticate_owner!

  def index
    restaurant = Restaurant.all
    @reservations = restaurant
  end
end
