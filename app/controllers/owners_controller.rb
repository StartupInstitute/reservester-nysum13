class OwnersController < ApplicationController

  def index
  	@owner = current_owner
  	@restaurants = @owner.restaurants
  end

  def dashboard
  	@owner = current_owner
  	@restaurants = @owner.restaurants
  end

end
