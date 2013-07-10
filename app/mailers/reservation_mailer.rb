class ReservationMailer < ActionMailer::Base

  def reservation_confirmation(reservation)
     @reservation = reservation
    mail(to: reservation.reserver_email ,
         from: "budisugianto777@gmail.com",
         subject: "Your Reservation Confirmed")
  end
end
