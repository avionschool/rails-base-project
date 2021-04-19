# Load the Rails application.
require_relative 'application'

#Load app's custom environment variables here, before environment/*.rb
smtp_env_vars = File.join(Rails.root, 'config', 'initializers', 'smtp_env_vars.rb')
load(smtp_env_vars) if File.exist?(smtp_env_vars)

# Initialize the Rails application.
Rails.application.initialize!
