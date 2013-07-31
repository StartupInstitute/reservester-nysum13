class UserMailer < ActionMailer::Base
  
  default :from => "jaimeesonominang@gmail.com"

  def reservation_confirmation(reservation)
  	mail(:to => reservation.email, :subject => "Confirmation")

  end 
end
