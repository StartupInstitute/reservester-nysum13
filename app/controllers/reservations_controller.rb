class ReservationsController < ApplicationController
  def index
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build(params[:reservation])
    # if @reservation.valid_with_captcha?
    if @reservation.save
      @restaurant.owner.send_reservation_notification(@reservation)
      redirect_to restaurant_path(Restaurant.find(params[:restaurant_id])), notice: "Your reservation has been created."
    else
      # flash[:error] = "Captcha incorrect. You enterd the wrong digits." 
      redirect_to :back
    end
  end

  def show
  end

  def edit

  end

  def update
  end

  def destroy
    debugger
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    
    redirect_to @reservation.restaurant
  end
end
