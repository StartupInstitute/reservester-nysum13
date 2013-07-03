class OwnersController < ApplicationController
	before_filter :authenticate_owner!

  def dashboard
  	@owner = current_owner
  	@restaurants = @owner.restaurants
  end

end
