# Controller for restaurants
class RestaurantsController < ApplicationController
  
  # Creat an object for creating new restaurant
  def new
    @restaurant = Restaurant.new

    respond_to :html
  end
  
  # Save Restaurant with data from new form
  def create
    @restaurant = Restaurant.new(params[:restaurant])

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # Show all restaurants
  def index
    @restaurants = Restaurant.all
		respond_to :html
  end

	# Show restaurant details with given ID
  def show
    @restaurant = Restaurant.find(params[:id])

    respond_to :html
  end

  # Create an object for editing particular restaurant
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

	# Save update Restaurant
  def update
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    respond_to do |format|
    	format.html { redirect_to restaurants_path }
    end
  end
end
