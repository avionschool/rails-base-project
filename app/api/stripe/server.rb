# require 'sinatra'
# require 'stripe'
# # This is your real test secret API key.
# Stripe.api_key = 'sk_test_51Jfc8aE1nkI5RKr1DOlxP3ziycZ2uRX0HKhrDBI4sDMcTkbm47VLIPGFlyhHR2r16Osvl6doSsJE3MQ5DhK6eoKI00CY6a80QC'

# set :static, true
# set :port, 4242

# # Securely calculate the order amount
# def calculate_order_amount(_items)
#   # Replace this constant with a calculation of the order's amount
#   1400
# end

# # An endpoint to start the payment process
# post '/create-payment-intent' do
#   content_type 'application/json'
#   data = JSON.parse(request.body.read)

#   # Create a PaymentIntent with amount and currency
#   payment_intent = Stripe::PaymentIntent.create(
#     amount: calculate_order_amount(data['items']),
#     currency: 'usd'
#   )

#   {
#     clientSecret: payment_intent['client_secret'],
#   }.to_json
# end
