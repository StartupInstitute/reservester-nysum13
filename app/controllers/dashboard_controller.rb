class DashboardController < ApplicationController
  before_filter :authenticate_owner!
  
  def show
    @restaurants = current_owner.restaurants
  end
end
