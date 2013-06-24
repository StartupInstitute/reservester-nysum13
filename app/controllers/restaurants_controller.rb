class RestaurantsController < ApplicationController
  before_filter :authenticate_owner!, except: [:index, :show]
  # before_filter :check_if_owner, only: [:edit, :update, :destroy]
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
    if @restaurant.save
      redirect_to restaurants_path
    else
      flash[:error] = "<ul>" + @restaurant.errors.full_messages.map{|o| "<li>" + o + "</li>" }.join("") + "</ul>"
      redirect_to new_restaurant_path
    end
  end

  def edit
    debugger
    check_if_owner(Restaurant.find(params[:id]))
    @restaurant = current_owner.restaurants.find(params[:id])
  end

  def update
    @restaurant = current_owner.restaurants.find(params[:id])
    @restaurant.update_attributes(params[:restaurant])
    # if flash[:error]
    #   flash[:error] = "<ul>" + @restaurant.errors.full_messages.map{|o| "<li>" + o + "</li>" }.join("") + "</ul>"
    #   redirect_to edit_restaurant_path
    # else
      redirect_to restaurant_path(@restaurant)
    # end
  end

  def destroy
    @restaurant = current_owner.restaurants.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end
  
  private
  
    def check_if_owner(restaurant)
      begin
      current_owner.check_ownership(restaurant)
      rescue Exception
        redirect_to :back
        return
      end
    end
  
end
