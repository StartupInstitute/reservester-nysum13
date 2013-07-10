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
    if check_if_owner
      @restaurant = current_owner.restaurants.find(params[:id])
    end
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
    if check_if_owner
      @restaurant = Restaurant.find(params[:id])
      @restaurant.destroy
      redirect_to restaurants_url
    end
  end

private

  def check_if_owner
    if current_owner.has_ownership?(Restaurant.find(params[:id]))
      return true
    else
      flash[:error]="I'm afraid I can't let you do that #{current_owner.email}."
      redirect_to :back
      return false
    end
  end

end
