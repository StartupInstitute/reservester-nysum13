# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Reservester::Application.initialize!

ENV['RECAPTCHA_PUBLIC_KEY']  = ENV["RECAPTCHA_PUBLIC_KEY"]
ENV['RECAPTCHA_PRIVATE_KEY'] = ENV["RECAPTCHA_PRIVATE_KEY"]
