class ReservationsController < ApplicationController
  

  def new
  	  
  	  restaurant = Restaurant.find(params[:restaurant_id])
  	  @reservation = restaurant.reservations.build
  	

  end

  def create
    #1st you retrieve the post thanks to params[:post_id]
    
    restaurant = Restaurant.find(params[:restaurant_id])
    #2nd you create the comment with arguments in params[:comment]
    @reservation = restaurant.reservations.create(params[:reservation])
    #@reservation.update_attributes(date: params[:date])
    	if @reservation.save
    		redirect_to restaurant_reservation_path(restaurant,@reservation),
    		:notice => "reservetion went well"
    	end
    	
end


  def show
 	  @reservation = Reservation.find(params[:id])
  end

  def destroy
  end



end
