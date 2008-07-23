ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "en21.org",
  :authentication => :plain,
  :user_name => "mailer@en21.org",
  :password => "mailer123sender"
}

#ActionMailer::Base.delivery_method = :smtp
#ActionMailer::Base.smtp_settings = {
#  :address    => "localhost",
#  :domain     => "icardmobile.net",
#}

ExceptionNotifier.exception_recipients = %w(mergulhao83@gmail.com)
ExceptionNotifier.email_prefix = "[BUG AZMT] "
ExceptionNotifier.sender_address = %(support@icardmobile.net)
