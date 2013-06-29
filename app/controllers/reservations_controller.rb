class ReservationsController < ApplicationController

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservations = Reservation.where(["restaurant_id = ?", @restaurant.id])
  end

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.find(params[:id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.find(params[:id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.new(params[:reservation])

    if @reservation.save
      OwnerMailer.notify_reservation(@reservation).deliver
      redirect_to [@restaurant, @reservation], notice: 'Reservation was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.find(params[:id])

    if @reservation.update_attributes(params[:reservation])
      redirect_to @reservation, notice: 'Reservation was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.find(params[:id])
    @reservation.destroy

    redirect_to restaurant_reservations_path
  end

end
