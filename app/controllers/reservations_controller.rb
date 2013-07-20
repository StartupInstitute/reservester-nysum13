class ReservationsController < ApplicationController
  
  def index
  	rest = Rest.find(params[:rest_id])
  	@reservations = rest.reservations.all
  end

 def new
 	  rest = Rest.find(params[:rest_id])
  	@reservation = rest.reservations.new
 end

  def create
    rest = Rest.find(params[:rest_id])
    @reservation = rest.reservations.new(params[:reservation])

    if @reservation.save
       OwnerMailer.reservation_email(@reservation).deliver
       redirect_to([@reservation.rest, @reservation], :notice => "Reservation Created")
  else
      render 'new'
    end
  end

  def show
    rest = Rest.find(params[:rest_id])
    @reservation = rest.reservations.find(params[:id]) 
  end


  def destroy
    rest = Rest.find(params[:rest_id])
    @reservation = rest.reservations.find(params[:id])
    @reservation.destroy
    redirect_to((rest_reservations_url), :notice => "Reservation Deleted")
  end
end

