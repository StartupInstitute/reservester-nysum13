class UserMailer < ActionMailer::Base
  default from: 'huge.ma@gmail.com'

	def notify_reservation(reservation)
		@reservation = reservation
		@restaurant = Restaurant.find(@reservation.restaurant_id)
		@user = user.find(@restaurant.user_id)
		mail(to: @user.email, subject: "New reservation at #{@restaurant.name}")
	end

end
