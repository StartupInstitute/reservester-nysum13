class ReservationMailer < ActionMailer::Base
  default from: "kashyap.bhatt15@gmail.com"

  def reservation_notification_user_email(reservation)
    @reservation = reservation
    @url  = 'http://localhost:3000'
    @subject = "Your reservation at #{@reservation.restaurant.name} is received"
    mail(to: @reservation.email, subject: @subject)
  end

  def reservation_notification_owner_email(reservation)
    @reservation = reservation
    @url  = 'http://localhost:3000'
    @subject = "New reservation for #{@reservation.restaurant.name} is received"
    mail(to: @reservation.restaurant.owner.email, subject: @subject)
  end


end
