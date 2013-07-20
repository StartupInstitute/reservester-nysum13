class OwnerMailer < ActionMailer::Base
  default from: "admin@reservester.com"

  def reservation_email(reservation)
  	@reservation = reservation
  	mail(to: @reservation.rest.owner.email, subject: 'A New Reservation Has Been Created')
  end
end
