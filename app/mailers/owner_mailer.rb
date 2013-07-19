class OwnerMailer < ActionMailer::Base
  default from: "admin@reservester.com"

  def reservation_email(reservation)
  	@reservation = reservation
  	@owner_name = reservation.rest.owner.name
  	@owner_email = reservation.rest.owner.email
  	mail(to: @owner_email, subject: 'Reservation Received')
  end
end
