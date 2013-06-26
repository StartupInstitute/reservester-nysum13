class RestaurantsController < ApplicationController

  before_filter :authenticate_owner!, :except => [:index, :show]
  before_filter :require_restaurent_owner_match!, :only => [:edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])

    @reservation = Reservation.new
    @reservation.restaurant = @restaurant
  end

  def new
    @owner = Owner.find(params[:owner_id])
    @restaurant = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @owner = Owner.find(params[:owner_id])
    @restaurant = @owner.restaurants.build(params[:restaurant])

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

    redirect_to restaurants_url
  end
end
