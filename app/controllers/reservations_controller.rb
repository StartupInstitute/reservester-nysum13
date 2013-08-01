class ReservationsController < ApplicationController
  

  def new
    restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = restaurant.reservations.build
  end

  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = restaurant.reservations.create(params[:reservation])
    if @reservation.save
      UserMailer.reservation_confirmation(@reservation).deliver
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
