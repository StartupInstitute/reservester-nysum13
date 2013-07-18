class OwnerMailer < ActionMailer::Base
  default from: "from@example.com"

  def reservation_email(owner)
  	@owner = owner
  	@rest = 'http://example.com/login'
  	mail(to: @owner.email, subject: 'Welcome to Reservester')
  end
end
