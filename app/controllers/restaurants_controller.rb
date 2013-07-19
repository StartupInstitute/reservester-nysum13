class RestaurantsController < ApplicationController
	before_filter :authenticate_owner!, except: [:index, :show]
  	before_filter :check_if_owner, only: [:edit, :update, :destroy]

	def index
		@restaurants = Restaurant.all 

		respond_to do |format|
			format.html 
			format.json { render :json => @restaurants}
		end 
	end

	def show
		@restaurant = Restaurant.find(params[:id])

		respond_to do |format|
      		format.html # show.html.erb
      		format.json { render json: @restaurant }
    	end
	end
	
	def new
		@restaurant = current_owner.restaurants.new
	end
	
	def create
		@restaurant = current_owner.restaurants.new(params[:restaurant])

		respond_to do |format|
			if @restaurant.save
				format.html { redirect_to @restaurant, notice: "Restaurant successfully created!" }
				format.json { render json: @restaurant, status: :created, location: @restaurant }
      		else
        		format.html { render action: "new" }
        		format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      		end
      	end
	end
	
	def edit
		@restaurant = current_owner.restaurants.find(params[:id])
	end
	
	def update
		@restaurant = current_owner.restaurants.find(params[:id])

		respond_to do |format|
			if @restaurant.update_attributes(params[:restaurant])
				format.html { redirect_to @restaurant, notice: "Restaurant Update Complete."}
				format.json { head :no_content}
			else
				format.html { render action: "edit" }
				format.json { render json: @restaurant.errors, status: :unprocessable_entity }
			end
		end
	end
	
	def destroy
		@restaurant = current_owner.restaurants.find(params[:id])
		@restaurant.destroy

		respond_to do |format|
			format.html { redirect_to restaurants_path }
			format.json { head :no_content }
		end 
	end

private

	def check_if_owner 
		if current_owner.has_ownership?(Restaurant.find(params[:id]))
		else
			flash[:error] = "This action is for eligible restaurant owners only."
			redirect_to :back
		end
	end
end