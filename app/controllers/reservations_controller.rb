class ReservationsController < ApplicationController
  
  def index
  	@rest = Rest.find(params[:rest_id])
  	@reservations = @rest.reservations.all
  end

 def new
 	  @rest = Rest.find(params[:rest_id])
  	@reservation = @rest.reservations.new
 end

  def create
    rest = Rest.find(params[:rest_id])
    @reservation = rest.reservations.new(params[:reservation])

    if rest.save
    redirect_to rest_reservation_path(rest, @reservation)
  else
      render 'new'
    end
  end

 def show
  @reservation = Reservation.find(params[:id])
 end

end
