class ReservationMailer < ActionMailer::Base
  default from: "reservations@reservester.com"

  def reservation_notification(reservation)
    @reservation = reservation
    @owner_email = reservation.restaurant.owner.email
    mail(:to => @owner_email, :subject => "Reservation for #{reservation.restaurant.name}")
  end
end
