class ReservationsController < ApplicationController
  def index
    restaurant = Restaurant.find(params[:restaurant_id])
    @reservations = restaurant.reservations.text_search(params[:query]).page(params[:page]).per_page(10)
  end

  def show
    restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = restaurant.reservations.find(params[:id])
  end

  def new
    restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = restaurant.reservations.build
  end

  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = restaurant.reservations.create(params[:reservation])
    if @reservation.save # && verify_recaptcha()
      redirect_to [@reservation.restaurant, @reservation] , :notice => 'Reservation was successfully created. '
      ReservationMailer.reservation_confirmation(@reservation).deliver
    else
      render :action => 'new'
    end
  end

  def edit
    restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = restaurant.reservations.find(params[:id])
  end

  def update
    restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = restaurant.reservations.find(params[:id])
    if @reservation.update_attributes(params[:reservation])
      redirect_to [@reservation.restaurant, @reservation] , :notice => 'Reservation was successfully updated. '
    else
      render :action => 'edit'
    end
  end

  def destroy
    restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = restaurant.reservations.find(params[:id])
    @reservation.destroy
    redirect_to restaurant_reservations_path(@reservation.restaurant) , :notice => 'Reservation was successfully deleted. '
  end
end
