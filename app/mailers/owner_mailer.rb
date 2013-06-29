class OwnerMailer < ActionMailer::Base
  default from: 'huge.ma@gmail.com'

	def notify_reservation(reservation)
		@reservation = reservation
		@restaurant = Restaurant.find(@reservation.restaurant_id)
		@owner = Owner.find(@restaurant.owner_id)
		mail(to: @owner.email, subject: "New reservation at #{@restaurant.name}")
	end

end
