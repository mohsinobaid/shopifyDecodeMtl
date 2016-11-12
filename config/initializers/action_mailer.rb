Rails.application.configure do
  config.action_mailer.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 25,
    :enable_starttls_auto => true,
    :user_name => "deCODE",
    :password  => "Vgar80AexFJpFgTmeFOAFQ",
    :authentication => 'login',
    :domain => 'eljojo.me'
  }
end