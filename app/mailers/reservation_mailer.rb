class ReservationMailer < ActionMailer::Base
  default from: "team.reservester@gmail.com"

  def confirmation(reserver, restaurant)
  	@reserver = reserver
  	@restaurant = restaurant

  	mail(to: @reserver.email, subject: 'Your reservation is confirmed!')
  end
end
