class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all 

		respond_to do |format|
			format.html 
			format.json { render :json => @restaurants}
		end 
	end

	def show
		@restaurants = Restaurant.find(params[:id])
	end
	
	def new
		@restaurant = Restaurant.new
	end
	
	def create
		@restaurant = Restaurant.new(params[:restaurant])

		respond_to do |format|
			if @restaurant.save
				format.html { redirect_to @restaurant, notice: 'Restaurant added!' }
				format.json { render json: @fact, status: :created, location: @fact }
      		else
        		format.html { render action: "new" }
        		format.json { render json: @fact.errors, status: :unprocessable_entity }
      		end
      	end
	end
	
	def edit

	end
	
	def update

	end
	
	def destroy

	end
end
