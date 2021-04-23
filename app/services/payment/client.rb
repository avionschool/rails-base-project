module Payment
  class Client
    # public_key: Rails.application.credentials.PAYMONGO_PUBLIC_TOKEN
    # secret_key: Rails.application.credentials.PAYMONGO_SECRET_TOKEN

    def self.process_payment
      byebug
      payment_intent = create_payment_intent
      payment_method = create_payment_method
      attached_payment_intent = attach_payment_intent(payment_intent.id, payment_method.id)
      retrieved_payment_intent = retrieve_payment_intent(payment_intent.id)
      
      return retrieved_payment_intent.status
    end

    def self.create_payment_intent
      result = RestClient::Request.execute(
        header: {
          "Authorization": "Basic #{Rails.application.credentials.PAYMONGO_SECRET_TOKEN}"
        },
        method: 'POST',
        url: 'https://api.paymongo.com/v1/payment_intents',
        payload: {
          data: {
          "attributes":{
            "amount": 10000,
            "payment_method_allowed":["card"],
            "payment_method_options":{"card":{"request_three_d_secure":"any"}},
            "currency":"PHP",
            "description":"Test API",
            "livemode":false,
            "description":"Test API Transaction"}
        }}
      )
    end

    def self.create_payment_method
      result = RestClient::Request.execute(
        header: {
          "Authorization": "Basic #{Rails.application.credentials.PAYMONGO_SECRET_TOKEN}"
        },
        method: 'POST',
        url: 'https://api.paymongo.com/v1/payment_methods',
        payload: {
          data: {
          "attributes":{
            "details": {
              "card_number":"4343434343434345",
              "exp_month":4,
              "exp_year":2022,
              "cvc":"096"},
            "type":"card"
        }}}
      )
    end

    def self.attach_payment_intent(payment_intent_id, payment_method_id)
      result = RestClient::Request.execute(
        header: {
          "Authorization": "Basic #{Rails.application.credentials.PAYMONGO_SECRET_TOKEN}"
        },
        method: 'POST',
        url: "https://api.paymongo.com/v1/payment_intents/#{payment_intent_id}/attach",
        payload: {
          data: {
          "attributes":{
            "payment_method":payment_method_id}
        }}
      )
    end

    def self.retrieve_payment_intent(payment_intent_id)
      result = RestClient::Request.execute(
        header: {
          "Authorization": "Basic #{Rails.application.credentials.PAYMONGO_SECRET_TOKEN}"
        },
        method: 'GET',
        url: "https://api.paymongo.com/v1/payment_intents/#{payment_intent_id}"
      )
    end

  end
end
