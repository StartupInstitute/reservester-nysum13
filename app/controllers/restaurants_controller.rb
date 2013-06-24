class RestaurantsController < ApplicationController
  skip_before_filter :authenticate_owner!, :only => [:index, :show]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = current_owner.restaurants.new
  end

  def create
    @restaurant = current_owner.restaurants.build(params[:restaurant])
  
    if @restaurant.save #ensure restaurant has been saved
      redirect_to @restaurant, notice: 'Restaurant was successfully created!'
    else
      render action: "new"
    end
  end

  def edit
    @restaurant = current_owner.restaurants.find(params[:id])
  end

  def update
    @restaurant = current_owner.restaurants.find(params[:id])

    if @restaurant.update_attributes(params[:restaurant])
      redirect_to @restaurant, notice: 'Restaurant was successfully updated!'
    else
      render action: "edit"
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_url
  end
end
