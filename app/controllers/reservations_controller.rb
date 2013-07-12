class ReservationsController < ApplicationController
  before_filter :find_restaurant

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def index
    @reservations = Reservation.where(["restaurant_id = ?", @restaurant.id])
  end

  def show
    @reservation = @restaurant.reservations.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def edit
    @reservation = @restaurant.reservations.find(params[:id])
  end

  def create
    @reservation = @restaurant.reservations.new(params[:reservation])
    date = @reservation.date

    if @reservation.save

      #if @restaurant.calendar.has_key?(date)
      #  @restaurant.calendar[date].append(@reservation)
      #else
      #  @restaurant.calendar[date] = [@reservation]
      #end
      UserMailer.notify_reservation(@reservation).deliver
      redirect_to [@restaurant,@reservation], notice: 'Reservation was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @reservation = @restaurant.reservations.find(params[:id])

    if @reservation.update_attributes(params[:reservation])
      redirect_to @reservation, notice: 'Reservation was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @reservation = @restaurant.reservations.find(params[:id])
    @reservation.destroy

    redirect_to restaurant_reservations_path(@restaurant)
  end

end
