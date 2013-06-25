class ReservationsController < ApplicationController
  def index
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build(date: DateTime.new(params[:date]["date(1i)"].to_i, params[:date]["date(2i)"].to_i, params[:date]["date(3i)"].to_i), time: (params[:time][:hour]).to_i)
    if @reservation.valid_with_captcha?
      @reservation.save
      @restaurant.owner.send_reservation_notification(@reservation)
      redirect_to restaurant_path(Restaurant.find(params[:restaurant_id]))
    else
      flash[:error] = "Captcha incorrect. You enterd the wrong digits." 
      redirect_to :back
    end
  end

  def show
  end

  def edit

  end

  def update
  end

  def delete
  end
end
