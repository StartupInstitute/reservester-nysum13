class ReservationsController < ApplicationController
	def create
    @restaurant = Restaurant.find params[:restaurant_id]
    @reservation = @restaurant.reservations.build params[:reservation]

    if @reservation.save
      ReservationMailer.reservation_notification_user_email(@reservation).deliver
      ReservationMailer.reservation_notification_owner_email(@reservation).deliver
     
      redirect_to @restaurant, :notice => 'Your reservation has been created'
    else
      render 'restaurants/show', :error => 'For some unknown reasons your reservation was not sent to restaurant'
      #redirect_to root_path
    end
  end

  def destroy
    @reservation = Reservation.find params[:id]
    @reservation.destroy

    redirect_to @reservation.restaurant
  end
end
