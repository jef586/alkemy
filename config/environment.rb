# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV["SMTP_USERNAME"],
  :password => ENV["SMTP_PASSWORD"],
  :domain => ENV["SMTP_USER_DOMAIN"],
  :address => ENV["SMTP_ADDRESS"],
  :port => ENV["SMTP_PORT"].to_i,
  :authentication => :plain,
  :enable_starttls_auto => true
}