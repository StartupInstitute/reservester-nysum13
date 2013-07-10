class RestaurantsController < ApplicationController
  before_filter :authenticate_owner!, :except => [:index, :show]
  before_filter :check_ownership!, :only => [:edit, :update, :destroy]

  def index
    @restaurants = Restaurant.text_search(params[:query]).page(params[:page]).per_page(10)
    #@json = Restaurant.all.to_gmaps4rails
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @restaurants }
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @json = Restaurant.find(params[:id]).to_gmaps4rails
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @restaurant }
    end
  end

  def new
    @restaurant = Restaurant.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @restaurant }
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(params[:restaurant])
    @restaurant.owner_id = current_owner.id
    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render json: @restaurant, status: :created, location: @restaurant }
      else
        format.html { render action: "new" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.owner_id = current_owner.id
    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url }
      format.json { head :no_content }
    end
  end

  private
  def check_ownership!
    if current_owner.ownership?(params[:id])
      return
    else
      flash[:error] = "You are not the owner of this restaurant"
      redirect_to index
    end

  end

end
