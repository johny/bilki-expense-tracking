ActionMailer::Base.smtp_settings = {
  :user_name => Figaro.env.mandrill_username,
  :password => Figaro.env.mandrill_password,
  :domain => Figaron.env.mandrill_domain,
  :address => 'smtp.mandrillapp.com',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
