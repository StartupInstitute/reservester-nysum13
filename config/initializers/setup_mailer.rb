ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "",
    :user_name            => "",
    :password             => "s",
    :authentication       => "plain",
    :enable_starttls_auto => true
}