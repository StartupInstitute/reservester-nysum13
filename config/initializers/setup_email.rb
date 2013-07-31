ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port    => 587,
	:domain  => "reservester.com",
	:user_name => ENV["EMAIL"],
	:password => ENV["PASSWORD"],
	:authentication => "plain",
	:enable_starttls_auto => true

}
