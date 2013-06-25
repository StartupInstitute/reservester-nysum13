class OwnerMailer < ActionMailer::Base
  default from: "from@example.com"

    def reservation_notification(owner, reservation)
      @owner = owner
      @reservation = reservation
      # mail(:to => user.email, :subject => "Weekly Trim")
      mail(:to => "castillo@wow.com", :subject => "Reservation confirmation")
    end

end
