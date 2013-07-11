class RestaurantsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index, :show]

  def index
    @restaurants = Restaurant.all
    @json = @restaurants.to_gmaps4rails
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @json = @restaurant.to_gmaps4rails
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])

    if !@restaurant.is_user?(current_user)
      redirect_to @restaurant, notice: 'You are not the user!'
    end
  end

  def create
    @restaurant = current_user.restaurants.new(params[:restaurant])

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update_attributes(params[:restaurant])
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to restaurants_path
  end
end
