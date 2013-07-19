class OwnersController < ApplicationController
	before_filter :authenticate_owner!
	
	def dashboard
		@owner = current_owner
		@restaurants = current_owner.restaurants.all

		respond_to do |format|
			format.html
		end
	end
end
