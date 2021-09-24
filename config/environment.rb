# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 465,
  domain: 'gmail.com',
  user_name: Rails.application.credentials[:gmail_user_name],
  password: Rails.application.credentials[:gmail_app_password],
  authentication: 'plain',
  :ssl => true,
  :tsl => true,
  enable_starttls_auto: true
}
