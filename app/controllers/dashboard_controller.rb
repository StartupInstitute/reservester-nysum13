class DashboardController < ApplicationController

  def index
   @restaurants = current_owner.restaurants
   end
end
