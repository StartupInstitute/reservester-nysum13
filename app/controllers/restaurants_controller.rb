class RestaurantsController < ApplicationController
  before_filter :authenticate_owner!, :except => [:show, :index] 
   
  before_filter :check_if_owner!, :only => [:edit, :update, :destroy]

 def index
    @restaurants = Restaurant.all
      respond_to do |format|
    format.html  # show.html.erb
    format.json  { render :json => @restaurant }
    end
  end

 def show
       @restaurant = Restaurant.find(params[:id])
          respond_to do |format|
    format.html  # show.html.erb
    format.json  { render :json => @restaurant }
    end
  end

 def new
       @restaurant = Restaurant.new
         respond_to do |format|
    format.html  # new.html.erb
    format.json  { render :json => @restaurant }
  end
 end

 def create
  
  @restaurant = Restaurant.new(params[:restaurant])
  @restaurant.owner_id = current_owner.id
  @restaurant.save
  redirect_to restaurants_path
 end
 def edit

  @restaurant = Restaurant.find(params[:id])
end
def update
  @restaurant = Restaurant.find(params[:id])
 
  respond_to do |format|
    if @restaurant.update_attributes(params[:restaurant])
      format.html  { redirect_to(@restaurant,
                    :notice => 'Post was successfully updated.') }
      format.json  { head :no_content }
    else
      format.html  { render :action => "edit" }
      format.json  { render :json => @restaurant.errors,
                   :status => :unprocessable_entity }
    end 
    
    end
end



def destroy
  @restaurant = Restaurant.find(params[:id])
  @restaurant.delete
 

  redirect_to restaurants_path
end 
  
  private 

  def check_if_owner!
     if current_owner.has_ownership?(params[:id])
       return 
      else
       flash[:notice] = 'You dont have permission to do that'
       redirect_to :back
    end


  end

  
end





