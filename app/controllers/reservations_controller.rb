class ReservationsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build(params[:reservation])
    @reservation.update_attributes(user_id: current_user.id, owner_id: @restaurant.owner.id)
    # if @reservation.valid_with_captcha?
    if @reservation.save
      @restaurant.owner.send_reservation_notification(@reservation)
      redirect_to restaurant_path(Restaurant.find(params[:restaurant_id])), notice: "Your reservation has been created."
    else
      flash[:error] = "#{(@reservation.errors.full_messages[0]).gsub("Reservation", '')}" 
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
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    
    redirect_to @reservation.restaurant
  end
end
