class ReservationsController < ApplicationController
	before_filter :get_restaurant, only: [:show, :edit, :update, :destroy]

	def index
		@reservations = Reservations.all

		respond_to do |format|
			format.html
		end
	end

	def show
		get_restaurant
		@reservation = Reservations.find(params[:restaurant_id])

		respond_to do |format|
			format.html
		end
	end

	def new
		get_restaurant
		@reservation = @restaurant.reservations.build
	end

	def create
		get_restaurant
		@reservation = @restaurant.reservations.create(params[:reservation])

		respond_to do |format|
			if @reservation.save
				flash[:notice] = "Reservation successfully created!"
				format.html { redirect_to restaurant_path(@restaurant) }
				ReservationMailer.confirmation(@reservation, @restaurant).deliver
      		else
        		flash[:error] = "Sorry, your input is incorrect. Try creating your reservation again."
        		format.html { redirect_to restaurant_path(@restaurant) }
      		end
      	end
	end

	def edit

	end

	def update

	end

	def destroy

	end

	protected

	def get_restaurant
		@restaurant = Restaurant.find(params[:restaurant_id])
	end
end
