# Load the Rails application.
require_relative "application"

token = File.join(Rails.root, 'config', 'token.rb')
load(token) if File.exist?(token)
# Initialize the Rails application.
Rails.application.initialize!
