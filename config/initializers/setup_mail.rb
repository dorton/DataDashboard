ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "hattech.net",
  :user_name            => "learningwalk@hattech.net",
  :password             => "Bennington525",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

