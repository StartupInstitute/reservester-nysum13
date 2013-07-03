class RestaurantsController < ApplicationController
  def index
  	@restaurants = Restaurant.all
  end

  def show
  	@restaurant = Restaurant.find(params[:id])
  end

  def new
  	@restaurant = Restaurant.new
  end

  def create
  	@restaurant = Restaurant.new(params[:restaurant])

  	if @restaurant.save
  		redirect_to @restaurant, notice: 'Restaurant was successfully saved!'
  	else
  		render action: "new"
  	end
  end

  def edit
  	@restaurant = Restaurant.find(params[:id])
  end

  def update
  	@restaurant = Restaurant.find(params[:id])

  	if @restaurant.update_attributes(params[:restaurant])
  		redirect_to @restaurant, notice: 'Restaurant was successfully updated!'
  	else
  		render action: 'edit'
  	end
  end

  def destroy
  	@restaurant = Restaurant.find(params[:id])
  	@restaurant.destroy
  	redirect_to restaurants_path, notice: 'Restaurant was successfully deleted!'
  end

  def download_menu
    @restaurant = Restaurant.find(params[:id])
    send_file(@restaurant.menu.path,
        :type => 'application/pdf',
        :disposition => 'attachment',
        :url_based_filename => true)
  end
end
