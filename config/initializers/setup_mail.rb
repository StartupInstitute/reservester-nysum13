ActionMailer::Base.smtp_settings = {
	address: 'smtp.gmail.com', 
	port: 587, 
	domain: 'immense-lake-9635.herokuapp.com', 
	user_name: ENV["EMAIL"], 
	password: ENV["PASSWORD"], 
	authentication: 'plain', 
	enable_starttls_auto: true }