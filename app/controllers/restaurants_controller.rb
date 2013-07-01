# Controller for restaurants
class RestaurantsController < ApplicationController
  before_filter :authenticate_owner!, only: [:new, :create, :destroy, :edit, :update]
  # Creat an object for creating new restaurant

  before_filter :check_if_owner!, only: [:edit, :update, :destroy]

  def new
    @restaurant = Restaurant.new

    respond_to :html
  end
  
  # Save Restaurant with data from new form
  def create
    
    @restaurant = Restaurant.new(params[:restaurant])
    # Owner id can't be mass-assigned
    @restaurant.owner_id = current_owner.id
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
    
    @restaurant.remove_image!
    @restaurant.remove_menu!
    @restaurant.destroy


    respond_to do |format|
    	format.html { redirect_to restaurants_path }
    end
  end

  private
    def check_if_owner!
      if current_owner.own?(params[:id])
        return
      else
        flash[:error] = "Woo!!! You are not owner of this restaurant"
        redirect_to request.env["HTTP_REFERER"]
      end

    end
end
