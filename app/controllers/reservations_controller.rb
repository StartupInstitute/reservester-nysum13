class ReservationsController < ApplicationController
  
  def index
  	@rest = Rest.find(params[:rest_id])
  	@reservation = @rest.reservations.all
  end

 def new
 	  @rest = Rest.find(params[:rest_id])
  	@reservation = @rest.reservations.new
 end

  def create
    rest = Rest.find(params[:rest_id])
    @reservation = rest.reservations.new(params[:reservation])

    if @reservation.save
    redirect_to(rest_reservation_path(rest, @reservation), :notice => "Reservation Created")
  else
      render 'new'
    end
  end

 def show
  @rest = Rest.find(params[:rest_id])
  @reservation = @rest.reservations.find(params[:id]) 
  end
end

