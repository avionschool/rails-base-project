# require 'stripe'
Stripe.api_key = ENV["STRIPE_SECRET"]

# # list customers
# Stripe::Customer.list()

# # retrieve single customer
# Stripe::Customer.retrieve('cus_123456789')
