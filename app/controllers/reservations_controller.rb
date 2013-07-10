class ReservationsController < ApplicationController
  
  def index
  	@rest = Rest.find(params[:rest_id])
  	@reservation = @rest.reservations.all
  end

 def new
 	@rest = Rest.find(params[:rest_id])
  	@reservation = @rest.reservations.new
 end
end
