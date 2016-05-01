# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Zomato::Application.initialize!

Zomato::Application.configure   do

config.action_mailer.delivery_method = :smtp

config.action_mailer.smtp_settings={
	:address => "smtp.gmail.com",
	:port =>587,
	:domain => "gmail.com",
	:authentication => "plain",
	:user_name => "naveen3992",
	:password => "",
	:enable_starttls_auto => true

}


end
	


